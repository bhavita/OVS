<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Data;

public class ImageHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        string roll_no = context.Request.QueryString["roll_no"].ToString();
        string sConn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection objConn = new SqlConnection(sConn);
        objConn.Open();
        string sTSQL = "select img from Images where Roll_no=@roll_no";
        SqlCommand objCmd = new SqlCommand(sTSQL, objConn);
        objCmd.CommandType = CommandType.Text;
        objCmd.Parameters.AddWithValue("@roll_no", roll_no.ToString());
        object data = objCmd.ExecuteScalar();
        objConn.Close();
        objCmd.Dispose();
        context.Response.BinaryWrite((byte[])data); 

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}