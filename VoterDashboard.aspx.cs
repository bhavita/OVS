using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class VoterDashboard : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

        var menu = Page.Master.FindControl("NavigationMenu") as Menu;
        if (menu != null)
        {
            if (menu.FindItem("Voting") == null)
            {
                menu.Items.Add(new MenuItem
                {
                    Text = "Voting",
                    NavigateUrl = "~/Voting.aspx"

                });

            }

           menu.FindItem("Home").NavigateUrl = Request.ApplicationPath+"/VoterDashboard.aspx"; //should not go to register or default
           menu.Items.Remove(menu.FindItem("Login"));
         

        }

        if (!IsPostBack) {
            if (Session["vid"] != null)
            {
               vid.Value = Session["vid"].ToString();
               //Response.Write("vis is " + vid);
            }
            else {
                Response.Redirect("Login.aspx");
            }

        }

       


    }

  
    protected void castVote_Click(object sender, ImageClickEventArgs e)
    {
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con4 = new SqlConnection(cs1);
        con4.Open();
        SqlDataReader dr1c;
        SqlCommand ct = new SqlCommand("Select * from voted where vid=@vid", con4);
        ct.Parameters.Add("@Vid", vid.Value.ToString());

        //COMMENT THIS TO CHECK EDIT
        try
        {
            dr1c = ct.ExecuteReader();
            if (dr1c.HasRows)
            {
                string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
                using (StreamWriter outputFile = new StreamWriter(log, true))
                {

                    outputFile.WriteLine(System.DateTime.Now.ToString() + " : Voter " + vid + " tried to Vote even though previously voted.RESTRICTED");

                }
               
               // ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Already Voted');", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup1", "showmodalpopup1();", true);
            }
            else
            {
                dr1c.Close();
                Response.Redirect("~/Voting.aspx");
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('WELCOME. WE ARE PROUD OF YOU FOR FULFILLING YOUR RESPONSIBILITY OF VOTING');", true);


            }
        }
        finally
        {
            con4.Close();
        }

       
    }
    protected void CandidateDetails_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/CandidateDetails.aspx");
    }

    protected void Help_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("~/Help.aspx");

    }
    protected void ElectionDetails_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Election_Detail.aspx");
    }
    protected void Share_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Socialshare.aspx");
    }
    protected void ModifyDetails_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void VoterLogOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}