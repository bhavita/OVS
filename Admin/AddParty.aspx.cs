using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Admin_AddParty : System.Web.UI.Page
{
    SqlCommand insert_party,comd; SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        insert_party = new SqlCommand("INSERT INTO ovs_party (p_name) VALUES(@pname)", con1);
        insert_party.Parameters.Add("@pname", TextBox1.Text);
        if ((con1.State & ConnectionState.Open) > 0)
        {
            //Response.Write("Connection OK!");
            comd = new SqlCommand("SELECT p_name FROM ovs_party WHERE p_name=(@pname)",con1);
            comd.Parameters.Add("@pname", TextBox1.Text);
            rdr = comd.ExecuteReader();
            if (rdr.HasRows)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Party is already added.');", true);
            }
                
            else
            {
                rdr.Close();
                int i = insert_party.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Party is  added.');", true);
                TextBox1.Text = "";
                con1.Close();
            }
             
        }
        else
        {
            //Response.Write("not conncted");
        }
       
    }
   

}