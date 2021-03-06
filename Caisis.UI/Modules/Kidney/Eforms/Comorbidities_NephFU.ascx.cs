namespace Caisis.UI.Modules.Kidney.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for Comorbidities_GU.
	/// </summary>
    public partial class Comorbidities_NephFU : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildComorbidities(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
           
		}


        override protected void BuildComorbidities(int PatientID, string FormName, string FormType)
        {

            ComorbidityDa comorbiditiesDa = new ComorbidityDa();
            DataSet comorbiditiesDs = comorbiditiesDa.FormGetRecords(PatientID, FormName, FormType);
            if (comorbiditiesDs.Tables.Count > 0 && comorbiditiesDs.Tables[0].Rows.Count > 0)
            {
                comorbidities.DataSource = comorbiditiesDs.Tables[0].DefaultView;
                comorbidities.DataBind();



                DataTable ComorbidityListTable = new DataTable();

                DataColumn Comorbidity = new DataColumn();
                Comorbidity.ColumnName = "Comorbidity";
                Comorbidity.DataType = System.Type.GetType("System.String");
                ComorbidityListTable.Columns.Add(Comorbidity);

                DataColumn ComorbidityHtmlRow = new DataColumn();
                ComorbidityHtmlRow.ColumnName = "ComorbidityHtmlRow";
                ComorbidityHtmlRow.DataType = System.Type.GetType("System.Object");
                ComorbidityListTable.Columns.Add(ComorbidityHtmlRow);

                AddComorbidityToListTable(ComorbidityListTable, "Coronary Artery Disease", ComorbidityRow_CoronaryArteryDisease);
                AddComorbidityToListTable(ComorbidityListTable, "Myocardial Infarction", ComorbidityRow_MyocardialInfarction);
                AddComorbidityToListTable(ComorbidityListTable, "Hypertension", ComorbidityRow_Hypertension);
                AddComorbidityToListTable(ComorbidityListTable, "CVA", ComorbidityRow_CVA);
                AddComorbidityToListTable(ComorbidityListTable, "Thromboembolic Events / DVT", ComorbidityRow_ThromboembolicEventsDVT);
                AddComorbidityToListTable(ComorbidityListTable, "Asthma", ComorbidityRow_Asthma);
                AddComorbidityToListTable(ComorbidityListTable, "Diabetes (IDDM)", ComorbidityRow_DiabetesIDDM);
                AddComorbidityToListTable(ComorbidityListTable, "Diabetes (NIDDM)", ComorbidityRow_DiabetesNIDDM);
                AddComorbidityToListTable(ComorbidityListTable, "Obesity", ComorbidityRow_Obesity);
                AddComorbidityToListTable(ComorbidityListTable, "Hypercholesterolemia", ComorbidityRow_Hypercholesterolemia);
                AddComorbidityToListTable(ComorbidityListTable, "Depression", ComorbidityRow_Depression);

                foreach (DataRow cRow in ComorbidityListTable.Rows)
                {
                    CheckForMatchingComorbidity(comorbiditiesDs.Tables[0], cRow["Comorbidity"].ToString(), (HtmlTableRow)cRow["ComorbidityHtmlRow"]);
                }
            }


        }

        protected virtual void AddComorbidityToListTable(DataTable cTable, string comorbidityName, HtmlTableRow ComorbidityHtmlRow)
        {
            DataRow cRow = cTable.NewRow();
            cRow["Comorbidity"] = comorbidityName;
            cRow["ComorbidityHtmlRow"] = ComorbidityHtmlRow;
            cTable.Rows.Add(cRow);
        }


        protected virtual void CheckForMatchingComorbidity(DataTable ComorbiditiesTable, string comorbidityName, HtmlTableRow ComorbidityHtmlRow)
        {
            foreach (DataRow cRow in ComorbiditiesTable.Rows)
            {
                if (cRow[BOL.Comorbidity.Comorbidity_Field].ToString().ToUpper().Equals(comorbidityName.ToUpper()))
                {
                    ComorbidityHtmlRow.Visible = false;
                }
            }
        }

	}
}
