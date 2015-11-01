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
    SqlCommand cmd, insert_otp_cmd; string cs; SqlDataReader rdr; int j = 0; int OTP; string get_OTP, set_OTP;
    string email, name; HttpCookie userInfo; string new1; string main_email; string f_try1;
    protected void Page_Load(object sender, EventArgs e)
    {

        //so as to add later in voter dashboard
        var menu = Page.Master.FindControl("NavigationMenu") as Menu;
        //if (menu != null)
        //{
        //    menu.Items.Remove(menu.FindItem("Voting"));

        //}
        MultiView1.SetActiveView(View1);

        if (!IsPostBack)
        {
            userInfo = new HttpCookie("userInfo");
            userInfo["UserName"] = "Annathurai";
            userInfo["UserColor"] = "Black";
            userInfo.Expires = DateTime.Now.AddMinutes(5);
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
        else{

            string cs10= System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con10 = new SqlConnection(cs10);
        con10.Open();
        cmd = new SqlCommand("select count(*) from VOTERINFO where vid=@vid", con10);
        cmd.Parameters.Add("@vid", aadhar_id.Text);
        cmd.Connection = con10;
        int find = (int)cmd.ExecuteScalar();
        //Response.Write("finsis "+find);
        con10.Close();

        if (find!=1)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);
         //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please enter valid aadhar id');", true);
        
        }
        else{
        //--fetch attempt
        string cs9 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con9 = new SqlConnection(cs9);
        con9.Open();
        cmd = new SqlCommand("select * from VOTERINFO where vid=@vid", con9);
        cmd.Parameters.Add("@vid", aadhar_id.Text);
        cmd.Connection = con9;
        rdr = cmd.ExecuteReader();

        if (rdr != null)
        {
            while (rdr.Read())
            {
                f_try1 = rdr["attempt"].ToString();
                h_try.Value = f_try1;
                h_cons.Value = rdr["cons_id"].ToString();
                Response.Write("attem " + f_try1);

            }
        }
        con9.Close();
        //--start of update attempt
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        insert_otp_cmd = new SqlCommand("update voterinfo set attempt=@attempt where vid=@vid", con1);
        insert_otp_cmd.Parameters.Add("@vid", aadhar_id.Text);
        insert_otp_cmd.Parameters.Add("@attempt", Convert.ToInt32(h_try.Value) + 1);
        if ((con1.State & ConnectionState.Open) > 0)
        {

            int i = insert_otp_cmd.ExecuteNonQuery();
            if (i != 0)
            {
                // ClientScript.RegisterStartupScript(GetType(), "alert", "alert('password set sucssessfully ');", true);

            }
        }

        //--end of update attempt
        //--check for attempt 


        if (Convert.ToInt32(f_try1) < 2)
        {

            MultiView1.ActiveViewIndex = 1;
            //  ClientScript.RegisterStartupScript(GetType(), "alert", "alert('password set sucssessfully ');", true);
        }
        else
        {
            MultiView1.ActiveViewIndex = 0;
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('more than required time attempt is done.. ');", true);
        }

        //--end of check attempt


        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        cmd = new SqlCommand("select * from voterinfo where vid=@vid", con);
        cmd.Parameters.Add("@vid", aadhar_id.Text);
        cmd.Connection = con;
        rdr = cmd.ExecuteReader();

        if (rdr != null)
        {
            while (rdr.Read())
            {
                email = rdr.GetString(4);
                main_email = email;
                name = rdr.GetString(1);
            }
        }
        con.Close();

        //---generate OTP to send
        OTP = OTPGenration.GenrateOTP();
        set_OTP = OTP.ToString();
        OTPGenration og = new OTPGenration();
        og.getsetOTP = set_OTP;

        //---email show ****
        int l = email.IndexOf('@');
        int w = email.Length;
        string x = email.Substring(l, w - l);

        int len = (email.IndexOf('@')) / 2;
        Response.Write(email + " " + name + " " + set_OTP);
        email = email.Substring(0, email.IndexOf('@') / 2);

        new1 = email.Substring(0, len);

        for (int i = 0; i < len; i++)
        {
            new1 = new1 + "*";
        }
        new1 = new1 + x;

        //--insert OTP into db
        insert_otp();
        string s = "OTP is sent to " + new1;
        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + s + "');", true);

        //--mail
        //using (MailMessage mm = new MailMessage("adharvotingsystem@gmail.com",main_email))
        //{
        //    mm.Subject = "OTP Mail";
        //    mm.Body = "Dear "+name+", Your OTP is : "+OTP;
        //    mm.IsBodyHtml = false;
        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.EnableSsl = true;
        //    NetworkCredential NetworkCred = new NetworkCredential("adharvotingsystem@gmail.com", "citybuzz");
        //    smtp.UseDefaultCredentials = true;
        //    smtp.Credentials = NetworkCred;
        //    smtp.Port = 587;
        //    smtp.Send(mm);
        //    string s = "OTP is sent to " + new1;
        //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('"+s+"');", true);
        //}
            }
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
        SqlCommand cmd = new SqlCommand("select  * from otpvoter where vid=@vid", con);
        cmd.Parameters.Add("@vid", aadhar_id.Text);
        cmd.Connection = con;
        rdr = cmd.ExecuteReader();

        if (rdr != null)
        {
            while (rdr.Read())
            {
                j++;
                get_OTP = rdr.GetDecimal(1).ToString();
                Response.Write("get otp" + get_user_otp + ":" + rdr["otp"].ToString());


            }
        }

        if (get_OTP == get_user_otp)
        {
            MultiView1.ActiveViewIndex = 2;
            //  BindListView();

        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('OTP Must match.');", true);
        }

        con.Close();

    }

    protected void insert_otp()
    {

        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        insert_otp_cmd = new SqlCommand("UPDATE OTPVOTER set otp=@otp where vid=@vid", con1);
        insert_otp_cmd.Parameters.Add("@vid", aadhar_id.Text);
        insert_otp_cmd.Parameters.Add("@otp", OTP);
        Response.Write("otp insert is " + OTP);
        if ((con1.State & ConnectionState.Open) > 0)
        {
            int i = insert_otp_cmd.ExecuteNonQuery();
            if (i != 0)
            {
                Response.Write("inserted succsesfuly");
                string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
                using (StreamWriter outputFile = new StreamWriter(log, true))
                {

                    outputFile.WriteLine(System.DateTime.Now.ToString() + " : OTP Generated for " + aadhar_id.Text + "OTP:   " + OTP.ToString());

                }
            }
            else
            {

                Response.Write("inserted not");
            }
        }

        con1.Close();

    }

    //private void BindListView()
    //{
    //    string constr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            cmd.CommandText = "SELECT * FROM voterinfo where vid=@vid";
    //            cmd.Parameters.AddWithValue("@vid", aadhar_id.Text);
    //            cmd.Connection = con;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dt = new DataTable();
    //                sda.Fill(dt);
    //                lvCustomers.DataSource = dt;
    //                lvCustomers.DataBind();
    //            }
    //        }
    //    }
    //}



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
        if (t_pass1.Text == t_pass2.Text)
        {

            string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(cs1);
            con1.Open();
            insert_otp_cmd = new SqlCommand("update voterinfo set vpassword=@vpassword where vid=@vid", con1);
            insert_otp_cmd.Parameters.Add("@vid", aadhar_id.Text);
            insert_otp_cmd.Parameters.Add("@vpassword", Password.Encrypt(t_pass2.Text.Trim()));
            if ((con1.State & ConnectionState.Open) > 0)
            {

                int i = insert_otp_cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('password set sucssessfully ');", true);
                    Session["vid"] = aadhar_id.Text;
                    Session["cons_id"] = h_cons.Value;

                    //to check if already voted or not
                    Response.Redirect("~/VoterDashboard.aspx");

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

        //else
        //{

        //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('password DONT MATCH ');", true);
        //}

    }

}
