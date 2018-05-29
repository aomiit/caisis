namespace Caisis.UI.Modules.HeadNeck.Eforms
{
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;    
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for Distant Metastasis.
    /// </summary>

    public partial class ThyroidDistantMets : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.BuildStatus(this._patientId, "Thyroid Cancer");

            setStatus();
        }

        protected void setStatus()
        {
            getStatus(StatusDateText_1, Status_1, StatusDisease_1, StatusQuality_1);
            getStatus(StatusDateText_2, Status_2, StatusDisease_2, StatusQuality_2);
            getStatus(StatusDateText_3, Status_3, StatusDisease_3, StatusQuality_3);
            getStatus(StatusDateText_4, Status_4, StatusDisease_4, StatusQuality_4);
            getStatus(StatusDateText_5, Status_5, StatusDisease_5, StatusQuality_5);
        }

        protected void getStatus(EformTextBox dateTxt, EformTextBox statusTxt, EformTextBox statusDiseaseTxt, EformTextBox statusQltyTxt)
        {
            statusTxt.Attributes.Add("onblur", "updateStatusOnDate('" + statusTxt.ClientID + "','" + statusDiseaseTxt.ClientID + "','" + statusQltyTxt.ClientID + "');");
        }
    }
}
