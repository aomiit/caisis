namespace Caisis.UI.Modules.Pancreas.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for Pathology_IPMN.
	/// </summary>
    public partial class Pathology_IPMN : BaseEFormControl
	{

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
        }
	

	}
}
