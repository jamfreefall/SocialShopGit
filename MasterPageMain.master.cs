using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

using ASPSnippets.FaceBookAPI;

public partial class MasterPageMain : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // lbtnLogout.Click += LbtnLogout_Click;
            if (utils.ToN(Session["ClientID"]) > 0)
            {
                SqlParameter[] oParams = {
                        new SqlParameter("@UserID", utils.ToN(Session["ClientID"])),

                        };
                DataSet ds = utils.ReturnDataset(oParams, "sp_Get_UserDetails");

                string sPPEmail = utils.ToS(ds.Tables[0].Rows[0]["PayPalEmail"]);

                Session["PayPal"] = sPPEmail;

                if (sPPEmail.Length == 0)
                {
                    pnlPayPalMsg.Visible = true;
                }
                else
                {
                    pnlPayPalMsg.Visible = false;
                }

                lblName1.Text = utils.ToS(ds.Tables[0].Rows[0]["Firstname"]) + " " + utils.ToS(ds.Tables[0].Rows[0]["Lastname"]);
                lblName2.Text = utils.ToS(ds.Tables[0].Rows[0]["Firstname"]) + " " + utils.ToS(ds.Tables[0].Rows[0]["Lastname"]);
                lblName3.Text = utils.ToS(ds.Tables[0].Rows[0]["Firstname"]) + " " + utils.ToS(ds.Tables[0].Rows[0]["Lastname"]);

                ds.Dispose();

                SqlParameter[] oP = {
                        new SqlParameter("@UserID", utils.ToN(Session["ClientID"])),

                        };
                DataSet dsOrders = utils.ReturnDataset(oP, "sp_Get_ProfileDetails");

                lblOrders.Text = utils.ToS(dsOrders.Tables[1].Rows[0]["myCount"]);

                dsOrders.Dispose();
            }
        }
    }

    private void LbtnLogout_Click(object sender, EventArgs e)
    {
        FaceBookConnect.Logout(Request.QueryString["code"]);
    }
}
