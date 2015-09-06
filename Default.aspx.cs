using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page
{
    SqlCommand cmd, insert_otp_cmd; string cs; SqlDataReader rdr; int j = 0; int OTP; string get_OTP,set_OTP;
    string email,name;
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
    }
    protected void lnkTab1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void lnkTab2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        cmd = new SqlCommand("select * from voterinfo where vid=@vid", con);
        cmd.Parameters.Add("@vid",aadhar_id.Text);
        cmd.Connection = con;
        rdr = cmd.ExecuteReader();
        
        if (rdr != null){
            while (rdr.Read()){
                j++;
                email = rdr.GetString(4);
                name = rdr.GetString(1);
            }
        }
        con.Close();
               
        
        //---generate OTP to send
        OTP=OTPGenration.GenrateOTP();
        set_OTP = OTP.ToString();
        OTPGenration og = new OTPGenration();
        og.getsetOTP = set_OTP;
        Response.Write(email + " " + name+" "+set_OTP);

        //--insert OTP into db
        insert_otp();
       
        //--mail
        using (MailMessage mm = new MailMessage("adharvotingsystem@gmail.com",email))
        {
            mm.Subject = "OTP Mail";
            mm.Body = "Dear "+name+", Your OTP is : "+OTP;
            mm.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("adharvotingsystem@gmail.com", "citybuzz");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('OTP is sent to your email id.');", true);
        }
   }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string get_user_otp = TextBox2.Text.ToString();
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from otpvoter where vid=@vid", con);
        cmd.Parameters.Add("@vid", aadhar_id.Text);
        cmd.Connection = con;
        rdr = cmd.ExecuteReader();

        if (rdr != null)
        {
            while (rdr.Read())
            {
                j++;
                get_OTP = rdr.GetDecimal(1).ToString();
                
            }
        }
        //Response.Write("otp from db is " + get_OTP + " " +"hiii"+get_user_otp);
        if (get_OTP == get_user_otp) {
            MultiView1.ActiveViewIndex = 2;
            BindListView();
            //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('OTP matched.');", true);
           
        }
        else {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('OTP Must match.');", true);
        }
        
        con.Close();

    }

    protected void insert_otp()
    {
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        insert_otp_cmd = new SqlCommand("INSERT INTO OTPVOTER (vid,otp) VALUES(@vid,@otp)", con1);
        insert_otp_cmd.Parameters.Add("@vid", aadhar_id.Text);
        insert_otp_cmd.Parameters.Add("@otp", OTP);
        if ((con1.State & ConnectionState.Open) > 0)
        {
            //Response.Write("Connection OK!");
            int i = insert_otp_cmd.ExecuteNonQuery();
            if (i != 0) {
                //Response.Write(i);
                //Response.Write("row inserted");
            }
            else {
                //Response.Write("row not inserted");
            }
        }
        else {
            //Response.Write("not conncted");
        }

        con1.Close();

    }

    private void BindListView()
    {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM voterinfo where vid=@vid";
                cmd.Parameters.AddWithValue("@vid", aadhar_id.Text);
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lvCustomers.DataSource = dt;
                    lvCustomers.DataBind();
                }
            }
        }
    }

    protected void txtGetImage_Click(object sender, EventArgs e)
    {
      //  Image1.ImageUrl = "ImageHandler.ashx?roll_no=" + txtrollno.Text;

    }

    protected void setpass(object sender, EventArgs e)
    {
        Response.Write("You clicked me");
        MultiView1.ActiveViewIndex = 3;
       // string pa = TextBox1.Text;
        //Response.Write("You clicked me  "+pa);
        
    }
}
