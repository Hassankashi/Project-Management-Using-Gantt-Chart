//(c) Copyright Microsoft Corporation.
//This source is subject to the Microsoft Public License.
//See http://www.microsoft.com/opensource/licenses.mspx#Ms-PL.
// All other rights reserved.
//*-------------------------------*
//*                               *
//*      Mahsa Hassankashi        *
//*   mahsa.hassankashi@gmail.com *
//*     kashi_mahsa@yahoo.com     * 
//*                               *
//*                               *
//*-------------------------------*
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Generic;
using AjaxControlToolkit;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Collections.Specialized;
using System.Xml;

///<summary>
/// Summary description for Cascading
///</summary>

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script,
// using ASP.NET AJAX, uncomment the following line.
[System.Web.Script.Services.ScriptService]
public class Cascading : System.Web.Services.WebService
{

    public Cascading()
    {
        //Uncomment the following line if using designed components
        //InitializeComponent();
    }

    [WebMethod]
    public CascadingDropDownNameValue[] GetProjects(string knownCategoryValues,
                                        string category)
    {
        //ADO.Net
        SqlConnection cn = new SqlConnection();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string strCn = "data source=.;Initial Catalog=MyDB;Integrated Security=True";
        cn.ConnectionString = strCn;
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from tblProject";

        try
        {
            cn.Open();
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
        }
        catch
        {
        }
        finally
        {
            cn.Close();
        }
        dt = ds.Tables[0];

        List<CascadingDropDownNameValue> ProjectValues =
                    new List<CascadingDropDownNameValue>();
        foreach (DataRow row in dt.Rows)
        {
            ProjectValues.Add(new CascadingDropDownNameValue(
              row["ProjName"].ToString(), row["ProjID"].ToString()));
        }

        return ProjectValues.ToArray();
    }

    [WebMethod]
    public CascadingDropDownNameValue[] GetGroups(string knownCategoryValues,
                                                  string category)
    {
        StringDictionary kv =
          CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);

        //'ContainsKey("Project") is one of property in Ajaxcontroltoolkit
        int projectId;

        projectId = System.Convert.ToInt32(kv["Project"]);

        //ADO.Net
        SqlConnection cn = new SqlConnection();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        string strCn =
          "data source=.;Initial Catalog=MyDB;Integrated Security=True";

        cn.ConnectionString = strCn;
        SqlCommand cmd = new SqlCommand();

        cmd.Connection = cn;
        cmd.CommandType = CommandType.Text;
        //-----I Defined a parameter instead of passing value 
        //     directly to prevent sql injection--------//
        cmd.CommandText = "select * from tblGroup where ProjID=@myParameter Order by name";
        cmd.Parameters.AddWithValue("@myParameter", projectId.ToString());
        try
        {
            cn.Open();
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
        }
        catch
        {
        }
        finally
        {
            cn.Close();
        }
        dt = ds.Tables[0];

        List<CascadingDropDownNameValue> GroupValues =
                  new List<CascadingDropDownNameValue>();
        foreach (DataRow row in dt.Rows)
        {
            GroupValues.Add(new CascadingDropDownNameValue(
               row["name"].ToString(), row["gid"].ToString()));
        }
        return GroupValues.ToArray();
    }
}