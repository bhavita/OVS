using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.IO; // this is for the file upload
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;



public partial class Add_Candidate : System.Web.UI.Page
{
    SqlCommand insert_party, edit_can, get_party, comd; SqlDataReader rdr, dr1;
    ArrayList arrName = new ArrayList();
    SqlDataAdapter dadapter; DataSet dset; PagedDataSource adsource; int ID;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos; int age;
    //DateTime bday; string can_name;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
            Act.Value = "Insert";
            this.ViewState["vs"] = 0;

        }
        pos = (int)this.ViewState["vs"];
        databind();

    }

    public void databind()
    {
        dadapter = new SqlDataAdapter("SELECT * FROM ovs_candidate a  JOIN ovs_constituency b ON a.CONS_ID = b.cons_id JOIN ovs_party c ON a.PID = c.pid", connstring);
        dset = new DataSet();
        adsource = new PagedDataSource();
        dadapter.Fill(dset);
        adsource.DataSource = dset.Tables[0].DefaultView;
        adsource.PageSize = 12;
        adsource.AllowPaging = true;
        adsource.CurrentPageIndex = pos;
        btnfirst.Enabled = !adsource.IsFirstPage;
        btnprevious.Enabled = !adsource.IsFirstPage;
        btnlast.Enabled = !adsource.IsLastPage;
        btnnext.Enabled = !adsource.IsLastPage;
        DataList2.DataSource = adsource;
        DataList2.DataBind();
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Act.Value == "Insert")
        {
            string can_name = C_Name.Text;
            //try
            //{
            //    tdob.Visible = true;
            //    tdob.Enabled = true;
            //     can_name = C_Name.Text;
            //    string dt = Request.Form[tdob.UniqueID];
            //    bday = DateTime.Parse(dt);
            //    DateTime today = DateTime.Today;
            //     age = today.Year - bday.Year;
            //    if (bday > today.AddYears(-age)) age--;
            //}
            //catch (Exception e3) {
            //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Enter proper date format.');", true);

            //}
            //if (age < 28)
            //{
            //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Candidate should be atleast 28 years old .');", true);
            //}

            //else
            //{

            int cons_id = Convert.ToInt32(C_Cons.SelectedValue); //COMMENT THIS TO CHECK EDIT
            int pid = Convert.ToInt32(Pname.SelectedValue);//COMMENT THIS TO CHECK EDIT
            string can_desc = C_Des.Text;
            string can_qal = C_qual.Text;
            //string can_name = C_Name.Text;
            string c_add = CAdd.Text;
            string email = Cemail.Text;
            long phno = Convert.ToInt64(CPhno.Text);
            string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(cs1);
            con1.Open();

            if (Act.Value != "EDIT")
            {
                insert_party = new SqlCommand("INSERT INTO ovs_candidate (C_NAME,cons_id,c_description,c_qualification,pid,email,phone_no) VALUES(@c_name,@cons_id,@c_description,@c_qualification,@pid,@email,@phone_no)", con1);
                insert_party.Parameters.Add("@c_name", can_name);
                insert_party.Parameters.Add("@cons_id", cons_id); //COMMENT THIS TO CHECK EDIT
                insert_party.Parameters.Add("@c_description", can_desc);
                insert_party.Parameters.Add("@c_qualification", can_qal);
                insert_party.Parameters.Add("@pid", pid);//COMMENT THIS TO CHECK EDIT
                insert_party.Parameters.Add("@email", email);
                insert_party.Parameters.Add("@phone_no", phno);
                // insert_party.Parameters.Add("@birthdate", bday);
                // insert_party.Parameters.Add("@age", age);

                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from ovs_candidate where cons_id=@cons_id", con);
                cmd.Parameters.Add("@cons_id", cons_id);

                //COMMENT THIS TO CHECK EDIT
                try
                {

                    dr1 = cmd.ExecuteReader();

                    if (dr1 != null)
                        while (dr1.Read())
                        {
                            //fill arraylist
                            arrName.Add(dr1["pid"]);
                            //Response.Write(" " + dr1["pid"]);
                        }
                }
                finally
                {
                    con.Close();
                }
                if ((con1.State & ConnectionState.Open) > 0)
                {
                    if (arrName.Contains(pid))
                    {
                        string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
                        using (StreamWriter outputFile = new StreamWriter(log, true))
                        {

                            outputFile.WriteLine(System.DateTime.Now.ToString() + " : Admin  attempted to add"+ can_name +" more than 1 candidate for same party in same constituency-RESTRICTED");

                        }
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Same Party for candidate is not added for this constituency.');", true);
                    }
                    else
                    {
                        int i = insert_party.ExecuteNonQuery();
                        UploadButton_Click(sender, e);
                        //try
                        //{
                        //    int i = insert_party.ExecuteNonQuery();
                        //    UploadButton_Click(sender, e);
                        //}catch(Exception t5 ){

                        //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('try after some time.');", true);

                        //}

                        string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
                        using (StreamWriter outputFile = new StreamWriter(log, true))
                        {

                            outputFile.WriteLine(System.DateTime.Now.ToString() + " : Admin added new Candidate "+ can_name +" succesfully");

                        }
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Candidate is  added.');", true);
                        con1.Close();
                        MultiView1.ActiveViewIndex = 0;

                    }

                }

            }



            else
            {


                string cs14 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con14 = new SqlConnection(cs14);
                con14.Open();
                edit_can = new SqlCommand("UPDATE ovs_candidate  set C_NAME = @c_name ,c_description = @c_description,c_qualification=@c_qualification,email = @email,phone_no = @phone_no where c_id=@cid", con1);
                edit_can.Parameters.Add("@c_name", can_name);
                //edit_can.Parameters.Add("@cons_id", cons_id);
                edit_can.Parameters.Add("@c_description", can_desc);
                edit_can.Parameters.Add("@c_qualification", can_qal);
                //edit_can.Parameters.Add("@pid", pid); //wont be der in edit
                edit_can.Parameters.Add("@email", email);
                edit_can.Parameters.Add("@phone_no", phno);
                edit_can.Parameters.Add("@cid", Hcid.Value);
                if ((con14.State & ConnectionState.Open) > 0)
                {
                    int i = edit_can.ExecuteNonQuery();
                    Act.Value = "EDIT";
                    UploadButton_Click(sender, e);
                    Image1.ImageUrl = "~/img/candidate/" + Hcid.Value + ".png";
                    Image1.Visible = true;

                    string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
                    using (StreamWriter outputFile = new StreamWriter(log, true))
                    {

                        outputFile.WriteLine(System.DateTime.Now.ToString() + " : Admin editted" + can_name + "  succesfully");

                    }
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Can is updated.');", true);

                    con14.Close();
                }


                databind();
                Act.Value = "Insert";
                Button1.Text = "Add new Candidate";

                MultiView1.ActiveViewIndex = 0;


            }
        }
    }




    protected void Edit_Command(object source, DataListCommandEventArgs e)
    {

        MultiView1.ActiveViewIndex = 1;
       // t_Date.Visible = true;
        Act.Value = "EDIT";
        C_Cons.ClearSelection();
        Pname.ClearSelection();

        ID = Convert.ToInt32(e.CommandArgument);
        //Response.Write("can id is "+ID);
        Hcid.Value = ID.ToString();


        string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con2 = new SqlConnection(cs2);
        SqlCommand pn, comd;
        con2.Open();
        SqlDataReader rdp;
        String pname = "random";

        if ((con2.State & ConnectionState.Open) > 0)
        {

            comd = new SqlCommand("SELECT * from ovs_candidate  a  JOIN ovs_constituency b ON a.CONS_ID = b.cons_id JOIN ovs_party c ON a.PID = c.pid where a.c_id =(@c_id)", con2);
            comd.Parameters.Add("@c_id", ID.ToString());
            rdp = comd.ExecuteReader();

            if (rdp != null)
            {
                if (rdp.Read())
                {
                    C_Name.Text = rdp["C_NAME"].ToString();
                    int i = rdp.GetInt32(rdp.GetOrdinal("Cons_Id"));
                    foreach (ListItem li1 in C_Cons.Items)
                    {
                        if (li1.Text == rdp["cons_name"].ToString())
                        {
                            li1.Selected = true;
                    
                        }
                    }


                    foreach (ListItem li2 in Pname.Items)
                    {
                        if (li2.Text == rdp["pname"].ToString())
                        {
                            li2.Selected = true;

                        }
                    }

                    C_Des.Text = rdp["C_DESCRIPTION"].ToString();
                    C_qual.Text = rdp["C_QUALIFICATION"].ToString();
                    Cemail.Text = rdp["EMAIL"].ToString();
                    CPhno.Text = rdp["PHONE_NO"].ToString();
                    //tdob.Text = rdp["birthdate"] == System.DBNull.Value ? null : Convert.ToDateTime(rdp["Birthdate"]).ToString("dd/MM/yyyy");
                    //t_Date.Text = rdp["birthdate"] == System.DBNull.Value ? null : Convert.ToDateTime(rdp["Birthdate"]).ToString("dd/MM/yyyy");
                    //tdob.Visible = false;
                    //t_Date.Enabled = false;
                    C_Cons.Enabled = false;
                    Pname.Enabled = false;



                }

            }
            Button1.Text = "Edit Candidate";
            Image1.ImageUrl = "~/img/candidate/" + Hcid.Value + ".png";
            Image1.Visible = true;

        }
    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {

        String FileName = " ";

        if (Act.Value != "EDIT")
        {
            SqlConnection con = new SqlConnection(connstring);
            con.Open();
            SqlCommand cmd; SqlDataReader rdr;
            cmd = new SqlCommand("select top 1 * from ovs_candidate order by c_id desc", con);

            rdr = cmd.ExecuteReader();

            if (rdr != null)
            {
                while (rdr.Read())
                {

                    FileName = rdr["c_id"].ToString();
                    FileName = FileName + ".png";

                }
            }
            con.Close();


        }
        else
        {
            FileName = Hcid.Value + ".png";
            
        }



        if (FileUploadControl.HasFile)
        {
            try
            {
                string directory = Server.MapPath("~/img/candidate/");
                // Create a bitmap of the content of the fileUpload control in memory
                Bitmap originalBMP = new Bitmap(FileUploadControl.FileContent);

                // Calculate the new image dimensions
                int origWidth = originalBMP.Width;
                int origHeight = originalBMP.Height;

                int newWidth = 128;
                int newHeight = 128;

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

                //      StatusLabel.Text += "Upload status: File uploaded!";

            }
            catch (Exception ex)
            {
                //StatusLabel.Text += "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }

        databind();
        Image1.ImageUrl = String.Format("~/img/candidate/{0}.png", FileName);
        MultiView1.ActiveViewIndex = 0;
        //Response.Write("after file name"+FileName);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        C_Name.Text = "";
        C_Des.Text = "";
        C_qual.Text = "";
        Cemail.Text = "";
        CPhno.Text = "";
        CAdd.Text = "";
        Image1.ImageUrl = "";
        C_Cons.ClearSelection();
        Pname.ClearSelection();
        C_Cons.Enabled = true;
        Pname.Enabled = true;
        //tdob.Enabled = true;
        //tdob.Text = " ";
        //t_Date.Visible = false;
        //tdob.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
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