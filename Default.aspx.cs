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
        using (MailMessage mm = new MailMessage("adharvotingsystem@gmail.com", "riddhisoni1324@gmail.com"))
        {
            mm.Subject = "OTP Mail";
            mm.Body = "hello";
            //if (fuAttachment.HasFile)
            //{
            //    string FileName = Path.GetFileName(fuAttachment.PostedFile.FileName);
            //    mm.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, FileName));
            //}
            mm.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("adharvotingsystem@gmail.com", "citybuzz");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
        }
        ScriptManager.RegisterClientScriptBlock(this, GetType(),
            "alertMessage", @"alert('OTP is sent to your email id')", true);
    }



    protected void txtGetImage_Click(object sender, EventArgs e)
    {
        Image1.ImageUrl = "ImageHandler.ashx?roll_no=" + txtrollno.Text;

    }

}
