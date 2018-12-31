using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;

public partial class dropzone : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Click += BtnSave_Click;
        if(IsPostBack)
        {
            
           // SaveUploadedFile(Request.Files);
        }
    }

    private void BtnSave_Click(object sender, EventArgs e)
    {
       
    }

    public void SaveUploadedFile(HttpFileCollection httpFileCollection)
    {
        int iFiles = HttpContext.Current.Request.Files.Count;

        
            bool isSavedSuccessfully = true;
        string fName = "";
        foreach (string fileName in httpFileCollection)
        {
            HttpPostedFile file = httpFileCollection.Get(fileName);
            //Save file content goes here
            fName = file.FileName;
            if (file != null && file.ContentLength > 0)
            {

                var originalDirectory = new DirectoryInfo(string.Format("{0}Images\\WallImages", Server.MapPath(@"\")));

                string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "imagepath");

                var fileName1 = Path.GetFileName(file.FileName);


                bool isExists = System.IO.Directory.Exists(pathString);

                if (!isExists)
                    System.IO.Directory.CreateDirectory(pathString);

                var path = string.Format("{0}\\{1}", pathString, file.FileName);
                file.SaveAs(path);

            }

        }

        //if (isSavedSuccessfully)
        //{
        //    return Json(new { Message = fName });
        //}
        //else
        //{
        //    return Json(new { Message = "Error in saving file" });
        //}
    }
}