namespace Caisis.UI.Modules.HeadNeck.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	
	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	/// <summary>
    ///		Summary description for OralCavityClinStage.
	/// </summary>
    public partial class OralCavityClinStage : BaseEFormControl
	{

		protected override void Page_Load(object sender, EventArgs e)
		{
            base.Page_Load (sender, e);
            base.SetTitle(ComponentTitle);
		}

		
	}
}
