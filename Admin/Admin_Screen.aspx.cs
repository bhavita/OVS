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
    int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        party1();
        constituency();
        candidate();


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

    }
    protected void party1()
    {

        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);

        string stmt_p = "SELECT COUNT(*) FROM ovs_party";

        using (SqlConnection thisConnection = con1)
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt_p, thisConnection))
            {
                thisConnection.Open();
                count = (int)cmdCount.ExecuteScalar();
                l_party.Text = count.ToString();
            }
        }

    }
    protected void constituency()
    {
        string cs12 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con12 = new SqlConnection(cs12);
        string stmt_c = "SELECT COUNT(*) FROM ovs_constituency";

        using (SqlConnection thisConnection = con12)
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt_c, thisConnection))
            {
                thisConnection.Open();
                count = (int)cmdCount.ExecuteScalar();
                l_cons.Text = count.ToString();
            }
        }
    }

    protected void candidate() {
        string cs12 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con12 = new SqlConnection(cs12);
        string stmt_c = "SELECT COUNT(*) FROM ovs_candidate";

        using (SqlConnection thisConnection = con12)
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt_c, thisConnection))
            {
                thisConnection.Open();
                count = (int)cmdCount.ExecuteScalar();
                l_can.Text = count.ToString();
            }
        }
    
    
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