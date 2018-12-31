using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

using System.Net;
using System.IO;
using System.Text;

public partial class product : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //*** would eventually like this page to look something like
        //*** http://the8guild.com/themes/html/limo/v1.5/shop-single-item-v1.html
        //*** or http://www.shoppestores.com/demos/digi-shoppe/product-full.html
        //*** or http://www.grehon.com/mimity/v2.3/detail.html
        //*** or http://themes.iamabdus.com/bigbag/1.1/single-product.html (I quite like this)

        // e3029b57-225d-4af3-8b4f-7671f9c4b06b
        // btnPayPal.Click += BtnPayPal_Click;
        lbtnPayPal.Click += LbtnPayPal_Click;
        ddlOptions.SelectedIndexChanged += DdlOptions_SelectedIndexChanged;
        ddlQty.SelectedIndexChanged += DdlQty_SelectedIndexChanged;
        rblShipping.SelectedIndexChanged += RblShipping_SelectedIndexChanged;
        
        lbtnSignUp.Click += LbtnSignUp_Click;

        if (!IsPostBack)
        {
            string sGUID = utils.ToS(Request.QueryString["gid"]);
            //string BaseUploadPath = Server.MapPath("~") + "Uploads\\";

            string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";

            string BaseUploadPath = "Uploads/";

            SqlParameter[] oParams = {
                        new SqlParameter("@GUID", utils.ToS(sGUID))

                        };
            DataSet ds = utils.ReturnDataset(oParams, "sp_Get_ProductDetails");


            if (ds.Tables[0].Rows.Count > 0)
            {
                string sPayPalEmail = utils.ToS(ds.Tables[0].Rows[0]["PayPalEmail"]);

                if(sPayPalEmail.Length==0)
                {
                    lbtnPayPal.Visible = false;
                    lblSoldOut.Text = "<h3>Sorry this product is not available for purchase</h3>";
                    lblSoldOut.Visible = true;
                }
                DateTime UTCNow = DateTime.UtcNow;
                DateTime dtStart = Convert.ToDateTime(ds.Tables[0].Rows[0]["StartDate"]);
                DateTime dtEnd = Convert.ToDateTime(ds.Tables[0].Rows[0]["EndDate"]);

                if(UTCNow < dtStart || UTCNow > dtEnd)
                {
                    lbtnPayPal.Visible = false;
                    lblSoldOut.Text = "<h3>Sorry this product is not available for purchase</h3>";
                    lblSoldOut.Visible = true;
                }

                int CampaignID = utils.ToN(ds.Tables[0].Rows[0]["CampaignID"]);
                litCampaignID.Text = utils.ToS(ds.Tables[0].Rows[0]["CampaignID"]);
                litPageTitle.Text = utils.ToS(ds.Tables[0].Rows[0]["ProductTitle"]);
                lblProductTitle.Text = utils.ToS(ds.Tables[0].Rows[0]["ProductTitle"]);
                ogTitle.Text = utils.ToS(ds.Tables[0].Rows[0]["ProductTitle"]) + " - Buy Now!";

                double dPrice = utils.ToD(ds.Tables[0].Rows[0]["Price"]);
                double dShipping = utils.ToD(ds.Tables[0].Rows[0]["Shipping"]);
                double dTax = utils.ToD(ds.Tables[0].Rows[0]["Tax"]);

                lblPrice.Text = dPrice.ToString("C", System.Globalization.CultureInfo.CurrentCulture);
                litBasePrice.Text = dPrice.ToString();

                double dTotal = utils.ToD(litBasePrice.Text);
                lblTotal.Text = dTotal.ToString("C", System.Globalization.CultureInfo.CurrentCulture);
                // ogPrice.Text = dPrice.ToString("F2");
                //item_name.Value = utils.ToS(ds.Tables[0].Rows[0]["ProductTitle"]);



                if (utils.ToN(ds.Tables[0].Rows[0]["isDownload"]) == 1)
                {
                    rblShipping.Visible = false;
                    pnlShipping.Visible = false;
                }

                ogURL.Text = baseUrl + "product.aspx?gid=" + sGUID;

                ogImage.Text = baseUrl + BaseUploadPath + "FB-" + utils.ToS(ds.Tables[0].Rows[0]["CampaignID"]) + ".jpg";
                ogDescription.Text = utils.ToS(ds.Tables[0].Rows[0]["Description"]);

                tcTitle.Text = utils.ToS(ds.Tables[0].Rows[0]["ProductTitle"]);
                tcDescription.Text = utils.ToS(ds.Tables[0].Rows[0]["Description"]);
                tcImage.Text = baseUrl + BaseUploadPath + "TW-" + utils.ToS(ds.Tables[0].Rows[0]["CampaignID"]) + ".jpg";
                tcAccount.Text = "@jamfreefall";

                lblDescription.Text = utils.ToS(ds.Tables[0].Rows[0]["Description"]);

                //*** images


                imgProduct.ImageUrl = baseUrl + BaseUploadPath + utils.ToS(ds.Tables[0].Rows[0]["CampaignID"]) + ".jpg";
                imgThumb.ImageUrl = baseUrl + BaseUploadPath + utils.ToS(ds.Tables[0].Rows[0]["CampaignID"]) + ".jpg";

                imgSingle.ImageUrl = baseUrl + BaseUploadPath + utils.ToS(ds.Tables[0].Rows[0]["CampaignID"]) + ".jpg";

                if(utils.ToN(ds.Tables[0].Rows[0]["NumOfPhotos"])>0)
                {
                    pnlGallery.Visible = true;
                    pnlSingleImage.Visible = false;

                    //*** load images into gallery
                    string sSQL = "select * from tCampaignPhotos where campaignID = " + CampaignID + " Order by OrdNum asc";
                    DataSet dsImg = utils.RunSQLStringQueryRet(sSQL);

                    rptMainImages.DataSource = dsImg;
                    rptThumbs.DataSource = dsImg;

                    rptMainImages.DataBind();
                    rptThumbs.DataBind();

                    dsImg.Dispose();
                }
                else
                {
                    pnlGallery.Visible = false;
                    pnlSingleImage.Visible = true;
                }

                //lblShipping.Text = dShipping.ToString("F2");
                lblTax.Text = dTax.ToString("F2");

                litfbShareURL1.Text = baseUrl + "product.aspx?gid=" + sGUID;
                litfbShareURL2.Text = Server.UrlEncode(baseUrl + "product.aspx?gid=" + sGUID);


                int iQty = utils.ToN(ds.Tables[0].Rows[0]["Quantity"]);

                if(iQty == 0)
                {
                    lblSoldOut.Visible = true;
                    lbtnPayPal.Visible = false;
                }
                string sSQLOptions = "Select * from tOptions Where Quantity > 0 and CampaignID = " + CampaignID;

                DataSet dsOptions = utils.RunSQLStringQueryRet(sSQLOptions);

                foreach(DataRow row in dsOptions.Tables[0].Rows)
                {
                    ListItem li = new ListItem();
                    li.Text = utils.ToS(row["OptionTitle"]);
                    li.Value = utils.ToS(row["OptionID"]);

                    ddlOptions.Items.Add(li);
                }

                if(dsOptions.Tables[0].Rows.Count>0)
                {
                    ddlOptions.Items.Insert(0, "- select -");
                    ddlQty.Items.Insert(0, "Qty");
                }
                else
                {
                    pnlOptions.Visible = false;
                    ddlOptions.Visible = false;
                    ddlQty.Visible = false;
                }

                //*** Shipping Options
                int ProductID = utils.ToN(ds.Tables[0].Rows[0]["ProductID"]);

                string sShipSQL = "select PSO.*, SO.* from tProductShippingOptions PSO inner join tShippingOption SO on PSO.ShippingOptionID = SO.OptionID Where CampaignID = " + CampaignID + " and isOffered = 1";

                DataSet dsShipOptions = utils.RunSQLStringQueryRet(sShipSQL);

                if (dsShipOptions.Tables[0].Rows.Count == 1)
                {
                    ListItem li = new ListItem();
                    double dCost = utils.ToD(dsShipOptions.Tables[0].Rows[0]["Cost"]);
                    double dAdditional = utils.ToD(dsShipOptions.Tables[0].Rows[0]["AdditionalItemCost"]);
                    if(iQty > 1)
                    {
                        li.Text = "  " + utils.ToS(dsShipOptions.Tables[0].Rows[0]["OptionName"]) + " - " + dCost.ToString("C", System.Globalization.CultureInfo.CurrentCulture) + " (Additional item shipping is " + dAdditional.ToString("C", System.Globalization.CultureInfo.CurrentCulture) + " per item)";
                    }
                    else
                    {
                        li.Text = "  " + utils.ToS(dsShipOptions.Tables[0].Rows[0]["OptionName"]) + " - " + dCost.ToString("C", System.Globalization.CultureInfo.CurrentCulture);
                    }
                    
                    li.Value = utils.ToS(dsShipOptions.Tables[0].Rows[0]["OptionID"]);
                    li.Selected = true;

                    rblShipping.Items.Add(li);

                    hfShippingCost.Value = dCost.ToString();
                    hfShipCostMulti.Value = dAdditional.ToString();

                    dTotal = utils.ToD(litBasePrice.Text) + dCost;
                    lblTotal.Text = dTotal.ToString("C", System.Globalization.CultureInfo.CurrentCulture);
                }
                else
                {
                    foreach (DataRow row in dsShipOptions.Tables[0].Rows)
                    {
                        if (Convert.ToBoolean(row["isOffered"]) == true)
                        {
                            ListItem li = new ListItem();
                            double dCost = utils.ToD(row["Cost"]);
                            double dAdditional = utils.ToD(row["AdditionalItemCost"]);
                            if (dCost==0)
                            {
                                li.Text = "  " + utils.ToS(row["OptionName"]) + " - Free";
                            }
                            else
                            {
                                li.Text = "  " + utils.ToS(row["OptionName"]) + " - " + dCost.ToString("C", System.Globalization.CultureInfo.CurrentCulture) + " (Additional item shipping is " + dAdditional.ToString("C", System.Globalization.CultureInfo.CurrentCulture) + " per item)"; 
                            }
                            
                            li.Value = utils.ToS(row["OptionID"]);

                            rblShipping.Items.Add(li);
                        }
                    }
                }
                rptShipOptionsText.DataSource = dsShipOptions;
                rptShipOptionsText.DataBind();

                dsShipOptions.Dispose();

                RecordView(utils.ToN(ds.Tables[0].Rows[0]["CampaignID"]));
                dsOptions.Dispose();
            }
        }
    }

    private void DdlQty_SelectedIndexChanged(object sender, EventArgs e)
    {

        lblTotal.Text = CalcTotal();
    }

    String CalcTotal()
    {
        int Qty = utils.ToN(ddlQty.SelectedValue);

        if (Qty == 0)
            Qty = 1;

        double dSubTotal = utils.ToD(litBasePrice.Text);
        double dTotal = dSubTotal * Qty;

        //*** Get Shipping Cost if available
        double dShip = utils.ToD(hfShippingCost.Value);
        double dAddit = utils.ToD(hfShipCostMulti.Value);

        if(Qty > 1) //*** Calculation for shipping multiple qty purchases
        {
            int NewQty = Qty - 1;

            double dAdditionalShip = NewQty * dAddit;

            dShip += dAdditionalShip;
        }

        double dGrandTotal = dTotal + dShip;

        return dGrandTotal.ToString("C", System.Globalization.CultureInfo.CurrentCulture);
    }
    private void RblShipping_SelectedIndexChanged(object sender, EventArgs e)
    {
        int iCampaignID = utils.ToN(litCampaignID.Text);
        string sSQL = "Select Cost, AdditionalItemCost from tProductShippingOptions Where ShippingOptionID = " + utils.ToN(rblShipping.SelectedValue) + " and CampaignID = " + iCampaignID;

        DataSet ds = utils.RunSQLStringQueryRet(sSQL);
        double dShip = utils.ToD(ds.Tables[0].Rows[0]["Cost"]);
        double dAdditional = utils.ToD(ds.Tables[0].Rows[0]["AdditionalItemCost"]);

        //double dTotal = utils.ToD(litBasePrice.Text) + dShip;
        //lblTotal.Text = dTotal.ToString("C", System.Globalization.CultureInfo.CurrentCulture);
        ds.Dispose();

        hfShippingCost.Value = dShip.ToString();
        hfShipCostMulti.Value = dAdditional.ToString();

        lblTotal.Text = CalcTotal();
    }

    private void DdlOptions_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sSQL = "Select Quantity from tOptions Where OptionID = " + utils.ToN(ddlOptions.SelectedValue);

        DataSet ds = utils.RunSQLStringQueryRet(sSQL);

        if(utils.ToN(ds.Tables[0].Rows.Count) > 0)
        {
            ddlQty.Items.Clear();
            ddlQty.Items.Insert(0, "Qty");
            for (int i = 1; i<= utils.ToN(ds.Tables[0].Rows[0]["Quantity"]);i++)
            {
                ListItem li = new ListItem(i.ToString());
                ddlQty.Items.Add(li);
            }
        }
    }

    private void LbtnSignUp_Click(object sender, EventArgs e)
    {
        SqlParameter[] oParams = {
                    new SqlParameter("@Email", utils.ToS(txtEmail.Text)),
                        };
        utils.ReturnNoDataset(oParams, "sp_Insert_InviteList");

        pnlSignUp.Visible = false;
        litSignUp.Visible = true;
    }

    private void LbtnPayPal_Click(object sender, EventArgs e)
    {
        if (ValidFields())
        {
            string sGUID = utils.ToS(Request.QueryString["gid"]);
            int iQty = 1;
            if (ddlQty.Items.Count > 0)
            {
                iQty = utils.ToN(ddlQty.SelectedItem.Text);
            }
           
            
            if (ddlOptions.Visible)
            {
                string sRedirect = "paypal.aspx?gid=" + sGUID + "&op=With Option " + ddlOptions.SelectedItem.Text + "&qty=" + iQty + "&oid=" + ddlOptions.SelectedValue + "&sid=" + rblShipping.SelectedValue;
                Response.Redirect(sRedirect);
            }
            else
            {
                Response.Redirect("paypal.aspx?gid=" + sGUID + "&qty=" + iQty + "&oid=" + utils.ToN(ddlOptions.SelectedValue) + "&sid=" + rblShipping.SelectedValue);
            }
        }
        else
        {
            pnlError.Visible = true;
        }
    }

    Boolean ValidFields()
    {
        bool ret = true;
        litErrors.Text = "";
        if(ddlOptions.Visible == true)
        {
            if(utils.ToN(ddlOptions.SelectedValue) == 0)
            {
                ddlOptions.BorderColor = System.Drawing.Color.Red;
                ret = false;
                litErrors.Text = " - You need to select a product option<br />";
            }
            else
            {
                ddlOptions.BorderColor = System.Drawing.Color.Empty;
            }
        }

        if(ddlQty.Visible == true)
        {
            if (utils.ToN(ddlQty.SelectedValue) == 0)
            {
                ddlQty.BorderColor = System.Drawing.Color.Red;
                ret = false;
                litErrors.Text += " - You need to select a Quantity<br />";
            }
            else
            {
                ddlQty.BorderColor = System.Drawing.Color.Empty;
            }
        }

        if (rblShipping.Visible == true)
        {
            if (utils.ToN(rblShipping.SelectedValue) == 0)
            {
                rblShipping.BorderColor = System.Drawing.Color.Red;
                ret = false;
                litErrors.Text += " - You need to select a Shipping method";
            }
            else
            {
                rblShipping.BorderColor = System.Drawing.Color.Empty;
            }
        }

        return ret;
    }
    private void BtnPayPal_Click(object sender, EventArgs e)
    {


        //string sGUID = utils.ToS(Request.QueryString["gid"]);
        //string sSQL = "Select P.* from tProduct P inner join tCampaign C on P.ProductID = C.ProductID where C.myGUID = '" + sGUID + "'";

        //DataSet ds = utils.RunSQLStringQueryRet(sSQL);

        //if (ds.Tables[0].Rows.Count > 0)
        //{

        //    //*** PayPal code to put under button click event

        //    string remoteUrl = "https://www.paypal.com/cgi-bin/webscr";

        //    ASCIIEncoding encoding = new ASCIIEncoding();
        //    string postData = "cmd=_xclick";
        //    postData += "&amount=" + utils.ToS(ds.Tables[0].Rows[0]["Price"]);
        //    postData += "&item_name=" + utils.ToS(ds.Tables[0].Rows[0]["ProductTitle"]);
        //    postData += "&item_number=" + utils.ToS(ds.Tables[0].Rows[0]["ProductID"]);
        //    postData += "&currency_code=AUD";
        //    postData += "&invoice=654321";
        //    postData += "&business=jeffro_hallamyahoo.com.au";

        //    byte[] bytes = encoding.GetBytes(postData);
        //    HttpWebRequest httpRequest = (HttpWebRequest)WebRequest.Create(remoteUrl);
        //    httpRequest.Method = "POST";
        //    httpRequest.ContentType = "application/x-www-form-urlencoded";
        //    httpRequest.ContentLength = bytes.Length;
        //    using (Stream stream = httpRequest.GetRequestStream())
        //    {
        //        stream.Write(bytes, 0, bytes.Length);
        //        stream.Close();
        //    }

            //**----------------------------------------------

            //var request = (HttpWebRequest)WebRequest.Create("https://www.paypal.com/cgi-bin/webscr");

            


            //var data = Encoding.ASCII.GetBytes(postData);

            //request.Method = "POST";
            //request.ContentType = "application/x-www-form-urlencoded";
            //request.ContentLength = data.Length;

            //using (var stream = request.GetRequestStream())
            //{
            //    stream.Write(data, 0, data.Length);
            //}

            //var response = (HttpWebResponse)request.GetResponse();

            //var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
        //}
    }

    void RecordView(int ProductID)
    {
        string IP = GetIPAddress();
        SqlParameter[] oParams = {
                        new SqlParameter("@ProductID", utils.ToN(ProductID)),
                        new SqlParameter("@IP", utils.ToS(IP)),
                        };

        utils.ReturnNoDataset(oParams, "sp_Insert_ProductView");
    }

    protected string GetIPAddress()
    {
        System.Web.HttpContext context = System.Web.HttpContext.Current;
        string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }

        return context.Request.ServerVariables["REMOTE_ADDR"];
    }

    protected string ShippingCost(double Cost)
    {
        string Ret = Cost.ToString("C", System.Globalization.CultureInfo.CurrentCulture);
        if (Cost == 0)
            Ret = "Free";

        return Ret;
    }
}