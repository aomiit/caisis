namespace Caisis.UI.Modules.Pancreas.Eforms
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
    ///		Summary description for PancreasSurgeryRadiationTherapy2.
	/// </summary>
    public partial class PancreasSurgeryRadiationTherapy2 : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			base.BuildXRT(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
		}



	}
}
