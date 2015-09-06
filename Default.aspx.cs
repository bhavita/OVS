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
    SqlCommand cmd; string cs; SqlDataReader rdr; int j = 0; 
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
        SqlCommand cmd = new SqlCommand("select * from voterinfo where vid=@vid", con);
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
        int OTP=OTPGenration.GenrateOTP();
        Response.Write(email + " " + name+" "+OTP.ToString());

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



    protected void txtGetImage_Click(object sender, EventArgs e)
    {
        Image1.ImageUrl = "ImageHandler.ashx?roll_no=" + txtrollno.Text;

    }

    
}
