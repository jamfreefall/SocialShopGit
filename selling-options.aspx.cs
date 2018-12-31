using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

using System.IO;
using System.Text;

public partial class selling_options : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (utils.ToN(Session["ClientID"]) == 0)
            Response.Redirect("login.aspx");
        

        lbtnSave.Click += LbtnSave_Click;
    }

    private void LbtnSave_Click(object sender, EventArgs e)
    {
        int TotQty = utils.ToN(ddlQty.SelectedItem.Text);
        int CampaignID = utils.ToN(Session["CampaignID"]);
        int ProductID = utils.ToN(Session["ProductID"]);

        Session["OrdNum"] = 1;

        if (txtOption1.Text.Length > 0)
        {
            SqlParameter[] oPOptions = {
                        new SqlParameter("@CampaignID", CampaignID),
                        new SqlParameter("@OptionTitle", utils.ToS(txtOption1.Text)),
                        new SqlParameter("@Quantity", utils.ToN(ddlOpt1Qty.SelectedItem.Text)),

                        };
            utils.ReturnNoDataset(oPOptions, "sp_Insert_ProductOptions");

            TotQty += utils.ToN(ddlOpt1Qty.SelectedItem.Text);
        }

        if (txtOption2.Text.Length > 0)
        {
            SqlParameter[] oPOptions = {
                        new SqlParameter("@CampaignID", CampaignID),
                        new SqlParameter("@OptionTitle", utils.ToS(txtOption2.Text)),
                        new SqlParameter("@Quantity", utils.ToN(ddlOpt2Qty.SelectedItem.Text)),

                        };
            utils.ReturnNoDataset(oPOptions, "sp_Insert_ProductOptions");

            TotQty += utils.ToN(ddlOpt2Qty.SelectedItem.Text);
        }

        if (txtOption3.Text.Length > 0)
        {
            SqlParameter[] oPOptions = {
                        new SqlParameter("@CampaignID", CampaignID),
                        new SqlParameter("@OptionTitle", utils.ToS(txtOption3.Text)),
                        new SqlParameter("@Quantity", utils.ToN(ddlOpt3Qty.SelectedItem.Text)),

                        };
            utils.ReturnNoDataset(oPOptions, "sp_Insert_ProductOptions");

            TotQty += utils.ToN(ddlOpt3Qty.SelectedItem.Text);
        }

        if (txtOption4.Text.Length > 0)
        {
            SqlParameter[] oPOptions = {
                        new SqlParameter("@CampaignID", CampaignID),
                        new SqlParameter("@OptionTitle", utils.ToS(txtOption4.Text)),
                        new SqlParameter("@Quantity", utils.ToN(ddlOpt4Qty.SelectedItem.Text)),

                        };
            utils.ReturnNoDataset(oPOptions, "sp_Insert_ProductOptions");

            TotQty += utils.ToN(ddlOpt4Qty.SelectedItem.Text);
        }

        if (txtOption5.Text.Length > 0)
        {
            SqlParameter[] oPOptions = {
                        new SqlParameter("@CampaignID", CampaignID),
                        new SqlParameter("@OptionTitle", utils.ToS(txtOption5.Text)),
                        new SqlParameter("@Quantity", utils.ToN(ddlOpt5Qty.SelectedItem.Text)),

                        };
            utils.ReturnNoDataset(oPOptions, "sp_Insert_ProductOptions");

            TotQty += utils.ToN(ddlOpt5Qty.SelectedItem.Text);
        }

        if (TotQty > 0)
        {
            string sUp = "Update tProduct Set Quantity = " + TotQty + " where ProductID = " + ProductID;
            utils.RunSQLStringQuery(sUp);
        }

        //*** Save Images
        //if(fup1.HasFile)
        //    SaveImage(fup1.PostedFile);

        //if (fup2.HasFile)
        //    SaveImage(fup2.PostedFile);

        //if (fup3.HasFile)
        //    SaveImage(fup3.PostedFile);

        //if (fup4.HasFile)
        //    SaveImage(fup4.PostedFile);

        //if (fup5.HasFile)
        //    SaveImage(fup5.PostedFile);

        //if (fup6.HasFile)
        //    SaveImage(fup6.PostedFile);

        //if (fup7.HasFile)
        //    SaveImage(fup7.PostedFile);

        //*** end save images
        

        pnlImages.Visible = true;
        pnlLinks.Visible = false;
        pnlMain.Visible = false;
        string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";
        string sGUID = utils.ToS(Request.QueryString["g"]);
        lblSocialLink.Text = baseUrl + "product.aspx?gid=" + sGUID;
        hlProduct.NavigateUrl = baseUrl + "product.aspx?gid=" + sGUID;

        hlTweetLink.NavigateUrl = "https://twitter.com/home?status=Checkout my cool product on Social Shop " + " " + baseUrl + "product.aspx?gid=" + sGUID;

        Response.Redirect("selling-images.aspx?g=" + sGUID);
    }

    void SaveImage(HttpPostedFile file)
    {
        string sCampaignID = utils.ToS(Session["CampaignID"]);


        string dirFullPath = HttpContext.Current.Server.MapPath("~/uploads/gallery/");
        //string[] files;
        //int numFiles;
        //files = System.IO.Directory.GetFiles(dirFullPath);
        //numFiles = files.Length;
        //numFiles = numFiles + 1;

        string str_image = "";
        int OrdNum = utils.ToN(Session["OrdNum"]);


        // HttpPostedFile file = context.Request.Files[s];
        //  int fileSizeInBytes = file.ContentLength;
        Stream thisImag = file.InputStream;
        string fileName = file.FileName;
        string fileExtension = file.ContentType;

        if (!string.IsNullOrEmpty(fileName))
        {

            fileExtension = Path.GetExtension(fileName);
            str_image = sCampaignID + "_" + fileName;
            string pathToSave_100 = HttpContext.Current.Server.MapPath("~/uploads/gallery/") + str_image;

            if (fileExtension.ToLower() == ".jpg")
            {
                System.Drawing.Image imgMain = System.Drawing.Image.FromStream(thisImag);
                imgMain = utils.FixedSize(imgMain, 720, 540);
                utils.SaveJpeg(pathToSave_100, imgMain, 60);
            }

            if (fileExtension.ToLower() == ".png")
            {
                System.Drawing.Image imgMain = System.Drawing.Image.FromStream(thisImag);
                imgMain = utils.FixedSize(imgMain, 720, 540);
                utils.SavePNG(pathToSave_100, imgMain, 60);
            }

            //*** save to the db
            SqlParameter[] oParams = {
                        new SqlParameter("@CampaignID", utils.ToN(sCampaignID)),
                        new SqlParameter("@PhotoName", str_image),
                        new SqlParameter("@OrdNum", OrdNum),
                        };
            utils.ReturnNoDataset(oParams, "sp_Insert_ProductImages");

            OrdNum++;
        }
        Session["OrdNum"] = OrdNum;
    }

    void SaveImageFromStream(Stream file, string fileName, string fileExtension)
    {
        string sCampaignID = utils.ToS(Session["CampaignID"]);


        string dirFullPath = HttpContext.Current.Server.MapPath("~/uploads/gallery/");
        //string[] files;
        //int numFiles;
        //files = System.IO.Directory.GetFiles(dirFullPath);
        //numFiles = files.Length;
        //numFiles = numFiles + 1;

        string str_image = "";
        int OrdNum = utils.ToN(Session["OrdNum"]);


        // HttpPostedFile file = context.Request.Files[s];
        //  int fileSizeInBytes = file.ContentLength;
        Stream thisImag = file;
        //string fileName = file.FileName;
       // string fileExtension = file.ContentType;

        if (!string.IsNullOrEmpty(fileName))
        {

            fileExtension = Path.GetExtension(fileName);
            str_image = sCampaignID + "_" + fileName;
            string pathToSave_100 = HttpContext.Current.Server.MapPath("~/uploads/gallery/") + str_image;

            if (fileExtension.ToLower() == ".jpg")
            {
                System.Drawing.Image imgMain = System.Drawing.Image.FromStream(thisImag);
                imgMain = utils.FixedSize(imgMain, 720, 540);
                utils.SaveJpeg(pathToSave_100, imgMain, 60);
            }

            if (fileExtension.ToLower() == ".png")
            {
                System.Drawing.Image imgMain = System.Drawing.Image.FromStream(thisImag);
                imgMain = utils.FixedSize(imgMain, 720, 540);
                utils.SavePNG(pathToSave_100, imgMain, 60);
            }

            //*** save to the db
            SqlParameter[] oParams = {
                        new SqlParameter("@CampaignID", utils.ToN(sCampaignID)),
                        new SqlParameter("@PhotoName", str_image),
                        new SqlParameter("@OrdNum", OrdNum),
                        };
            utils.ReturnNoDataset(oParams, "sp_Insert_ProductImages");

            OrdNum++;
        }
        Session["OrdNum"] = OrdNum;
    }

    protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        SaveImageFromStream(e.GetStreamContents(), e.FileName, e.ContentType);
    }

    [System.Web.Services.WebMethod]

    public String SaveOptions()
    {
        
        string sCampaignID = utils.ToS(HttpContext.Current.Session["CampaignID"]);
        return "saved";
    }
}