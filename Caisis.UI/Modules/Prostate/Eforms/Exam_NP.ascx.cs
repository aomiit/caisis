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
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;


	/// <summary>
    ///		Summary description for Exam_NP.
	/// </summary>
    public partial class Exam_NP : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

		}




	}
}
