namespace Caisis.UI.Modules.Prostate.Eforms
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

	/// <summary>
    ///		Summary description for HealthMaintenance_Survivorship.
	/// </summary>
    public partial class HealthMaintenance_Survivorship : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

            base.SetTitle(ComponentTitle);
		}



	}
}
