using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

public partial class orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (utils.ToN(Session["ClientID"]) == 0)
            Response.Redirect("login.aspx");

        rptOrders.ItemCommand += RptOrders_ItemCommand;

        rptOrders.ItemDataBound += RptOrders_ItemDataBound;
        SqlParameter[] oParams = {
                        new SqlParameter("@UserID", utils.ToN(Session["ClientID"])),

                        };
        DataSet ds = utils.ReturnDataset(oParams, "sp_Get_OrdersForUser");

        rptOrders.DataSource = ds;
        rptOrders.DataBind();

        ds.Dispose();

    }

    private void RptOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HiddenField hf = (HiddenField)e.Item.FindControl("hfSent");
            HiddenField hfDL = (HiddenField)e.Item.FindControl("hfDownload");
            LinkButton lbtnSent = (LinkButton)e.Item.FindControl("lbtnSent");

            if (Convert.ToBoolean(hf.Value) == true)
            {
                lbtnSent.CssClass = "btn btn-sm btn-default disabled";
            }
            if (Convert.ToBoolean(hfDL.Value) == true)
            {
                lbtnSent.Visible = false;
            }
        }
    }

    private void RptOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if(e.CommandName == "Sent")
        {
            HiddenField hf = (HiddenField)e.Item.FindControl("hfID");
            int OrderID = utils.ToN(hf.Value);

            string sSQL = "Update tOrders set issent = 1 where orderid = " + OrderID;

            utils.RunSQLStringQuery(sSQL);


        }

        if(e.CommandName== "View")
        {
            int OrderID = utils.ToN(e.CommandArgument);
            SqlParameter[] oParams = {
                        new SqlParameter("@UserID", utils.ToN(Session["ClientID"])),
                        new SqlParameter("@OrderID", OrderID),
                        };
            DataSet ds = utils.ReturnDataset(oParams, "sp_Get_OrdersForUser");

            rptOrderDetails.DataSource = ds;
            rptOrderDetails.DataBind();

            ds.Dispose();

            pnlDetails.Visible = true;
        }
    }

    protected string SentIcon(bool input)
    {
        string ret = "";
        if(input)
        {
            
            ret = "<i class='fa fa-truck' aria-hidden='true'></i>";
        }
        else
        {
            ret = "<span class='fa-stack'><i class='fa fa-truck fa-stack-1x'></i><i class='fa fa-ban fa-stack-2x text-danger'></i></span>";
        }

        return ret;
    }
}