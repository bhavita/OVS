using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_AddConstituency : System.Web.UI.Page
{
    SqlDataAdapter dadapter; DataSet dset; PagedDataSource adsource; int ID;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos; SqlDataReader dr1;
    protected void Page_Load(object sender, EventArgs e)
    {
      

        PanelAddNewCons.Visible = true;
        if (!Page.IsPostBack)
        {

            h_cedit.Value = "INSERT";
            this.ViewState["vs"] = 0;
        }
        pos = (int)this.ViewState["vs"];
        databind();
    }


    public void databind()
    {
        dadapter = new SqlDataAdapter("select cons_id,cons_name from ovs_constituency", connstring);
        dset = new DataSet();
        adsource = new PagedDataSource();
        dadapter.Fill(dset);
        adsource.DataSource = dset.Tables[0].DefaultView;
        adsource.PageSize = 8;
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
        string cons_name = (e.CommandArgument).ToString();
       // Response.Write("delet click" +cons_name);
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        comd = new SqlCommand("select * from ovs_candidate where cons_id=(select cons_id from ovs_constituency where cons_name=@cons_name)", con1);
        //comd = new SqlCommand("select * from ovs_candidate where cons_id=(select cons_id from ovs_constituency where cons_name=@cons_name)", con1);
        comd.Parameters.Add("@cons_name", cons_name);
        rdr = comd.ExecuteReader();
        if (rdr.HasRows)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('consid is already in used.');", true);
        }
        else {
            rdr.Close();
            SqlCommand cmd1 = new SqlCommand("Delete from ovs_constituency where cons_name=@cons_name", con1);
            cmd1.Parameters.Add("@cons_name", cons_name);
            int del = cmd1.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('consituency deleted sucssesfully.');", true);
            
           // Response.Write("del is " + del + " ");
            databind();
        }

       

    }


    protected void Edit_Command(object source, DataListCommandEventArgs e)
    {
        h_cedit.Value = "EDIT";

        ID = Convert.ToInt32(e.CommandArgument);

        PanelAddNewCons.Visible = true;
        string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con2 = new SqlConnection(cs2);
        SqlCommand comd;
        con2.Open();
        SqlDataReader rdp;
        String cname = "random";

        if ((con2.State & ConnectionState.Open) > 0)
        {

            comd = new SqlCommand("SELECT cons_name from ovs_constituency where cons_id =(@cons_id)", con2);
            comd.Parameters.Add("@cons_id", ID.ToString());
            rdp = comd.ExecuteReader();

            if (rdp != null)
            {
                if (rdp.Read())
                {
                    cname = rdp.GetString(0);
                }

            }
            TConsName.Text = cname;
            ConsSubmit.Text = "Edit Constituency Name";
            h_cid.Value = ID.ToString();

        }
    }
    SqlCommand insert_cons, comd, edit_cons;
    SqlDataReader rdr;
   
    protected void Button1_Click(object sender, EventArgs e)
    {
 
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();

        if (h_cedit.Value != "EDIT")
        {

            insert_cons = new SqlCommand("INSERT INTO ovs_constituency (cons_name) VALUES(@cons_name)", con1);
            insert_cons.Parameters.Add("@cons_name",TConsName.Text);
            if ((con1.State & ConnectionState.Open) > 0)
            {

                comd = new SqlCommand("SELECT cons_name FROM ovs_constituency WHERE cons_name=(@cons_name)", con1);
                comd.Parameters.Add("@cons_name", TConsName.Text);
                rdr = comd.ExecuteReader();
                if (rdr.HasRows)
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Constituency is already added.');", true);
                }

                else
                {
                    rdr.Close();
                    int i = insert_cons.ExecuteNonQuery();
                   
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Constituency is  added.');", true);
                    TConsName.Text = "";
                    databind();
                    h_cedit.Value = "INSERT";
                    con1.Close();
                }

            }

        }
        else
        {
            edit_cons = new SqlCommand("UPDATE ovs_constituency SET cons_name= @cons_name where cons_id=@cons_id", con1);
            edit_cons.Parameters.Add("@cons_name", TConsName.Text);
            edit_cons.Parameters.Add("@cons_id", h_cid.Value);
            if ((con1.State & ConnectionState.Open) > 0)
            {
                int i = edit_cons.ExecuteNonQuery();
                h_cedit.Value = "EDIT";
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Constituency is updated.');", true);
                con1.Close();
            }
            databind();
            TConsName.Text = " ";
            ConsSubmit.Text = "Add Constituency";
            h_cedit.Value = "INSERT";


        }


    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}