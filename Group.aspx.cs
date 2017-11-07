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


public partial class Group : System.Web.UI.Page
{
    
    protected void btn_Save_Click(object sender, EventArgs e)
    {
      SqlConnection cn=new SqlConnection();
      SqlCommand cmd = new SqlCommand();
        
      string strCon="Data Source=. ;Initial Catalog=MyDB ;Integrated Security=True";
      cn.ConnectionString = strCon;
      string strsql="";

        try
        {
            
            strsql += "insert into tblGroup(name,blockcolor,ProjID) values('" ;
            strsql += this.txtGroup.Text + "',N'" + this.drp_Color.Text + "'," + this.drp_ProjName.SelectedValue.ToString() + ") ";
            SqlCommand objcommand=new SqlCommand(strsql, cn);

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
