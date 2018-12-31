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

public partial class fileupload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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

        string ddd = Request.QueryString["file"];

        

        foreach (string s in HttpContext.Current.Request.Files)
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


        //int ClientID = utils.ToN(Request.QueryString["cid"]);
        //string TagIDs = utils.ToS(Request.QueryString["tags"]);

        //foreach (string s in Request.Files)
        //{
        //    HttpPostedFile file = Request.Files[s];

        //    int fileSizeInBytes = file.ContentLength;
        //    string fileName = file.FileName;
        //    string fileExtension = "";

        //    if (!string.IsNullOrEmpty(fileName))
        //        fileExtension = Path.GetExtension(fileName);

        //    string randomName = Guid.NewGuid().ToString();

        //    //*** Physically save with a random name and no extension but point to the real file name in the database
        //    string savePath = Server.MapPath("~") + "\\uploads\\gallery\\" + randomName;

        //    SqlParameter[] oP = {
        //                        new SqlParameter ("@SavedName", randomName),
        //                        new SqlParameter ("@ActualName", fileName),
        //                        new SqlParameter ("@ClientID", ClientID),
        //                        new SqlParameter ("@FileExtension", fileExtension),
        //                        new SqlParameter ("@SavedByID", utils.ToN(Session["UserID"]))
        //    };


        //    DataSet dsDoc = utils.ReturnDataset(oP, "sp_ClientDocument_Insert");

        //    int DocID = utils.ToN(dsDoc.Tables[0].Rows[0]["NewDocID"]);
        //    dsDoc.Dispose();

        //    //*** Save Document Tags
        //    char[] comma = { ',' };
        //    string[] aTags = TagIDs.TrimEnd(comma).Split(comma);

        //    foreach (string t in aTags)
        //    {
        //        int CDTID = utils.ToN(t);

        //        SqlParameter[] oPTags = {
        //                        new SqlParameter ("@DocumentID", DocID),
        //                        new SqlParameter ("@CDTID", CDTID)
        //        };

        //        utils.ReturnNoDataset(oPTags, "sp_ClientDocumentTags_Insert");
        //    }

        //    // IMPORTANT! Make sure to validate uploaded file contents, size, etc. to prevent scripts being uploaded into your web app directory
        //    //string savedFileName = Path.Combine(@"C:\Temp\", Guid.NewGuid().ToString() + fileExtension);
        //    file.SaveAs(savePath);
        //}
    }
}