using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// Summary description for EFormSplash.
	/// </summary>
	public partial class EFormSplash : BasePage
	{
		
		protected override void Page_Load(object sender, System.EventArgs e)
		{
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

                    // Set Identifier Text
                    PatientController pc = new PatientController();
                    UserController uc = new UserController();
                    string defaultIdType = uc.GetDefaultIdentifierType();
                    // special case
                    if (!string.IsNullOrEmpty(defaultIdType) && defaultIdType != PatientController.LAST_NAME_MRN_IDENTIFIER)
                        ViewEditPatientMRN.Text = defaultIdType + ": " + pc.GetPatientIdentifier(int.Parse(Session[SessionKey.PatientId].ToString()), defaultIdType);

                    // otherwise default to MRN
                    else
                        ViewEditPatientMRN.Text = "MRN: " + Session[SessionKey.PtMRN].ToString();
			}
		}

	}
}
