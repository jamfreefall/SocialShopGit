using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

using System.Drawing;
using System.IO;

public partial class selling : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //**** I want to use this for cropping the images -
        // http://fengyuanchen.github.io/cropper/v0.7.9/
        // The Base64 code on this page is to convert the output as a jpg file

        if (utils.ToN(Session["ClientID"]) == 0)
            Response.Redirect("login.aspx");

        lbtnSave.Click += LbtnSave_Click;
        rbDigital.CheckedChanged += RbDigital_CheckedChanged;
        rbNonDigital.CheckedChanged += RbNonDigital_CheckedChanged;

        if (!IsPostBack)
        {
            if(utils.ToS(Session["PayPalEmail"]) == "")
            {
                pnlPayPalMsg.Visible = true;
            }
            else
            {
                pnlPayPalMsg.Visible = false;
            }

            DataSet ds = utils.ReturnDataset("sp_Select_ShippingOptions");

            rptShippingOptions.DataSource = ds;
            rptShippingOptions.DataBind();

            ds.Dispose();
        }

        LoadProductsList();
    }

    private void RbNonDigital_CheckedChanged(object sender, EventArgs e)
    {
        if (rbNonDigital.Checked)
        {
            pnlShipping.Visible = true;
            txtDownloadLink.Visible = false;
        }
    }

    private void RbDigital_CheckedChanged(object sender, EventArgs e)
    {
        if (rbDigital.Checked)
        {
            pnlShipping.Visible = false;
            txtDownloadLink.Visible = true;
        }
    }

    void LoadProductsList()
    {
        SqlParameter[] oParams = {
                        new SqlParameter("@UserID", utils.ToN(Session["ClientID"])),

                        };
        DataSet ds = utils.ReturnDataset(oParams, "sp_Get_UserProducts");

       // gvProducts.DataSource = ds;
       // gvProducts.DataBind();

        ds.Dispose();
    }

    private void LbtnSave_Click(object sender, EventArgs e)
    {
        //** Save the image and resize it
        //string BaseUploadPath = Server.MapPath("~") + "Uploads\\";
        //string sImageName = utils.ToN(Session["ClientID"]).ToString();// + fupImage.FileName;

        // fupImage.SaveAs(BaseUploadPath + sImageName);

        string sDescription = txtDescription.Text.Replace(System.Environment.NewLine, "<br />");

        //** Save all to the database
        if (CanSave())
        {
            pnlError.Visible = false;
            SqlParameter[] oParams = {
                        new SqlParameter("@PTitle", utils.ToS(txtProductName.Text)),
                        new SqlParameter("@Price", utils.ToD(txtPrice.Text)),
                        new SqlParameter("@Qty", utils.ToN(0)),
                        new SqlParameter("@Shipping", utils.ToD(0)),
                        new SqlParameter("@Desc", sDescription),
                        new SqlParameter("@Image", utils.ToS("")),
                        new SqlParameter("@UserID", utils.ToN(Session["ClientID"])),
                        new SqlParameter("@isDownload", utils.ToN(rbDigital.Checked)),
                        new SqlParameter("@DownloadLink", utils.ToS(txtDownloadLink.Text)),
                        };
            DataSet ds = utils.ReturnDataset(oParams, "sp_Insert_Product");

            int CampaignID = utils.ToN(ds.Tables[0].Rows[0]["CampaignID"]);

            Session["CampaignID"] = CampaignID;

            string myGUID = utils.ToS(ds.Tables[1].Rows[0]["myGUID"]);

            int ProductID = utils.ToN(ds.Tables[2].Rows[0]["NewProductID"]);

            Session["ProductID"] = ProductID;

            string b64 = dataURLInto.InnerText;
            string fb64 = fbBase64.InnerText;
            string twitter64 = TwitterBase64.InnerText;

            if (b64.Length > 0)
            {
                SaveImage(CampaignID, "normal", b64);
            }


            if (fb64.Length > 0)
            {
                SaveImage(CampaignID, "fb", fb64);
            }

            if (twitter64.Length > 0)
            {
                SaveImage(CampaignID, "twitter", twitter64);
            }
            //*** Resize the image for Facebook and Twitter
            // Facebook ideal is 1200 x 630, min is 600 x 315
            // Twitter min is 120 x 120 and max 1mb size. It will make it square

            //System.Drawing.Image igBase = System.Drawing.Image.FromFile(BaseUploadPath + sImageName);
            ////*** Save a Facebook image
            //System.Drawing.Image fbImage = utils.FixedSize(igBase, 600, 315);
            //utils.SaveJpeg(BaseUploadPath + "fb-" + CampaignID.ToString() + ".jpg", fbImage, 65);

            ////** Save a Twitter image
            //System.Drawing.Image TwitterImage = utils.FixedSize(igBase, 240, 240);
            //utils.SaveJpeg(BaseUploadPath + "tw-" + CampaignID.ToString() + ".jpg", TwitterImage, 65);

            //*** Save Options if they are present



            //*** Save Shipping Options
            foreach (RepeaterItem item in rptShippingOptions.Items)
            {
                if (item.ItemType == ListItemType.Item | item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chk = (CheckBox)item.FindControl("chkOption");
                    Literal ltID = (Literal)item.FindControl("litOptionID");
                    TextBox txtCost = (TextBox)item.FindControl("txtShipping");
                    TextBox txtAddCost = (TextBox)item.FindControl("txtAdditionalShip");

                    SqlParameter[] oP = {
                        new SqlParameter("@CampaignID", CampaignID),
                        new SqlParameter("@OptionID", utils.ToN(ltID.Text)),
                        new SqlParameter("@Cost", utils.ToD(txtCost.Text)),
                        new SqlParameter("@isOffered", utils.ToN(chk.Checked)),
                        new SqlParameter("@AdditionalItemCost", utils.ToD(txtAddCost.Text)),
                        };
                    utils.ReturnNoDataset(oP, "sp_Insert_ProductShippingOptions");
                }
            }


            Response.Redirect("selling-options.aspx?g=" + myGUID); // means the code below doesn't get reached so I need it on the next page

            string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";

            lblSocialLink.Text = baseUrl + "product.aspx?gid=" + myGUID;

            hlTweetLink.NavigateUrl = "https://twitter.com/home?status=Checkout my product: " + Server.UrlEncode(txtProductName.Text) + " " + baseUrl + "product.aspx?gid=" + myGUID;

            pnlSocialLink.Visible = true;
            //pnlProduct.Visible = false;

            LoadProductsList();
        }
        else
        {
            pnlError.Visible = true;
        }
    }

    Boolean CanSave()
    {
        bool bSave = true;

        if (txtProductName.Text.Length == 0)
        {
            bSave = false;
            txtProductName.BorderColor = Color.Red;
        }
        else
        {
            txtProductName.BorderColor = Color.Empty;
        }

        if (txtPrice.Text.Length == 0)
        {
            bSave = false;
            txtPrice.BorderColor = Color.Red;
        }
        else
        {
            txtPrice.BorderColor = Color.Empty;
        }

        if (dataURLInto.InnerText.Length == 0)
        {
            bSave = false;
            //ScrollHere.Style.Add("border", "2px solid red");
        }
        else
        {
            // ScrollHere.Style.Remove("border");
        }

        if (rbDigital.Checked)
        {
            if (txtDownloadLink.Text.Length == 0)
            {
                bSave = false;
                txtDownloadLink.BorderColor = Color.Red;
            }
            else
            {
                txtDownloadLink.BorderColor = Color.Empty;
            }
        }
        else //need to have at least 1 shipping option selected
        {
            bool chkChecked = false;
            foreach(RepeaterItem item in rptShippingOptions.Items)
            {
                if(item.ItemType== ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chk = (CheckBox)item.FindControl("chkOption");

                    if (chk.Checked)
                        chkChecked = true;
                }
            }

            if(!chkChecked)
            {
                bSave = false;

                divShipOptions.Style.Add("border", "solid 2px red");

                foreach (RepeaterItem item in rptShippingOptions.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        CheckBox chk = (CheckBox)item.FindControl("chkOption");

                        chk.BorderColor = Color.Red;
                    }
                }

            }
            else
            {
                pnlShipping.BorderColor = Color.Empty;
            }
        }

        return bSave;
    }
    void ConvertBase64ToImage(string input, string SavePath)
    {
        if (input.Length > 0)
        {
            Byte[] bitmapData = new Byte[input.Length];
            bitmapData = Convert.FromBase64String(FixBase64ForImage(input));

            System.IO.MemoryStream streamBitmap = new System.IO.MemoryStream(bitmapData);

            Bitmap bitImage = new Bitmap((Bitmap)System.Drawing.Image.FromStream(streamBitmap));

            //*** save it as a jpg
            bitImage.Save(SavePath, System.Drawing.Imaging.ImageFormat.Jpeg);
        }
    }

    string FixBase64ForImage(string Image)
    {
        System.Text.StringBuilder sbText = new System.Text.StringBuilder(Image, Image.Length);

        sbText.Replace("\r\n", String.Empty);

        sbText.Replace(" ", String.Empty);

        return sbText.ToString();
    }


    public class Base64ToImage
    {
        public void ConvertThis(string ImageText)
        {
            if (ImageText.Length > 0)
            {
                Byte[] bitmapData = new Byte[ImageText.Length];
                bitmapData = Convert.FromBase64String(FixBase64ForImage(ImageText));

                System.IO.MemoryStream streamBitmap = new System.IO.MemoryStream(bitmapData);

                Bitmap bitImage = new Bitmap((Bitmap)System.Drawing.Image.FromStream(streamBitmap));

            }
        }
        public string FixBase64ForImage(string Image)
        {
            System.Text.StringBuilder sbText = new System.Text.StringBuilder(Image, Image.Length);

            sbText.Replace("\r\n", String.Empty);

            sbText.Replace(" ", String.Empty);

            return sbText.ToString();
        }

    }//class

    protected String ViewLink(string sGUID)
    {
        string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";

        return baseUrl + "product.aspx?gid=" + sGUID;
    }
    void SaveImage(int CampaignID, string ImageFor, string b64)
    {
        string BaseUploadPath = Server.MapPath("~") + "Uploads\\";
        //string b64 = dataURLInto.InnerText;

        b64 = FixBase64ForImage(b64);

        string convert = b64.Replace("data:image/jpeg;base64,", String.Empty);
        convert = convert.Replace("data:image/png;base64,", String.Empty);

        string filePath = "";
        if (ImageFor == "fb")
        {
            filePath = BaseUploadPath + "FB-" + CampaignID.ToString() + ".jpg";
        }

        if (ImageFor == "twitter")
        {
            filePath = BaseUploadPath + "TW-" + CampaignID.ToString() + ".jpg";
        }

        if (ImageFor == "normal")
        {
            filePath = BaseUploadPath + CampaignID.ToString() + ".jpg";
        }


        File.WriteAllBytes(filePath, Convert.FromBase64String(convert));
    }
}