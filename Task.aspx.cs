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


public partial class Task : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    
    protected void btnInsert_Click(object sender, EventArgs e)
    {
       
         DataSet Tasks =new DataSet();
         Tasks.ReadXml(Server.MapPath("~/App_Data/PM.xml"));

        //' we need to add the rows to a table , because we can't use the arry of rows as a datasource 

        string strCon = "Data Source=. ;Initial Catalog=MyDB ;Integrated Security=True";
        cn.ConnectionString = strCon;
        cmd.Connection = cn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "sptblTask_Insert";
        //'=====START INTERDUSE PARAMETERS==========
         SqlParameter Task_Name=new SqlParameter("@Task_Name ", SqlDbType.NVarChar, 3000);
        cmd.Parameters.Add(Task_Name);
        Task_Name.Direction = ParameterDirection.Input;
        int i2 = Int32.Parse(Tasks.Tables["Task"].Rows.Count.ToString());
       
        try
        {
            cn.Open();
            for(int i = 0;  i<=i2 - 1;i++)
            {
                Task_Name.Value = Tasks.Tables["Task"].Rows[i].ItemArray[2].ToString();
                cmd.ExecuteNonQuery();
            }
        }
           
            
      catch (Exception ex)
          {}
      finally 
        {
            cn.Close();
        }
    }
    
    protected void btn_Show_Click(object sender, EventArgs e)
    {
        DataSet Tasks =new DataSet();
        Tasks.ReadXml(Server.MapPath("~/App_Data/PM.xml"));

        DataTable tb;     
      
        tb = Tasks.Tables["Task"];
        //'here you can assign the tb to any data presentaion control ,\
        //'you can use GridView because of  its auto genrate columns , its simple
        //'for ListView , you need to build the Layout and the ItemTemplate , i did a one for you which has a bad look :)
        this.Repeater1.DataSource = tb;
        this.Repeater1.DataBind();
    }
    protected void  btn_Upload_Click(object sender, EventArgs e)
{
      try
      {

           
    if( ( FileUpload1.PostedFile != null ) && ( FileUpload1.PostedFile.ContentLength > 0 ) )
{
	string fn = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
	string SaveLocation = Server.MapPath("~/App_Data/") + "\\" +  fn;
	try
	{
		FileUpload1.PostedFile.SaveAs(SaveLocation);
		Response.Write("The file has been uploaded.");
	}
	catch ( Exception ex )
	{
		Response.Write("Error: " + ex.Message);
		//Note: Exception.Message returns a detailed message that describes the current exception. 
		//For security reasons, we do not recommend that you return Exception.Message to end users in 
		//production environments. It would be better to put a generic error message. 
	}
}
else
{
	Response.Write("Please select a file to upload.");
}
               
      }   
        catch{}


}
}
