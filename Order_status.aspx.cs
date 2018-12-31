using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

public partial class Order_status : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnCheck.Click += BtnCheck_Click;
        string sGUID = utils.ToS(Request.QueryString["g"]);
        //string sPayPalID = utils.ToS(Session["PayPalID"]); // this should be set on paypal_ipn if payment is successful
        //int iProductID = utils.ToN(Session["ProductID"]); // this should be set on paypal_ipn if payment is successful
    }

    private void BtnCheck_Click(object sender, EventArgs e)
    {
        string sGUID = utils.ToS(Request.QueryString["g"]);


        SqlParameter[] oParams = {
                    new SqlParameter("@GUID", sGUID),
                    new SqlParameter("@OrderEmail", txtPPEmail.Text),
                    };
        DataSet ds = utils.ReturnDataset(oParams, "sp_Get_VerifyOrder");

        if (ds.Tables[0].Rows.Count > 0)
        {
            pnlVerify.Visible = false;
            pnlSuccess.Visible = true;
            pnlFail.Visible = false;

            SqlParameter[] oParams2 = {
                    new SqlParameter("@GUID", sGUID)
                    };
            DataSet ds2 = utils.ReturnDataset(oParams2, "sp_Get_ProductDetails");

            if (ds2.Tables[0].Rows.Count > 0)
            {
                if (utils.ToN(ds2.Tables[0].Rows[0]["isDownload"]) == 1)
                {
                    hlDownload.Visible = true;
                    hlDownload.NavigateUrl = utils.ToS(ds2.Tables[0].Rows[0]["DownloadLink"]);
                    lblInfo.Text = "You can grab your file for " + utils.ToS(ds2.Tables[0].Rows[0]["ProductTitle"]) + " now by clicking on the button below";
                }
                else
                {
                    lblInfo.Text = "Payment details for your purchase of " + utils.ToS(ds2.Tables[0].Rows[0]["ProductTitle"]) + " have been sent to the seller.<br /><br />Thanks for purchasing on Social Shop we hope to see you again soon";
                    hlDownload.Visible = false;
                }
            }
        }
        else
        {
            pnlVerify.Visible = true;
            pnlSuccess.Visible = false;
            pnlFail.Visible = true;
        }
    }
}