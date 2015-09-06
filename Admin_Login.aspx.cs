using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string admin_user = t_admin_username.Text;
        string admin_pass = t_admin_password.Text;
        if (admin_user == "admin" && admin_pass == "OVS@dmin")
        {
            Response.Redirect("Admin_Screen.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Username Or Password is inccorrect Please try again.');", true);
            t_admin_username.Text = "";
            t_admin_password.Text = "";
        }
       
    }
}