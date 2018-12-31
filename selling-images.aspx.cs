using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;

using System.Data.SqlClient;
using System.Data;

public partial class selling_images : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";
        string sGUID = utils.ToS(Request.QueryString["g"]);
        lblSocialLink.Text = baseUrl + "product.aspx?gid=" + sGUID;
        hlProduct.NavigateUrl = baseUrl + "product.aspx?gid=" + sGUID;

        hlTweetLink.NavigateUrl = "https://twitter.com/home?status=Checkout my cool product on Social Shop " + " " + baseUrl + "product.aspx?gid=" + sGUID;
    }

    [System.Web.Services.WebMethod]

    public String SaveImages()
    {

        string sCampaignID = utils.ToS(HttpContext.Current.Session["CampaignID"]);

        string dirFullPath = HttpContext.Current.Server.MapPath("~/uploads/gallery/");
        //string[] files;
        //int numFiles;
        //files = System.IO.Directory.GetFiles(dirFullPath);
        //numFiles = files.Length;
        //numFiles = numFiles + 1;

        string str_image = "";
        int OrdNum = utils.ToN(Session["OrdNum"]);

        string ddd = Request.QueryString["file"];

        foreach (string s in Request.Files)
        {
            HttpPostedFile file = Request.Files[s];


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

        return "saved";
    }

}