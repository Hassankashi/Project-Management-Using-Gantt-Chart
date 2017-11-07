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
using System.Xml;
using System.Xml.Schema;
using System.Data.SqlClient;
public partial class DemoReport : System.Web.UI.Page
{
    string strDemoAnticipate;
    protected void Page_Load(object sender, EventArgs e)
    {

        
        string strProj;
        string strQrt;
        string strYear;

         SqlConnection cn =new SqlConnection();
         SqlCommand cmd =new SqlCommand();

         string strCon  = "Data Source=. ;Initial Catalog=MyDB ;Integrated Security=True";
         cn.ConnectionString = strCon;

        //'==============NESTED=================

       
            if (Request.QueryString["Project"] != null)
            {
                strDemoAnticipate = Request.QueryString["Project"];
            }

        string[] strArr= strDemoAnticipate.Split('?');
        strProj = strArr[0].ToString();
        strQrt = strArr[1].ToString();
        strYear = strArr[2].ToString();


        SqlDataAdapter custDA=new SqlDataAdapter("select gid,name,blockcolor from tblGroup where ProjID=" + strProj, cn);
        SqlDataAdapter orderDA =new SqlDataAdapter("SELECT gid,href,StartDate,EndDate,name FROM tblBlock where ProjID=" + strProj, cn);

        cn.Open();

        DataSet custDS=new DataSet("NewDataSet");
        custDA.Fill(custDS, "group");
        orderDA.Fill(custDS, "block");

        cn.Close();
        try
        {
            DataRelation custOrderRel  = custDS.Relations.Add("CustOrders", custDS.Tables["group"].Columns["gid"], custDS.Tables["block"].Columns["gid"]);
            custOrderRel.Nested = true;

        }
        
        catch
        {
        }
       

        string MyXml  = custDS.GetXml();

        EventCalendarControl1.XMLData = MyXml;
        EventCalendarControl1.BlankGifPath = "trans.gif";
        EventCalendarControl1.Year = Int32.Parse(strYear);
        EventCalendarControl1.Quarter = Int32.Parse(strQrt);
        EventCalendarControl1.BlockColor = "";
        EventCalendarControl1.ToggleColor = "#dcdcdc";
        EventCalendarControl1.CellHeight = 10;
        EventCalendarControl1.CellWidth = 10;

    }
}
