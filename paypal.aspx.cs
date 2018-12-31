using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

public partial class paypal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sGUID = utils.ToS(Request.QueryString["gid"]);
        string sOPtions = utils.ToS(Request.QueryString["op"]);
        int iQty = utils.ToN(Request.QueryString["qty"]);
        int OptionID = utils.ToN(Request.QueryString["oid"]);
        int ShipID = utils.ToN(Request.QueryString["sid"]);
        //string BaseUploadPath = Server.MapPath("~") + "Uploads\\";

        if (iQty == 0)
            iQty = 1;

        string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";

        
            SqlParameter[] oParams = {
            new SqlParameter("@CampaignGUID", utils.ToS(sGUID)),

                        };
        DataSet ds = utils.ReturnDataset(oParams, "sp_Get_DetailsForPayPal");


        if (ds.Tables[0].Rows.Count > 0)
        {
            int CampaignID = utils.ToN(ds.Tables[0].Rows[0]["CampaignID"]);
            int ProductID = utils.ToN(ds.Tables[0].Rows[0]["ProductID"]);


            double dShip = 0;

            if (ShipID > 0)
            {
                string sSQLShip = "Select * from tProductShippingOptions Where CampaignID = " + CampaignID + " and ShippingOptionID = " + ShipID;
                DataSet dsShip = utils.RunSQLStringQueryRet(sSQLShip);

                dShip = utils.ToD(dsShip.Tables[0].Rows[0]["Cost"]);
                double dAddit = utils.ToD(dsShip.Tables[0].Rows[0]["AdditionalItemCost"]);

                if (iQty > 1) //*** Calculation for shipping multiple qty purchases
                {
                    int NewQty = iQty - 1;

                    double dAdditionalShip = NewQty * dAddit;

                    dShip += dAdditionalShip;
                }
                //dCost = utils.ToD(dsShip.Tables[0].Rows[0]["Cost"]);
                dsShip.Dispose();

                
            }
            item_name.Value = utils.ToS(ds.Tables[0].Rows[0]["ProductTitle"]) + " " + sOPtions;


            double dPrice = utils.ToD(ds.Tables[0].Rows[0]["Price"]);

            amount.Value= dPrice.ToString("F2");

            currency_code.Value = "AUD";
            business.Value = utils.ToS(ds.Tables[0].Rows[0]["PayPalEmail"]);
            item_number.Value = ProductID.ToString();
            tax.Value = utils.ToS(ds.Tables[0].Rows[0]["Tax"]);
            shipping.Value = dShip.ToString();
            quantity.Value = iQty.ToString();
            custom.Value = OptionID.ToString();

            @return.Value = baseUrl + "paypal_return.aspx?g=" + sGUID;
            cancel_return.Value = baseUrl + "product.aspx?gid=" + sGUID;

            notify_url.Value = baseUrl + "paypal_ipn.aspx?g=" + sGUID + "&oid=" + OptionID + "&sid=" + ShipID;

            on0.Value = "ShipID";
            os0.Value = ShipID.ToString();

            if (utils.ToN(ds.Tables[0].Rows[0]["isDownload"]) == 0)
            {
                no_shipping.Value = "2";
            }
            else
            {
                no_shipping.Value = "1";
            }

        }
    }
}