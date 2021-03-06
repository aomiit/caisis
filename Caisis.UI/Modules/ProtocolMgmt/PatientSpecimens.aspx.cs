﻿using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using Caisis.BOL;
using Caisis.Extensions;
using Caisis.Controller;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI.Core.Classes;
using Caisis.UI.ClientScript.Ajax;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientSpecimens : PatientSpecimenBasePage
    {
        private string[] PROC_INSTRUMENT_TYPES = new string[]
        {
            "Laurane",
            "End-fire side cutting needle",
            "Bonotpy",
            "Bard Trugide Max Core",
            "Paragon",
            "Temno-Act",
            "Temno Coaxial",
            "Murphy M2-Osteosite",
            "Osteo-Site",
            "Craig bx V. Mueller",
            "Murphy",
            "Temno-Coaxial ACT 1820",
            "Bone Cutting Needle",
            "Madison Pereforating",
            "Quick-Core"
        };

        Dictionary<string, string> IMG_FIND_NOTES_TO_INPUT = new Dictionary<string, string>()
            {
                { "Distance from cortex to lesion {0}cm", "ImgFindNotes_Cortext" },
                { "Distance from skin to lesion {0}cm", "ImgFindNotes_Skin" },
                { "Correlated by {0} Bone Scan", "ImgFindNotes_Bone" },
                { "Correlated by {0} PET Scan", "ImgFindNotes_PET" }
            };

        private ProtocolSpecimenAutoNumber[] bloodAutoSpecimens = new ProtocolSpecimenAutoNumber[0];

        protected string QuerySpecimenAccessionId
        {
            get
            {
                return Request.QueryString["SpecimenAccessionId"];
            }
        }

        SpecimenManagerDa da = new SpecimenManagerDa();

        private List<string> autoGeneratedSpecimenRefNum = new List<string>();

        private int? querySpecimenAccessionId = null;

        private bool forceSpecimenUpdate = false;

        public PatientSpecimens()
            : base()
        {
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            // set pri key
            string queryId = QuerySpecimenAccessionId;
            if (!string.IsNullOrEmpty(queryId))
            {
                querySpecimenAccessionId = int.Parse(queryId);
            }

            if (!Page.IsPostBack)
            {
                // build list of accessions
                BuildSpecimenAccession(querySpecimenAccessionId);
                // populate selected accession/blank data entry
                PopulateForm(querySpecimenAccessionId);

                // set ui visiblity: special tissue fields
                bool displayDissueFields = QuerySpecimenType == QUERY_TISSUE;
                Tissue_Fields.Visible = displayDissueFields;
                Tissue_DiagnosticFields.Visible = displayDissueFields;
            }
            // build static list
            DataTable comboData = new DataTable();
            comboData.Columns.Add(new DataColumn("AccessionProcInstrumentType"));
            foreach (string type in PROC_INSTRUMENT_TYPES)
                comboData.Rows.Add(type);
            AccessionProcInstrumentType.BuildComboData(comboData, "AccessionProcInstrumentType", "AccessionProcInstrumentType");
        }

        private void BuildSpecimenAccession(int? specimenAccessionId)
        {
            // set btn state
            if (specimenAccessionId.HasValue)
            {
                UpdateBtn.Text = "Update Accession";
            }
            else
            {
                UpdateBtn.Text = "Create Accession";
            }
        }

        private void PopulateForm(int? specimenAccessionId)
        {
            bool isNewAccession = !specimenAccessionId.HasValue;
            int patientId = int.Parse(BaseDecryptedPatientId);
            int ptProtocolId = int.Parse(PatientProtocolId);

            // set study id
            PatientProtocol ptProtocol = new PatientProtocol();
            if (!string.IsNullOrEmpty(PatientProtocolId))
            {
                ptProtocol.Get(int.Parse(PatientProtocolId));
                PtProtocolStudyId.Value = ptProtocol[PatientProtocol.PtProtocolStudyId].ToString();
            }

            // populate SpecimenAccessions
            SpecimenAccession sa = new SpecimenAccession();
            if (specimenAccessionId.HasValue)
            {                
                sa.Get(specimenAccessionId.Value);
                base.PopulateForm(sa);
                // special case: needle
                PopulateNeedleUIField(sa);
                // special case: diagnostics for tissue
                if (QuerySpecimenType == QUERY_TISSUE) // && !string.IsNullOrEmpty(AccessionProcName.Text) && AccessionProcName.Text.StartsWith("Image-Guided", StringComparison.OrdinalIgnoreCase))
                {
                    PopulateDiagnostic(specimenAccessionId.Value);
                }
            }

            // populate Specimens grid
            DataView specimens;
            // STEP 1: get all accessions of this type, will filter later on
            specimens = da.GetSpecimenReport(ptProtocolId, null, QuerySpecimenType).DefaultView;
            var allSpecimentRefNum = specimens.Table.AsEnumerable().Select(r => r[Specimen.SpecimenReferenceNumber].ToString()).Distinct();
            // STEP 2: generate an auto-calculated spec ref num for the patient (exclude currently assigned)
            autoGeneratedSpecimenRefNum.Clear();
            // only auto-generate spec # if filtering by type + visit
            if (!string.IsNullOrEmpty(QuerySpecimenType) && !string.IsNullOrEmpty(QueryVisitType))
            {
                int totalSpecimens = SpecimensGrid.BlankRows + specimens.Count;
                int start = 1;
                // find the max currently assigned reference num
                for (int seqNum = 1; seqNum <= totalSpecimens; seqNum++)
                {
                    // check if currently assigned, else add to available bucket
                    if (allSpecimentRefNum.Contains(GetSpecimenReferenceNumber(seqNum + "")))
                        start += 1;
                }
                // fill auto ref num
                autoGeneratedSpecimenRefNum.AddRange(Enumerable.Range(start, totalSpecimens).Select(seqNum => GetSpecimenReferenceNumber(seqNum + "")));
            }
            // when no parent record specified, build estimated reference num, but do not popualte with exisiting data
            if (!specimenAccessionId.HasValue)
                specimens.Table.Clear();

            // build restrictions
            List<string> restrictions = new List<string>();

            // restrict to this accession
            if (specimenAccessionId.HasValue)
                restrictions.Add(Specimen.SpecimenAccessionId + " = " + specimenAccessionId.Value);
            // restrict to this type
            if (!string.IsNullOrEmpty(QuerySpecimenType))
            {
                restrictions.Add(Specimen.SpecimenType + " = '" + QuerySpecimenType + "'");
                // restrict to visit (requires specimen type)
                if (!string.IsNullOrEmpty(QueryVisitType))
                {
                    string refNumMatch = GetSpecimenReferenceNumber("");
                    restrictions.Add(Specimen.SpecimenReferenceNumber + " LIKE '" + PageUtil.EscapeSingleQuotesForSql(refNumMatch) + "%'");
                }
            }


            if (restrictions.Count() > 0)
            {
                specimens.RowFilter = string.Join(" AND ", restrictions.ToArray());
                specimens = new DataView(specimens.ToTable());
            }
            else
            {
                specimens.RowFilter = "";
            }

            // data binding

            // adjust subType heading
            DataControlField subTypeColumn = SpecimensGrid.Columns[1];
            DataControlField vialTypeColumn = SpecimensGrid.Columns[2];
            DataControlField processingMethodColumn = SpecimensGrid.Columns[3];
            DataControlField specimenStatusColumn = SpecimensGrid.Columns[6];

            if (QuerySpecimenType == QUERY_TISSUE)
            {
                // custom visits ??
                bool customVisits = BuildSpecimenVisitTypes(QUERY_TISSUE, sa);

                subTypeColumn.HeaderText = "Sample Type";
                // hide columns from UI
                foreach (DataControlField column in new DataControlField[] { subTypeColumn, subTypeColumn, vialTypeColumn })
                {
                    column.HeaderStyle.CssClass = "hidden";
                    column.ItemStyle.CssClass = "hidden";
                }

                // set selection in parent
                Tissue_SpecimenSubType.Value = specimens.Count > 0 ? specimens[0][Specimen.SpecimenSubType].ToString() : "";

                // blank rows
                SpecimensGrid.BlankRows = Math.Max(0, 6 - specimens.Count);
                SpecimensGrid.VisibleBlankRows = 1;
                if (SpecimensGrid.BlankRows == 0)
                    AddBtn.Visible = false;
                if (specimens.Count != 0)
                    SpecimensGrid.VisibleBlankRows = 0;
            }
            else if (QuerySpecimenType == QUERY_BLOOD)
            {
                // custom visits ??
                bool customVisits = BuildSpecimenVisitTypes(QUERY_BLOOD, sa);
                // static visits
                if(!customVisits)
                {
                    // default accession visit
                    AccessionVisit.Value = "A";
                    AccessionVisit.Enabled = false;
                }

                AddBtn.Visible = true;
                subTypeColumn.HeaderText = "Tube Use";

                // hide columns from UI
                foreach (DataControlField column in new DataControlField[] { processingMethodColumn })
                {
                    column.HeaderStyle.CssClass = "hidden";
                    column.ItemStyle.CssClass = "hidden";
                }
                // update default blood specimens
                bloodAutoSpecimens = ProtocolMgmtSpecimenController.GetBloodAutoSpecimenIds(base.ProtocolNumber, (int)ptProtocol[PatientProtocol.PatientProtocolId], PtProtocolStudyId.Value, AccessionVisit.Enabled ? AccessionVisit.Value : "");
                
                SpecimensGrid.BlankRows = Math.Max(0, 15 - specimens.Count);
                SpecimensGrid.VisibleBlankRows = specimens.Count > 0 ? 0 : (bloodAutoSpecimens.Length > 0 ? bloodAutoSpecimens.Length : 3);
                AddBtn.Visible = SpecimensGrid.BlankRows > 0;
            }

            SpecimensGrid.DataSource = specimens;
            SpecimensGrid.DataBind();
        }

        /// <summary>
        /// Builds a list of custom visit types, returning if the list is custom (true) or default (false)
        /// </summary>
        /// <param name="type"></param>
        /// <param name="sa"></param>
        /// <returns></returns>
        private bool BuildSpecimenVisitTypes(string type, SpecimenAccession sa)
        {
            var visits = specimenController.GetSpecimenVisits(base.ProtocolNumber, type + " Specimens");
            if (visits.Count() > 0)
            {
                AccessionVisit.DataTextField = "Key";
                AccessionVisit.DataValueField = "Value";
                AccessionVisit.DataSource = visits;
                AccessionVisit.DataBind();
                // set value
                if (sa != null && sa.PrimaryKeyHasValue)
                {
                    AccessionVisit.Value = sa[SpecimenAccession.AccessionVisitType] + "";
                }
            }
            return visits.Count() > 0;
        }

        private void PopulateNeedleUIField(SpecimenAccession biz)
        {
            string needle = biz[SpecimenAccession.AccessionProcInstrument].ToString();
            string[] pairs = needle.Split(' ');
            if (pairs.Length == 3)
            {
                string gauge = pairs[0].Replace("G", ""); ;
                string length = pairs[1];
                string unit = pairs[2];

                Tissue_Gauge.Value = gauge;
                Tissue_Length.Value = length;
                Tissue_Unit.Value = unit;
            }
        }

        private void PopulateNeedleBizField(SpecimenAccession biz)
        {
            string gauge = Tissue_Gauge.Value;
            string length = Tissue_Length.Value;
            string unit = Tissue_Unit.Value;
            if (!string.IsNullOrEmpty(gauge + length + unit))
            {
                string needle = string.Format("{0}G {1} {2}", gauge, length, unit);
                biz[SpecimenAccession.AccessionProcInstrument] = needle;
            }
            biz.Save();
        }

        private int? SaveForm(int? specimenAccessionId)
        {
            bool isNewAccession = !specimenAccessionId.HasValue;
            int patientId = int.Parse(BaseDecryptedPatientId);
            // udpate SpecimenAccession
            SpecimenAccession sa = new SpecimenAccession();
            // load
            if (specimenAccessionId.HasValue)
                sa.Get(specimenAccessionId.Value);
            CICHelper.SetBOValues(this.Controls, sa, patientId);
            // special case: needle
            PopulateNeedleBizField(sa);
            sa.Save();
            // validate accession data
            if (!sa.PrimaryKeyHasValue)
                return null;
            specimenAccessionId = (int)sa[SpecimenAccession.SpecimenAccessionId];

            // special case: diagnostics for tissue
            if (QuerySpecimenType == QUERY_TISSUE && !string.IsNullOrEmpty(AccessionProcName.Text) && AccessionProcName.Text.StartsWith("Image-Guided", StringComparison.OrdinalIgnoreCase))
            {
                SaveDiagnostic(sa);
            }
            else if (specimenAccessionId.HasValue && !string.IsNullOrEmpty(DiagnosticIdField.Value))
            {
                int diagnosticId = int.Parse(DiagnosticIdField.Value);
                DeleteRelatedDiagnostic(specimenAccessionId.Value, diagnosticId);
            }

            /*
             *  SPECIMENS: for new accessions and single field udpates, force save/update
             */
            string selectedTissueSubType = Tissue_SpecimenSubType.Value;
            Dictionary<string, List<int?>> validation = new Dictionary<string, List<int?>>();
            foreach (GridViewRow row in SpecimensGrid.Rows)
            {
                int rowIndex = row.RowIndex;
                ICaisisInputControl specimenIdField = row.FindControl(Specimen.SpecimenId) as ICaisisInputControl;
                ICaisisInputControl refNumField = row.FindControl(Specimen.SpecimenReferenceNumber) as ICaisisInputControl;
                ICaisisInputControl subTypeField = row.FindControl(Specimen.SpecimenSubType) as ICaisisInputControl;

                if (QuerySpecimenType == QUERY_TISSUE)
                {
                    subTypeField.Value = selectedTissueSubType;
                }
                if (isNewAccession || forceSpecimenUpdate)
                {
                    // only for rows with a reference #
                    if (!string.IsNullOrEmpty(refNumField.Value) && !SpecimensGrid.DirtyRows.Contains(rowIndex))
                        SpecimensGrid.DirtyRows.Add(rowIndex);
                }
                // validation
                int? specimenId = null;
                string specimenReferenceNumber = refNumField.Value;
                if (!string.IsNullOrEmpty(specimenReferenceNumber))
                {
                    if (!string.IsNullOrEmpty(specimenIdField.Value))
                        specimenId = int.Parse(specimenIdField.Value);
                    validation.Adjoin(specimenReferenceNumber, new List<int?>());
                    validation[specimenReferenceNumber].Add(specimenId);
                }
            }
            List<string> currentDuplicates = new List<string>();
            List<string> externalDuplicates = new List<string>();
            // TODO: refactor
            Caisis.Data.Database db = new Data.Database();
            string db_table = new Specimen().TableName;
            if (validation.Count() > 0)
            {
                // validate against siblings
                currentDuplicates.AddRange(validation.Where(a => a.Value.Count() > 1).Select(a => a.Key));
                if (currentDuplicates.Count() == 0)
                {
                    // validate against db                   
                    foreach (var pair in validation)
                    {
                        bool specimenValid = true;
                        string specimenReferenceNumber = pair.Key;
                        foreach (int? specimenId in pair.Value)
                        {
                            Dictionary<string, object> db_query = new Dictionary<string, object>() { { Specimen.SpecimenReferenceNumber, specimenReferenceNumber } };
                            var specimens = Caisis.BOL.BusinessObject.GetByFields<Specimen>(db_query);
                            var found = new List<int>();
                            db.Select(db_table, Specimen.SpecimenId, new string[] { Specimen.SpecimenId }, new string[0], db_query, (r) =>
                            {
                                int rowSpecimenId = r.GetInt32(r.GetOrdinal(Specimen.SpecimenId));
                                found.Add(rowSpecimenId);
                                return true;
                            });
                            // OK, if doesn't exist in db or if current specimen already assigned to #
                            specimenValid = found.Count() == 0 || (specimenId.HasValue && found.Contains(specimenId.Value));
                        }
                        if (!specimenValid)
                            externalDuplicates.Add(specimenReferenceNumber);
                    }
                }
            }
            if (currentDuplicates.Count() > 0)
            {
                string message = "Unable to update the form. The following Specimen IDs were entered more than once. [" + string.Join(",", currentDuplicates.ToArray()) + "]";
                throw new ClientException(message);
            }
            else if (externalDuplicates.Count() > 0)
            {
                string message = "Unable to update the form. The following Specimen IDs already exist is the system. [" + string.Join(",", externalDuplicates.ToArray()) + "]";
                throw new ClientException(message);
            }
            // OK
            else
            {
                // save specimens
                SpecimensGrid.Save(specimenAccessionId.Value);

                // populate form
                this.PopulateForm(specimenAccessionId.Value);
            }

            return specimenAccessionId;
        }

        #region realted Diganostic and Imaging logic

        /// <summary>
        /// Popualtes the Diagnostic + Imaging fields
        /// </summary>
        /// <param name="specimenAccessionId"></param>
        private void PopulateDiagnostic(int specimenAccessionId)
        {
            Diagnostic diagnostic = GetRealtedDiagnostic(specimenAccessionId);
            if (diagnostic != null)
            {
                int diagnosticId = (int)diagnostic[Diagnostic.DiagnosticId];
                // set realted Diagnostic
                DiagnosticIdField.Value = diagnostic[diagnostic.PrimaryKeyName].ToString();
                // populate Diagnostic fields
                CICHelper.SetFieldValues(Tissue_DiagnosticFields.Controls, diagnostic);
                // populate image finding
                ImageFindingProstate finding = BusinessObject.GetByParent<ImageFindingProstate>(diagnosticId).FirstOrDefault();
                if (finding != null)
                {
                    // set fields
                    CICHelper.SetFieldValues(Tissue_DiagnosticFields.Controls, finding);
                }
            }
        }

        /// <summary>
        /// Saves the Diganostic + Imaging details, and adds related record
        /// </summary>
        /// <param name="specimenAccession"></param>
        private void SaveDiagnostic(SpecimenAccession specimenAccession)
        {
            int patientId = (int)specimenAccession[SpecimenAccession.PatientId];
            int specimenAccessionId = (int)specimenAccession[SpecimenAccession.SpecimenAccessionId];
            // save Diagnostics
            int? diagnosticId = null;
            if (!string.IsNullOrEmpty(DiagnosticIdField.Value))
            {
                diagnosticId = int.Parse(DiagnosticIdField.Value);
            }
            Diagnostic diagnostic = new Diagnostic();
            // load diagnostic
            if (diagnosticId.HasValue)
            {
                diagnostic.Get(diagnosticId.Value);
            }
            // set required fields
            else
            {
                diagnostic[Diagnostic.PatientId] = patientId;
                diagnostic[Diagnostic.DxDate] = specimenAccession[SpecimenAccession.CollectDate];
                diagnostic[Diagnostic.DxDateText] = specimenAccession[SpecimenAccession.CollectDateText];
                diagnostic[Diagnostic.DxTarget] = "Prostate";
            }
            // update type???
            diagnostic[Diagnostic.DxType] = AccessionProcName.Text;

            // set bizo value
            CICHelper.SetBOValues(Tissue_DiagnosticFields.Controls, diagnostic, patientId);
            // save diagnostic
            diagnostic.Save();
            // on update, link to SA
            if (diagnostic.PrimaryKeyHasValue)
            {
                diagnosticId = (int)diagnostic[Diagnostic.DiagnosticId];
                DiagnosticIdField.Value = diagnosticId.Value.ToString();
                // create related Diagnostic
                RelatedRecord relatedDiagnostic = CreateRelatedDiagnostic(specimenAccessionId, diagnosticId.Value);
                // get ImageFindingProstate
                ImageFindingProstate finding = BusinessObject.GetByParent<ImageFindingProstate>(diagnosticId.Value).FirstOrDefault();
                // else, create
                if (finding == null)
                {
                    finding = new ImageFindingProstate();
                    finding[ImageFindingProstate.DiagnosticId] = diagnosticId.Value;
                }
                // set fields
                CICHelper.SetBOValues(Tissue_DiagnosticFields.Controls, finding, diagnosticId.Value);
                // update
                finding.Save();
            }
        }

        #endregion

        protected void SetSpecimenSubType(object sender, EventArgs e)
        {
            if (QuerySpecimenType == QUERY_TISSUE)
            {
                string selectedTissueSubType = Tissue_SpecimenSubType.Value;
                foreach (GridViewRow row in SpecimensGrid.Rows)
                {
                    ICaisisInputControl subTypeField = row.FindControl(Specimen.SpecimenSubType) as ICaisisInputControl;
                    subTypeField.Value = selectedTissueSubType;
                }
                // ensure specimens grid updates
                forceSpecimenUpdate = true;
            }
        }

        protected void SetSpecimenDisplay(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ICaisisInputControl specimenRefNumInput = e.Row.FindControl(Specimen.SpecimenReferenceNumber) as ICaisisInputControl;
                ICaisisInputControl specimenTypeInput = e.Row.FindControl(Specimen.SpecimenType) as ICaisisInputControl;
                ICaisisInputControl specimenSubTypeInput = e.Row.FindControl(Specimen.SpecimenSubType) as ICaisisInputControl;
                ICaisisInputControl specimenVialTypeInput = e.Row.FindControl(Specimen.SpecimenVialType) as ICaisisInputControl;
                ICaisisInputControl processingMethodInput = e.Row.FindControl(Specimen.SpecimenPreservationType) as ICaisisInputControl;
                bool isBlankRow = DataBinder.Eval(e.Row.DataItem, Specimen.SpecimenId).ToString() == "";

                string specimenRefNum = DataBinder.Eval(e.Row.DataItem, Specimen.SpecimenReferenceNumber).ToString();

                // format Specimen Type
                if (string.IsNullOrEmpty(specimenTypeInput.Value))
                {
                    specimenTypeInput.Value = QuerySpecimenType;
                }

                // special: lookup codes
                if (QuerySpecimenType == QUERY_BLOOD)
                {
                    (processingMethodInput as ICaisisLookupControl).LookupCode = "Specimen_PreservationType_Blood";
                    (specimenSubTypeInput as ICaisisLookupControl).LookupCode = "Specimen_SubType_Blood";
                    // special default values
                    bool setPreGeneratedBloodSpecimens = !AccessionVisit.Enabled;
                    if (isBlankRow && setPreGeneratedBloodSpecimens)
                    {
                        int index = e.Row.RowIndex;
                        if (index + 1 <= bloodAutoSpecimens.Length)
                        {
                            var specimenDefault = bloodAutoSpecimens[index];
                            specimenRefNumInput.Value = specimenDefault.SpecimenReferenceNumber;
                            specimenSubTypeInput.Value = specimenDefault.SubType;
                            specimenVialTypeInput.Value = specimenDefault.VialType;
                        }
                    }
                }
                else if (QuerySpecimenType == QUERY_TISSUE)
                {
                    (processingMethodInput as ICaisisLookupControl).LookupCode = "Specimen_PreservationType_Tissue";
                    (specimenSubTypeInput as ICaisisLookupControl).LookupCode = "Specimen_SubType_Tissue";
                }

                // set collected checkbox
                string status = DataBinder.Eval(e.Row.DataItem, BOL.Specimen.SpecimenStatus).ToString();
                CheckBox statusCheck = e.Row.FindControl("SpecimenStatus_Check") as CheckBox;
                CaisisHidden statusField = e.Row.FindControl("SpecimenStatus") as CaisisHidden;
                statusField.Value = status;
                if (!string.IsNullOrEmpty(status))
                {
                    statusCheck.Checked = true;
                }
            }
        }

        private string GetSpecimenReferenceNumber(string specimentSeqNum)
        {
            return ProtocolMgmtSpecimenController.GetSpecimenReferenceNumber(PatientStudyId, QuerySpecimenType, QueryVisitType, specimentSeqNum);
        }

        protected void SetStatusValue(object sender, EventArgs e)
        {
            CheckBox statusCheck = sender as CheckBox;
            CaisisHidden statusField = statusCheck.NamingContainer.FindControl(statusCheck.ID.Replace("_Check", "")) as CaisisHidden;
            if (statusCheck.Checked && string.IsNullOrEmpty(statusField.Value))
                statusField.Value = "Collected";
        }

        protected void ReloadOnSpecimenDelete(object sender, GridViewDeletedEventArgs e)
        {
            int? specimenAccessionId = null;
            if (!string.IsNullOrEmpty(QuerySpecimenAccessionId))
                specimenAccessionId = int.Parse(QuerySpecimenAccessionId);
            // load update form
            LoadForm(specimenAccessionId);
        }

        protected void UpdateClick(object sender, EventArgs e)
        {
            try
            {
                int? specimenAccessionId = SaveForm(querySpecimenAccessionId);
                LoadForm(specimenAccessionId);
            }
            catch (ClientException ex)
            {
                string message = PageUtil.EscapeSingleQuotes(ex.Message);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SpecimenValidation", "alert('" + message + "');", true);
            }
        }

        private void LoadForm(int? specimenAccessionId)
        {
            string newURL = base.GetQueryString("PatientSpecimens.aspx") + "&specimenAccessionId=" + specimenAccessionId + "&specimenType=" + QuerySpecimenType + "&visitType=" + QueryVisitType;
            Response.Redirect(newURL);
        }

        #region related records (Diganostics)

        /// <summary>
        /// Gets a list of Diagnostic related records
        /// </summary>
        /// <param name="specimenAccessionId"></param>
        /// <returns></returns>
        private IEnumerable<RelatedRecord> GetDiagnosticRelatedRecords(int specimenAccessionId)
        {
            IEnumerable<RelatedRecord> diagnosticRelatedRecords = RelatedRecordController.GetRelatedRecords("SpecimenAccessions", specimenAccessionId, "Diagnostics");
            return diagnosticRelatedRecords;
        }

        /// <summary>
        /// Gets the Diagnostic related to the Specimen Accession
        /// </summary>
        /// <param name="specimenAccessionId"></param>
        /// <param name="diagnosticId"></param>
        /// <returns></returns>
        private RelatedRecord GetDiagnosticRelatedRecord(int specimenAccessionId, int diagnosticId)
        {
            IEnumerable<RelatedRecord> diagnosticRelatedRecords = GetDiagnosticRelatedRecords(specimenAccessionId);
            RelatedRecord relatedRecord = diagnosticRelatedRecords.FirstOrDefault(r => r[RelatedRecord.DestPrimaryKey].ToString() == diagnosticId.ToString());
            return relatedRecord;
        }

        /// <summary>
        /// Get the related Diagnostic record
        /// </summary>
        /// <param name="specimenAccessionId"></param>
        /// <returns></returns>
        private Diagnostic GetRealtedDiagnostic(int specimenAccessionId)
        {
            // TODO: what if accession is realted to multiple diagnostics ???
            IEnumerable<RelatedRecord> diagnosticRelatedRecords = GetDiagnosticRelatedRecords(specimenAccessionId);
            IEnumerable<Diagnostic> relatedDiagnostics = RelatedRecordController.GetRelatedBizObjects<Diagnostic>(diagnosticRelatedRecords, RelatedRecord.DestTableName, RelatedRecord.DestPrimaryKey);
            Diagnostic diagnostic = relatedDiagnostics.FirstOrDefault();
            // validation: patient
            if (diagnostic != null && !diagnostic.IsEmpty)
            {
                int patientId = int.Parse(BaseDecryptedPatientId);
                if ((int)diagnostic[Diagnostic.PatientId] == patientId)
                {
                    return diagnostic;
                }
            }
            return null;
        }

        /// <summary>
        /// Creates a related record for the Diagnostic (if one doesn't exist) to the current Specimen Accession
        /// </summary>
        /// <param name="specimenAccessionId"></param>
        /// <param name="diagnosticId"></param>
        /// <returns></returns>
        private RelatedRecord CreateRelatedDiagnostic(int specimenAccessionId, int diagnosticId)
        {
            // get existing realted record
            RelatedRecord relatedRecord = GetDiagnosticRelatedRecord(specimenAccessionId, diagnosticId);
            // else, create
            if (relatedRecord == null)
            {
                relatedRecord = RelatedRecordController.CreateRelatedRecord("SpecimenAccessions", specimenAccessionId, "Diagnostics", diagnosticId);
            }
            return relatedRecord;
        }

        /// <summary>
        /// Delete the link between the Diagnostic and Spcimen Accession
        /// </summary>
        /// <param name="specimenAccessionId"></param>
        /// <param name="diagnosticId"></param>
        private void DeleteRelatedDiagnostic(int specimenAccessionId, int diagnosticId)
        {
            // delete related record
            RelatedRecord relatedRecord = GetDiagnosticRelatedRecord(specimenAccessionId, diagnosticId);
            if (relatedRecord != null)
                new RelatedRecord().Delete((int)relatedRecord[RelatedRecord.RelatedRecordId]);
            // delete diagnostic ???
            Diagnostic diagnostic = new Diagnostic();
            diagnostic.Delete(diagnosticId);
            DiagnosticIdField.Value = "";
        }

        #endregion

        // TODO: refactor to utilities
        private static string[] ToLines(string source, bool removeEmpty)
        {
            char[] carriage = "\r".ToCharArray();
            string[] lines = source.Split('\n').Select(line => line.TrimEnd(carriage)).Where(line => !removeEmpty || line != "").ToArray();
            return lines;
        }
    }
}