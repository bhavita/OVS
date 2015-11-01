using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;


public partial class Voting : System.Web.UI.Page
{
    SqlDataAdapter dadapter; DataSet dset; PagedDataSource adsource;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos; SqlDataReader dr1;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            this.ViewState["vs"] = 0;

            h_vid.Value = Session["vid"].ToString();
            checkEnv();
            var menu = Page.Master.FindControl("NavigationMenu") as Menu;
            if (menu != null)
            {
                menu.Items.Remove(menu.FindItem("Admin"));
                menu.Items.Remove(menu.FindItem("Login"));
                menu.Items.Remove(menu.FindItem("Home"));

            }
        }
        pos = (int)this.ViewState["vs"];
        databind();
    }

    protected void checkEnv()
    {
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con4 = new SqlConnection(cs1);
        con4.Open();
        SqlDataReader dr1c;
        SqlCommand ct = new SqlCommand("Select * from voted where vid=@Vid", con4);
        ct.Parameters.Add("@Vid", h_vid.Value.ToString());

        //COMMENT THIS TO CHECK EDIT
        try
        {
            dr1c = ct.ExecuteReader();
            if (dr1c.HasRows)
            {
                string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
                using (StreamWriter outputFile = new StreamWriter(log, true))
                {

                    outputFile.WriteLine(System.DateTime.Now.ToString() + " : Voter " + h_vid.Value.ToString() + " tried to Vote even though previously voted.RESTRICTED");

                }
 //               ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
 //"alert('Already Voted. Redirecting'); window.location='" +
 //Request.ApplicationPath + "/VoterDashboard.aspx';", true);

                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup1", "showmodalpopup1();", true);
                //Response.Redirect("VoterDashboard.aspx");
                //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Already Voted');", true);
            }
            else
            {
                dr1c.Close();
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('WELCOME. WE ARE PROUD OF YOU FOR FULFILLING YOUR RESPONSIBILITY OF VOTING');", true);


            }
        }
        finally
        {
            con4.Close();
        }
    }





    public void databind()
    {

        dadapter = new SqlDataAdapter("select c_id,c_name,cons_id,pid from candidate where cons_id=(select cons_id from voterinfo where vid=@cons_id)", connstring);
        dadapter.SelectCommand.Parameters.AddWithValue("@cons_id", h_vid.Value);
        // dadapter = new SqlDataAdapter("select * from candidate", connstring);
        dset = new DataSet();
        adsource = new PagedDataSource();
        dadapter.Fill(dset);
        adsource.DataSource = dset.Tables[0].DefaultView;
        adsource.PageSize = 25;
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

        int ID = Convert.ToInt32(e.CommandArgument);

        Response.Write("cid is " + ID);
        //t_type_id.Text = ID.ToString();
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO voted (Cid,Vid) VALUES(@Cid,@Vid)", con1);
        cmd.Parameters.Add("@Cid", ID.ToString());
        cmd.Parameters.Add("@Vid", h_vid.Value.ToString());
        cmd.Connection = con1;
        int i = cmd.ExecuteNonQuery();

        SqlCommand cmd2 = new SqlCommand("Select * from voted where vid=@Vid", con1);
        cmd2.Parameters.Add("@Vid", h_vid.Value.ToString());

        //COMMENT THIS TO CHECK EDIT
        try
        {
            dr1 = cmd2.ExecuteReader();
            if (dr1.HasRows)
            {
                string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
                using (StreamWriter outputFile = new StreamWriter(log, true))
                {

                    outputFile.WriteLine(System.DateTime.Now.ToString() + " : Voter " + h_vid.Value.ToString() + " Voted succesfully");

                }

                //string url = "Socialshare.aspx";
                //string s = "window.open('" + url + "', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                //ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
                //Response.Redirect("VoterDashboard.aspx");

                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);
              //  Response.Redirect("Socialshare.aspx");

 //               ScriptManager.RegisterStartupScript(this, this.GetType(), "OpenWindow",
 //"alert('ThankYou. Vote has been Registered. Share to the world you voted'); window.open(Request.ApplicationPath+'/Socialshare.aspx','_newtab');", true);

 //               ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
 //       "alert('SocialShare opened in new tab.This window will redirect to Dashboard :D '); window.location='" +
 //       Request.ApplicationPath + "/Default.aspx';", true);



            }
            else
            {
                dr1.Close();
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Due to some issues or heavy traffic your vote was not registered.Kindly try in some time.');", true);
                string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
                using (StreamWriter outputFile = new StreamWriter(log, true))
                {

                    outputFile.WriteLine(System.DateTime.Now.ToString() + " : Voter " + h_vid.Value.ToString() + " attempted Voting but not succesful");

                }

            }
        }
        finally
        {
            con1.Close();
        }
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

    protected void Edit_Command(object source, DataListCommandEventArgs e)
    {


    }
}