<%@ WebHandler Language="C#" Class="ImageUpload" %>

using System;
using System.Web;
using System.IO;

using System.Data.SqlClient;
using System.Data;

public class ImageUpload : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        string sCampaignID = utils.ToS(context.Session["CampaignID"]);
     

        string dirFullPath = HttpContext.Current.Server.MapPath("~/uploads/gallery/");
        //string[] files;
        //int numFiles;
        //files = System.IO.Directory.GetFiles(dirFullPath);
        //numFiles = files.Length;
        //numFiles = numFiles + 1;

        string str_image = "";
        int OrdNum = 1;
        foreach (string s in context.Request.Files)
        {
            HttpPostedFile file = context.Request.Files[s];
            //  int fileSizeInBytes = file.ContentLength;
            Stream thisImag = file.InputStream;
            string fileName = file.FileName;
            string fileExtension = file.ContentType;

            if (!string.IsNullOrEmpty(fileName))
            {
                
                fileExtension = Path.GetExtension(fileName);
                str_image = sCampaignID + "_" + fileName;
                string pathToSave_100 = HttpContext.Current.Server.MapPath("~/uploads/gallery/") + str_image;

                if(fileExtension.ToLower() == ".jpg")
                {
                    System.Drawing.Image imgMain = System.Drawing.Image.FromStream(thisImag);
                    imgMain = utils.FixedSize(imgMain, 720, 540);
                    utils.SaveJpeg(pathToSave_100, imgMain, 60);
                }

                if(fileExtension.ToLower() == ".png")
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
                //file.SaveAs(pathToSave_100);
            }
        }
        context.Response.Write(str_image);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}