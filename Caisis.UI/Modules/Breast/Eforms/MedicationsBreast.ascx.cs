namespace Caisis.UI.Modules.Breast.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for MedicationsBreast.
	/// </summary>
    public partial class MedicationsBreast : BaseEFormControl
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            BuildAllMedications(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);


            foreach (ListItem BreastMedsli in MedicationDone.Items)
            {
                string BreastMedsstr = "showHideBreastMeds('" + BreastMedsli.Value + "','" + AbsentDateText_5.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_5.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + TableName_5.ClientID + "', 'Medications','" + FieldName_5.ClientID + "', 'Medication','" + FieldValue_5.ClientID + "', 'Medication','" + AbsentReason_5.ClientID + "', 'Not Performed','" + AbsentQuality_5.ClientID + "', 'STD');";

                BreastMedsli.Attributes.Add("onclick", BreastMedsstr);

                if (BreastMedsli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "BreastMedsjScript", BreastMedsstr, true);
                }
            }

		}


        protected void BuildAllMedications(int PatientID, string FormName, string FormType)
        {
            MedicationDa medDa = new MedicationDa();
            DataSet medDs = medDa.FormGetRecords(PatientID, FormName, FormType, null);

            if (medDs.Tables.Count > 0 && medDs.Tables[0].Rows.Count > 0)
            {
                NoMedsMsgTr.Visible = false;

                medicationsAll.DataSource = medDs.Tables[0].DefaultView;
                medicationsAll.DataBind();
            }
            else
                NoMedsMsgTr.Visible = true;
        }

        /// <summary>
        /// For customization reasons, this method reimplements BaseEFormControl.EFormRepeaterOnDataBound(...)
        /// and appends functionality to hide rows that have "past" MedStopDates
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DecorateMedicationsAll(object sender, RepeaterItemEventArgs e)
        {
            DataRowView rowView = (DataRowView)e.Item.DataItem;

            if (rowView != null)
            {
                HtmlImage LockImage;
                LockImage = (HtmlImage)e.Item.FindControl("LockImage");
                string medId = rowView["MedicationId"].ToString();

                if (LockImage != null)
                {
                    LockImage.Visible = false;
                }

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    if (rowView.DataView.Table.Columns.Contains("LockedBy"))
                    {
                        if (rowView["LockedBy"] != null && !string.IsNullOrEmpty(rowView["LockedBy"].ToString()))
                        {
                            if (LockImage != null)
                            {
                                LockImage.Visible = true;
                            }
                        }
                    }

                    if (!(rowView["MedStopDate"] != null && rowView["MedStopDate"].ToString().Length > 0) && !(rowView["MedStopDateText"] != null && rowView["MedStopDateText"].ToString().Length > 0))
                    {
                        CheckBox StopDateCheckbox = (CheckBox)e.Item.FindControl("StopDateCheckbox");
                        if (StopDateCheckbox != null)
                        {
                            StopDateCheckbox.Visible = true;

                            // add ajax callback
                            StopDateCheckbox.Attributes["onclick"] = string.Format("stopMedication(this, '{0}', event);", medId);
                        }
                    }
                }

                // decorate tr
                HtmlTableRow tr = (HtmlTableRow)e.Item.FindControl("_tr_");

                tr.Attributes["onclick"] = "LoadDataEntryForm('Medications'," + medId + ",'MedDateText,MedType,Medication,MedNotes,MedQuality', 'Medications');";

                // if the stop date < current clinic date, set parentTR.style.display = 'none'

                object objStopDate = rowView["MedStopDate"];
                if (objStopDate != DBNull.Value)
                {
                    DateTime stopDate = DateTime.Parse(objStopDate.ToString());
                    DateTime clinDate = DateTime.Now;

                    if (Session[SessionKey.CurrentClinicDate] != null)
                    {
                        clinDate = DateTime.Parse(Session[SessionKey.CurrentClinicDate].ToString());
                    }

                    if (stopDate < clinDate)
                    {
                        tr.Style["DISPLAY"] = "none";
                    }
                }
            }
        }



	}
}
