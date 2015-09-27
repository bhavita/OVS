using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();

        if (Session["admin_user"] != null)
        {
            //Label1.Visible = true;
            //Label1.Text = "Hii,Admin";
            //Button1.Visible = true;
            Response.Redirect("~/Admin/Admin_Screen.aspx");
        }
        else
        {
            
        }
       

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string admin_user = t_admin_username.Text;
        string admin_pass = t_admin_password.Text;
        if (admin_user == "admin" && admin_pass == "OVS@dmin")
        {
            Session["admin_user"] = admin_user;
            string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
            using (StreamWriter outputFile = new StreamWriter(log, true))
            {

                outputFile.WriteLine(System.DateTime.Now.ToString()+" : Admin login succes");
               
            }
            if (Session["admin_user"] != null)
            {
                Response.Redirect("~/Admin/Admin_Screen.aspx");
                
            }
            else {
                Response.Redirect("Admin_Login.aspx");
            }
            HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            HttpContext.Current.Response.AddHeader("Pragma", "no-cache");
            HttpContext.Current.Response.AddHeader("Expires", "0");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Username Or Password is inccorrect Please try again.');", true);
            t_admin_username.Text = "";
            t_admin_password.Text = "";
        }
        
       
    }
}