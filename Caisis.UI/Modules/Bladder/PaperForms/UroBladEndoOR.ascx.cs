namespace Caisis.UI.Modules.Bladder.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroBladEndoOR.
	/// </summary>
	public partial class UroBladEndoOR : BasePaperFormControl
	{

		private BasePaperFormControl  PreOpFormControl = null;


		override protected void SetFormInfo()  
		{
			this._formName = "UroBladEndoOR";
			this._formTitle = "Urology Bladder Endoscopy OR";
		}


		override protected void Page_Load(object sender, EventArgs e)
		{
			base.Page_Load(sender, e);
			LoadPreOpForm();
		}



		protected void LoadPreOpForm()
		{
			if (null != PreOpFormHolder)
			{
				PreOpFormControl = (BasePaperFormControl)this.LoadControl("../../All/PaperForms/UroPreopNote.ascx");

				PreOpFormControl.BatchPatientId = this._batchPatientId;
				PreOpFormControl.FormInPatientId = this._formInPatientId;
				PreOpFormControl.FormAppointmentId = this._formAppointmentId;

				PreOpFormHolder.Controls.Add(PreOpFormControl);
			}
		}


	}
}
