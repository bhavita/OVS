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
    string email, name; HttpCookie userInfo; string new1; string main_email;
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);

        if (!IsPostBack)
        {
            userInfo = new HttpCookie("userInfo");
            userInfo["UserName"] = "Annathurai";
            userInfo["UserColor"] = "Black";
            userInfo.Expires = DateTime.Now.AddMinutes(1);
            Response.Cookies.Add(userInfo);
          
        }
        
    }
    protected void lnkTab1_Click(object sender, EventArgs e)
    {

        MultiView1.ActiveViewIndex = 0;
    }
    protected void lnkTab2_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["userInfo"] == null)
        {
            Response.Redirect("Default.aspx");  //to refresh the page
        }
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
                email = rdr.GetString(4);
                main_email = email;
                name = rdr.GetString(1);
            }
        }
        con.Close();
               
        
        //---generate OTP to send
        OTP=OTPGenration.GenrateOTP();
        set_OTP = OTP.ToString();
        OTPGenration og = new OTPGenration();
        og.getsetOTP = set_OTP;
       
        //---email show ****
        int l = email.IndexOf('@');
        int w = email.Length;
        string x = email.Substring(l,w-l);
        
        int len = (email.IndexOf('@')) / 2;
        Response.Write(email + " " + name+" "+set_OTP);
        email = email.Substring(0, email.IndexOf('@')/2);
       
        new1 = email.Substring(0,len);

        for (int i = 0; i < len ; i++)
        {
            new1 = new1 + "*";
         }
        new1 = new1 + x;
        
        //--insert OTP into db
        insert_otp();
       
        //--mail
        using (MailMessage mm = new MailMessage("adharvotingsystem@gmail.com",main_email))
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
            string s = "OTP is sent to " + new1;
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('"+s+"');", true);
        }
   }

    protected void Button1_Click(object sender, EventArgs e)
    {
       

        if (Request.Cookies["userInfo"] == null)
        {
            Response.Redirect("Default.aspx");  //to refresh the page
        }
    
        
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
        if (get_OTP == get_user_otp) {
            MultiView1.ActiveViewIndex = 2;
            BindListView();
           
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
            int i = insert_otp_cmd.ExecuteNonQuery();
            if (i != 0) {
            }
            else {
            }
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
     
    }

    protected void setpass(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
        if (Request.Cookies["userInfo"] == null)
        {
            Response.Redirect("Default.aspx");  //to refresh the page
        }
      
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        insert_otp_cmd = new SqlCommand("update voterinfo set vpassword=@vpassword where vid=@vid", con1);
        insert_otp_cmd.Parameters.Add("@vid", aadhar_id.Text);
        insert_otp_cmd.Parameters.Add("@vpassword", t_pass2.Text);
        if ((con1.State & ConnectionState.Open) > 0)
        {
            
            int i = insert_otp_cmd.ExecuteNonQuery();
            if (i != 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('password set sucssessfully ');", true);

            }
            else
            {
                //Response.Write("row not inserted");
            }
        }
        else
        {
            //Response.Write("not conncted");
        }
    }
}
