using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using CrystalDecisions.CrystalReports;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class pass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    DataTable dt;
        //    String SQL = "SELECT * FROM ovs_party";


        //    string sConstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //    using (SqlConnection conn = new SqlConnection(sConstr))
        //    {
        //        using (SqlCommand comm = new SqlCommand(SQL, conn))
        //        {
        //            conn.Open();
        //            using (SqlDataAdapter da = new SqlDataAdapter(comm))
        //            {
        //                dt = new DataTable("ovs_party");
        //                da.Fill(dt);
        //            }
        //        }
        //    }


        //    ReportDocument _rdStudents = new ReportDocument();
        //    string reportPath = Server.MapPath("CrystalReport.rpt");
        //    _rdStudents.Load(reportPath);

        //    _rdStudents.SetDataSource(dt);

        //    rptviewer.ReportSource = _rdStudents;

        //}
        try
        {
            ReportDocument report = new ReportDocument();

            report.Load(Server.MapPath("~/CrystalReport7.rpt"));

            report.SetDatabaseLogon(@"govind\riddhi", "", @"govind\sqlexpress", "ovs");

            rptviewer.ReportSource = report;
        }
        catch (Exception q)
        {
            Response.Write(q);
        }

        //try
        //{
        //    ReportDocument crystalReport = new ReportDocument();
        //    crystalReport.Load(Server.MapPath("~/CrystalReport.rpt"));
        //    Customers dsCustomers = GetData();
        //    crystalReport.SetDataSource(dsCustomers);
        //    CrystalReportViewer1.ReportSource = crystalReport;
        //    CrystalReportViewer1.DataBind();
        //}
        //catch (Exception r) {

        //    Response.Write(r);
        //}

    }
    //private Customers GetData()
    //{
    //    string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //    SqlCommand cmd = new SqlCommand("Customers_GetCustomers");
    //    using (SqlConnection con = new SqlConnection(conString))
    //    {
    //        using (SqlDataAdapter sda = new SqlDataAdapter())
    //        {
    //            cmd.Connection = con;
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            sda.SelectCommand = cmd;
    //            using (Customers dsCustomers = new Customers())
    //            {
    //                sda.Fill(dsCustomers, "ovs_party");
    //                return dsCustomers;
    //            }
    //        }
    //    }
    //}
    protected void Encrypt(object sender, EventArgs e)
    {
        lblEncryptedText.Text = this.Encrypt(txtOriginalText.Text.Trim());
    }
    private string Encrypt(string clearText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }

    protected void Decrypt(object sender, EventArgs e)
    {
        lblDecryptedText.Text = this.Decrypt(txtEncryptedText.Text.Trim());
    }
    private string Decrypt(string cipherText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }
    //protected override void OnPreRender(EventArgs e)
    //{
    //    try
    //    {
    //        ReportDocument report = new ReportDocument();

    //        report.Load(Server.MapPath("~/CrystalReport.rpt"));

    //        report.SetDatabaseLogon(@"govind\riddhi", "", @"govind\sqlexpress", "ovs");

    //        rptviewer.ReportSource = report;
    //    }
    //    catch (Exception q)
    //    {
    //        Response.Write(q);
    //    }

    //}
}