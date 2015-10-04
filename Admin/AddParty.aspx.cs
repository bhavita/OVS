using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.IO; // this is for the file upload
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging; 


public partial class Admin_AddParty : System.Web.UI.Page
{

    SqlDataAdapter dadapter; DataSet dset; PagedDataSource adsource; int ID;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos; SqlDataReader dr1;
    Boolean editingparty = false; //so can conclude that button was for add new party
    protected void Page_Load(object sender, EventArgs e)
    {
        editingparty = false;

        PanelAddNewParty.Visible = true;
        if (!Page.IsPostBack)
        {

            h_edit.Value = "INSERT";
            this.ViewState["vs"] = 0;
        }
        pos = (int)this.ViewState["vs"];
        databind();


    }


    public void databind()
    {
        dadapter = new SqlDataAdapter("select pid,pname from ovs_party", connstring);
        // dadapter = new SqlDataAdapter("select * from candidate", connstring);
        dset = new DataSet();
        adsource = new PagedDataSource();
        dadapter.Fill(dset);
        adsource.DataSource = dset.Tables[0].DefaultView;
        adsource.PageSize = 10;
        adsource.AllowPaging = true;
        adsource.CurrentPageIndex = pos;
        btnfirst.Enabled = !adsource.IsFirstPage;
        btnprevious.Enabled = !adsource.IsFirstPage;
        btnlast.Enabled = !adsource.IsLastPage;
        btnnext.Enabled = !adsource.IsLastPage;
        DataList2.DataSource = adsource;
        DataList2.DataBind();
    }
    protected void sw1_Command(object sender, CommandEventArgs e)
    {
        Response.Write(e.CommandArgument.ToString());
    }

    protected void btnfirst_Click(object sender, EventArgs e)
    {
        pos = 0;
        databind();
    }

    protected void btnprevious_Click(object sender, EventArgs e)
    {
        pos = (int)this.ViewState["vs"];
        pos -= 1;
        this.ViewState["vs"] = pos;
        databind();
    }

    protected void btnnext_Click(object sender, EventArgs e)
    {
        pos = (int)this.ViewState["vs"];
        pos += 1;
        this.ViewState["vs"] = pos;
        databind();
    }

    protected void btnlast_Click(object sender, EventArgs e)
    {
        pos = adsource.PageCount - 1;
        databind();
    }

