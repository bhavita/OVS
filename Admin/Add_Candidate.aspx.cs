using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
public partial class Add_Candidate : System.Web.UI.Page
{
    SqlCommand insert_party, get_party, comd; SqlDataReader rdr,dr1;
    ArrayList arrName = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select * from ovs_candidate";
        cmd.Connection = con;
        try
        {
            
            dr1 = cmd.ExecuteReader();

            if (dr1 != null)
                while (dr1.Read())
                {
                    //fill arraylist
                    arrName.Add(dr1["p_id"]);
                    
                }
        }
        finally
        {
            con.Close();
        }
        

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string can_name = TextBox1.Text;

        int cons_id = Convert.ToInt32(DropDownList3.SelectedValue);
        string can_desc = TextBox3.Text;
        string can_qal = TextBox4.Text;
        int p_id = Convert.ToInt32(DropDownList4.SelectedValue);
        string c_add = TextBox9.Text;
        string email = TextBox7.Text;
        long phno = Convert.ToInt64(TextBox8.Text);

        Response.Write(can_name+" "+cons_id+" "+can_desc+""+can_qal+" "+p_id+" "+c_add+" "+email+" "+phno);

        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        insert_party = new SqlCommand("INSERT INTO ovs_candidate (C_NAME,cons_id,can_desc,can_qual,p_id,can_email,can_phno) VALUES(@c_name,@cons_id,@c_description,@c_qualification,@pid,@email,@phone_no)", con1);
        insert_party.Parameters.Add("@c_name", can_name);
        insert_party.Parameters.Add("@cons_id",cons_id);
        insert_party.Parameters.Add("@c_description", can_desc);
        insert_party.Parameters.Add("@c_qualification", can_qal);
        insert_party.Parameters.Add("@pid", p_id);
        insert_party.Parameters.Add("@email", email);
        insert_party.Parameters.Add("@phone_no", phno);
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand();
         cmd.CommandText = "Select * from ovs_candidate";
         cmd.Connection = con;
       
        try {
           
          dr1 = cmd.ExecuteReader();

          if (dr1 != null)
              while (dr1.Read())
              {
                  //fill arraylist
                  arrName.Add(dr1["p_id"]);
                  Response.Write(" " + dr1["p_id"]);
              }
        }
        finally {
            con.Close();
        }
        if ((con1.State & ConnectionState.Open) > 0) {
            if (arrName.Contains(p_id))
            {
                 ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Same Party for candidate is not added for this constituency.');", true);
            }
            else{
                int i = insert_party.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Candidate is  added.');", true);
                con1.Close();

            }
                    
        }
        else {
            //Response.Write("not conncted");
        }
       

    }
    
}