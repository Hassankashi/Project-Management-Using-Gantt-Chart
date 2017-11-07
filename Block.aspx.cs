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
using System.Data.SqlClient;

public partial class Block : System.Web.UI.Page
{
    
 
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        
        SqlConnection cn=new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        string strCon= "Data Source=.;Initial Catalog=MyDB ;Integrated Security=True";
        cn.ConnectionString = strCon;
        string strsql="";
        string strHref= "DemoDetails.aspx?ActID=" + this.txtBlock.Text;
        
        string strGroup=this.ddListGroup.SelectedValue.ToString() ;
        string strProject = this.ddListProject.SelectedValue.ToString();
        try
        {
            strsql += "insert into tblBlock(name,StartDate,EndDate,href,ProjID,gid) values('";
            strsql += this.txtBlock.Text + "','" + this.txtStartDate.Text + "','" + this.txtEndDate.Text + "','";
            strsql += strHref + "'," + strProject + "," + strGroup + ")";
         
            SqlCommand objcommand = new SqlCommand(strsql, cn);

            cn.Open();
            objcommand.ExecuteNonQuery();
        }
            
        catch 
        {
        }
        finally
        {
            cn.Close();
        }
            
      
    }
}