    protected void Delete_Command(object source, DataListCommandEventArgs e)
    {
        string pname = (e.CommandArgument).ToString();
        // Response.Write("delet click" +cons_name);
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        comd = new SqlCommand("select * from ovs_candidate where pid=(select pid from ovs_party where pname=@pname)", con1);
        //comd = new SqlCommand("select * from ovs_candidate where cons_id=(select cons_id from ovs_constituency where cons_name=@cons_name)", con1);
        comd.Parameters.Add("@pname", pname);
        rdr = comd.ExecuteReader();
        if (rdr.HasRows)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('party is already in used.');", true);
        }
        else
        {
            rdr.Close();
            SqlCommand cmd1 = new SqlCommand("Delete from ovs_party where pname=@pname", con1);
            cmd1.Parameters.Add("@pname", pname);
            int del = cmd1.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('party deleted sucssesfully.');", true);

            // Response.Write("del is " + del + " ");
            databind();
        }



    }


    protected void Edit_Command(object source, DataListCommandEventArgs e)
    {
        h_edit.Value = "EDIT";


        editingparty = true;

        ID = Convert.ToInt32(e.CommandArgument);

        PanelAddNewParty.Visible = true;
        string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con2 = new SqlConnection(cs2);
        SqlCommand pn, comd;
        con2.Open();
        SqlDataReader rdp;
        String pname = "random";

        if ((con2.State & ConnectionState.Open) > 0)
        {

            comd = new SqlCommand("SELECT pname from ovs_party where pid =(@pid)", con2);
            comd.Parameters.Add("@pid", ID.ToString());
            rdp = comd.ExecuteReader();

            if (rdp != null)
            {
                if (rdp.Read())
                {
                    pname = rdp.GetString(0);
                }

            }
            PartyName.Text = pname;
            Button1.Text = "Edit Party";
            h_pid.Value = ID.ToString();
            PartyImageUploadLabel.Text = "Change Party Symbol";

        }
    }
    SqlCommand insert_party, comd, edit_party;
    SqlDataReader rdr;
    protected void UploadButton_Click(object sender, EventArgs e)
    {

        String FileName = " ";

        if (h_edit.Value != "EDIT")
        {
            SqlConnection con = new SqlConnection(connstring);
            con.Open();
            SqlCommand cmd; SqlDataReader rdr;
            cmd = new SqlCommand("select top 1 * from ovs_party order by pid desc", con);

            rdr = cmd.ExecuteReader();

            if (rdr != null)
            {
                while (rdr.Read())
                {

                    FileName = rdr["pid"].ToString();
                    FileName = FileName + ".png";

                }
            }
            con.Close();


        }
        else
        {
            FileName = h_pid.Value + ".png";

        }



        if (FileUploadControl.HasFile)
        {
            //try
            //{
               
            //    FileUploadControl.SaveAs(Server.MapPath("~/img/party/") + FileName);
            //    //      StatusLabel.Text += "Upload status: File uploaded!";

            //}
            //catch (Exception ex)
            //{
            //    //StatusLabel.Text += "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            //}

            try
            {
                string directory = Server.MapPath("~/img/party/");
                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(FileUploadControl.FileContent);

                // Calculate the new image dimensions
                int origWidth = originalBMP.Width;
                int origHeight = originalBMP.Height;

                int newWidth = 64;
                int newHeight = 64;

                // Create a new bitmap which will hold the previous resized bitmap
                Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);
                // Create a graphic based on the new bitmap
                Graphics oGraphics = Graphics.FromImage(newBMP);

                // Set the properties for the new graphic file
                oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                // Draw the new graphic based on the resized bitmap
                oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);

                // Save the new graphic file to the server
                newBMP.Save(directory + FileName);

                // Once finished with the bitmap objects, we deallocate them.
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();

                StatusLabel.Text = "Upload status: File uploaded!";
                databind();

            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }

        databind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();

        if (h_edit.Value != "EDIT")
        {

            insert_party = new SqlCommand("INSERT INTO ovs_party (pname) VALUES(@pname)", con1);
            insert_party.Parameters.Add("@pname", PartyName.Text);
            if ((con1.State & ConnectionState.Open) > 0)
            {

                comd = new SqlCommand("SELECT pname FROM ovs_party WHERE pname=(@pname)", con1);
                comd.Parameters.Add("@pname", PartyName.Text);
                rdr = comd.ExecuteReader();
                if (rdr.HasRows)
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Party is already added.');", true);
                }

                else
                {
                    rdr.Close();
                    int i = insert_party.ExecuteNonQuery();
                    UploadButton_Click(sender, e);
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Party is  added.');", true);
                    PartyName.Text = "";
                    databind();
                    PartyName.Text = " ";
                    h_edit.Value = "INSERT";
                    con1.Close();
                }

            }

        }
        else
        {
            edit_party = new SqlCommand("UPDATE ovs_party SET pname= @pname where pid=@pid", con1);
            edit_party.Parameters.Add("@pname", PartyName.Text);
            edit_party.Parameters.Add("@pid", h_pid.Value);
            if ((con1.State & ConnectionState.Open) > 0)
            {
                int i = edit_party.ExecuteNonQuery();
                h_edit.Value = "EDIT";
                UploadButton_Click(sender, e);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Party is updated.');", true);
                PartyName.Text = "";
                con1.Close();
            }
            databind();
            PartyName.Text = " ";
            Button1.Text = "Add Party";
            h_edit.Value = "INSERT";


        }


    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void LogOut(object sender, EventArgs e)
    {
        try
        {
            Session.Abandon();
            Session.Clear();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";

            string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
            using (StreamWriter outputFile = new StreamWriter(log, true))
            {

                outputFile.WriteLine(System.DateTime.Now.ToString() + " : Admin Logout succes");

            }
            Response.Redirect("~/Admin_Login.aspx");

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);

        }
    }
}