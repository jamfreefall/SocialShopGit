using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using System.IO;

public partial class image : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Click += BtnSave_Click;
    }

    private void BtnSave_Click(object sender, EventArgs e)
    {
        string BaseUploadPath = Server.MapPath("~") + "Uploads\\";
        string b64 = dataURLInto.InnerText;

        imgOutput.ImageUrl = b64;

        b64 = FixBase64ForImage(b64);

        string convert = b64.Replace("data:image/jpeg;base64,", String.Empty);
        convert = convert.Replace("data:image/png;base64,", String.Empty);

        string filePath = BaseUploadPath + "MyImage.jpg";
        File.WriteAllBytes(filePath, Convert.FromBase64String(convert));

        //ConvertBase64ToImage(b64, BaseUploadPath + "test.jpg");
    }

    void ConvertBase64ToImage(string input, string SavePath)
    {
        if (input.Length > 0)
        {
            string convert = input.Replace("data:image/jpeg;base64,", String.Empty);
            convert = input.Replace("data:image/png;base64,", String.Empty);
        

            Byte[] bitmapData = new Byte[convert.Length];
            bitmapData = Convert.FromBase64String(FixBase64ForImage(convert));

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
}