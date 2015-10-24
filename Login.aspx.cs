using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();

        SqlDataReader dr;
        SqlCommand c = new SqlCommand("Select * from voterinfo where vid=@Vid", con1);
        c.Parameters.Add("@Vid", aadhar_id.Text);



        try
        {
            dr = c.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    String epass = dr["VPASSWORD"].ToString();
                    String cons_id = dr["CONS_ID"].ToString();
                    String dpass = Password.Decrypt(epass.Trim());

                    if (dpass == t_pass1.Text)
                    {

                        //have tried to set. DO check.
                        Session["vid"] = aadhar_id.Text;
                        Session["cons_id"] = cons_id;
                        Response.Redirect("VoterDashboard.aspx");

                    }
                    else
                    {

                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Login Unsuccessful. See again');", true);


                    }
                }
            }
            else {


                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Login Unsuccessful. See again');", true);
            }
        }
        finally
        {
           
            con1.Close();
        }
    
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
            "alert('Forget Password? No Worries. We shall help you login using OTP....'); window.location='" +
            Request.ApplicationPath + "/Default.aspx';", true);
        
    }
}