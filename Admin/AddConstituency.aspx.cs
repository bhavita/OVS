using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_AddConstituency : System.Web.UI.Page
{
    SqlCommand insert_party, comd; SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        insert_party = new SqlCommand("INSERT INTO ovs_constituency (cons_name) VALUES(@cons_name)", con1);
        insert_party.Parameters.Add("@cons_name", TextBox1.Text);
        if ((con1.State & ConnectionState.Open) > 0)
        {
            //Response.Write("Connection OK!");
            comd = new SqlCommand("SELECT cons_name FROM ovs_constituency WHERE cons_name=(@cons_name)", con1);
            comd.Parameters.Add("@cons_name", TextBox1.Text);
            rdr = comd.ExecuteReader();
            if (rdr.HasRows)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Constituency is already added.');", true);
            }

            else
            {
                rdr.Close();
                int i = insert_party.ExecuteNonQuery();
                con1.Close();
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Constituency is  added.');", true);
                TextBox1.Text = "";
            }

        }
        else
        {
            //Response.Write("not conncted");
        }
    }
}