using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class DemoRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGo_Click(object sender, EventArgs e)
    {
        string proj = this.drpProject.SelectedValue.ToString();
        Response.Redirect("DemoReport.aspx" + "?Project=" + proj + "?" + this.drpQ.SelectedValue.ToString() + "?" + this.txtYear.Text);
    }
}
