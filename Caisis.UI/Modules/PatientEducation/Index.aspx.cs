using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;
using Caisis.Security;

public partial class Modules_PatientEducation_Index : BasePage
{


	protected override void Page_Load(object sender, System.EventArgs e)
	{
		base.Page_Load(sender, e);

        if (PermissionManager.HasPermission("PatientEdAdmin"))
        {
            ManageMaterialMenu.Visible = true;
        }

		// Forward if needed
		string section = Request.QueryString["goToSection"];
        if ((Request.QueryString["findClicked"] != null && Request.QueryString["findClicked"].Equals("true")) || (Request.QueryString["epid"] != null))
        {
            MainWindow.Attributes["src"] = "AssembleContent.aspx?usePtInSession=true";
        }
		else if (!string.IsNullOrEmpty(section))
		{
			if (section == "AssembleContent")
			{
				MainWindow.Attributes["src"] = "AssembleContent.aspx?usePtInSession=false";
				// We need to clear Session
				SessionHandler sh = new SessionHandler(Session);
				sh.ClearCurrentPatient(); // NOTE: why isn't this working?
			}
		}
		SetPopUpDisplay();
 
	}


	private void SetPopUpDisplay()
	{
		// Set the display within the view/edit patient data layer
		if (Session[SessionKey.PatientId] == null || Session[SessionKey.PatientId].ToString().Length == 0)
		{
			SplashCurrentPatientTableRow.Visible = false;

			ViewEditPatientSpacerRow1.Visible = false;
		}
		else if (Session[SessionKey.PtLastName] != null && Session[SessionKey.PtMRN] != null)
		{
			SplashCurrentPatient.Text = "View / edit data for the current patient: ";
			ViewEditPatientName.Text = Session[SessionKey.PtFirstName].ToString() + " " + Session[SessionKey.PtLastName].ToString();
			ViewEditPatientMRN.Text = Session[SessionKey.PtMRN].ToString();
		}


	}
}
