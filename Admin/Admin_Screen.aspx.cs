using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class Admin_Admin_Screen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
        if (Session["admin_user"] != null)
        {
            Label1.Visible = true;
            Label1.Text = "Hii,Admin";
            Button1.Visible = true;

        }
        else
        {
            Response.Redirect("~/Admin_Login.aspx");
        }
        //   BindData();

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            Session.Abandon();
            Session.Clear();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";
            string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
            using (StreamWriter outputFile = new StreamWriter(log, true))
            {

                outputFile.WriteLine(System.DateTime.Now.ToString() + " : Admin Logout succes");

            }
            Response.Redirect("~/Admin_Login.aspx");
           
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);

        }
    }
}