using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Text.RegularExpressions;
using System.IO;

/// <summary>
/// Summary description for utils
/// </summary>
/// 
public class utils
{
    public utils()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static Int32 ToN(object value)
    {
        try
        {
            int i = Convert.ToInt32(value);
            return i;
        }
        catch
        {
            return 0;
        }
    }
    public static Double ToD(object value)
    {
        try
        {
            double i = Convert.ToDouble(value);
            return i;
        }
        catch
        {
            return 0;
        }
    }

    public static String ToS(object value)
    {
        try
        {
            string s = Convert.ToString(value);
            return s;
        }
        catch
        {
            return "";
        }
    }
    public static bool IsNumeric(string value)
    {
        try
        {
            int.Parse(value);
            return (true);
        }
        catch
        {
            return (false);
        }
    }
    public static String HashPassword(string value)
    {
        
        var sha1 = System.Security.Cryptography.SHA1.Create();
        var inputBytes = System.Text.Encoding.ASCII.GetBytes(value);
        var hash = sha1.ComputeHash(inputBytes);

        var sb = new System.Text.StringBuilder();
        for (var i = 0; i < hash.Length; i++)
        {
            sb.Append(hash[i].ToString("X2"));
        }
        return sb.ToString();
    }

    public static String CleanHTML(string StringIn)
    {

        //string pattern = "<.*?>";
        //string pattern = "(<[^>]+>)";
        string sTemp = Regex.Replace(StringIn, @"</?(?i:script|embed|object|frameset|frame|iframe|meta|link|style|font|td|div|b|tr|tbody|table|strong|center|A|IMG)(.|\n)*?>", "");
        //replace all HTML tags

        //string sTemp = Regex.Replace(StringIn, pattern, string.Empty);
        sTemp = sTemp.Replace("width=23", "");
        sTemp = sTemp.Replace("width=43", "");
        sTemp = sTemp.Replace("width=40", "");
        sTemp = sTemp.Replace("width=25", "");
        sTemp = sTemp.Replace("width=50", "");
        sTemp = sTemp.Replace("width=55", "");
        sTemp = sTemp.Replace("width=60", "");
        sTemp = sTemp.Replace("width=70", "");
        sTemp = sTemp.Replace("width=35", "");
        sTemp = sTemp.Replace("width=105", "");
        sTemp = sTemp.Replace("width=160", "");
        sTemp = sTemp.Replace("width=280", "");
        sTemp = sTemp.Replace("width=200", "");
        sTemp = sTemp.Replace("align=right", "");
        sTemp = sTemp.Replace("class=rtable1", "");
        sTemp = sTemp.Replace("rowSpan=2", "");
        sTemp = sTemp.Replace("colSpan=2", "");
        sTemp = sTemp.Replace("colSpan=4", "");
        sTemp = sTemp.Replace("colSpan=5", "");
        sTemp = sTemp.Replace("class=tdleft", "");
        sTemp = sTemp.Replace("class=norm", "");
        sTemp = sTemp.Replace("class=rnorm", "");
        sTemp = sTemp.Replace(">", "");
        sTemp = sTemp.Replace("&nbsp;", " ");
        sTemp = sTemp.Replace(",", ";");
        sTemp = sTemp.Trim();

        return sTemp;
    }
    public static bool IsDate(string value)
    {
        try
        {
            DateTime.Parse(value);
            return (true);
        }
        catch
        {
            return (false);
        }
    }
    public static bool IsDate(object value)
    {
        try
        {
            return IsDate(utils.ToS(value));
        }
        catch
        {
            return (false);
        }
    }

    public static string MonthName(int MonthNumber)
    {
        string RetValue = "";
        switch (MonthNumber)
        {
            case 1:
                RetValue = "Jan";
                break;
            case 2:
                RetValue = "Feb";
                break;
            case 3:
                RetValue = "Mar";
                break;
            case 4:
                RetValue = "Apr";
                break;
            case 5:
                RetValue = "May";
                break;
            case 6:
                RetValue = "Jun";
                break;
            case 7:
                RetValue = "Jul";
                break;
            case 8:
                RetValue = "Aug";
                break;
            case 9:
                RetValue = "Sep";
                break;
            case 10:
                RetValue = "Oct";
                break;
            case 11:
                RetValue = "Nov";
                break;
            case 12:
                RetValue = "Dec";
                break;
        }
        return RetValue;
    }
    public static string GetTextInsideTags(string input)
    {
        string output = Regex.Replace(input, @"(<.*?>)", "", RegexOptions.IgnoreCase);
        output = output.Replace("&nbsp;", "");
        return output.Trim();
    }

    public static int DayOfWeekNumber(string DayName)
    {
        int RetValue = 0;

        switch (DayName.ToLower())
        {
            case "monday":
                RetValue = 1;
                break;
            case "tuesday":
                RetValue = 2;
                break;
            case "wednesday":
                RetValue = 3;
                break;
            case "thursday":
                RetValue = 4;
                break;
            case "friday":
                RetValue = 5;
                break;
            case "saturday":
                RetValue = 6;
                break;
            case "sunday":
                RetValue = 7;
                break;
            default:
                RetValue = 0;
                break;
        }
        return RetValue;
    }
    public static string renderSubContent(string content)
    {
        string c = content;
        c = renderVideo(c);
        c = renderFlash(c);
        c = renderPod(c);

        return c;
    }
    public static void AddRollver(System.Web.UI.WebControls.ImageButton img, string HoverImageUrl)
    {
        if (File.Exists(HttpContext.Current.Server.MapPath(HoverImageUrl)))
        {
            //create js events
            img.Attributes.Add("onmouseover", "rollon(this,'" + HoverImageUrl.Replace("~/", "") + "');");
            img.Attributes.Add("onmouseout", "rolloff(this);");

            //remove any old preloaders
            try
            {
                Literal lit = (Literal)img.Parent.FindControl(img.ID + "_hover");
            }
            catch (Exception)
            {
                //errored on find, add it.
                Literal lit = new Literal();
                lit.ID = img.ID + "_hover";
                lit.Text = "<script type=\"text/javascript\">var oImage = new Image; oImage.src='" + HoverImageUrl.Replace("~/", "") + "';</script>";
                img.Parent.Controls.AddAt(img.Parent.Controls.IndexOf(img), lit);
            }
        }
    }
    public static void AddRollver(System.Web.UI.WebControls.Image img, string HoverImageUrl)
    {
        if (File.Exists(HttpContext.Current.Server.MapPath(HoverImageUrl)))
        {
            //create js events
            img.Attributes.Add("onmouseover", "rollon(this,'" + HoverImageUrl.Replace("~/", "") + "');");
            img.Attributes.Add("onmouseout", "rolloff(this);");

            //remove any old preloaders
            try
            {
                Literal lit = (Literal)img.Parent.FindControl(img.ID + "_hover");
            }
            catch (Exception)
            {
                //errored on find, add it.
                Literal lit = new Literal();
                lit.ID = img.ID + "_hover";
                lit.Text = "<script type=\"text/javascript\">var oImage = new Image; oImage.src='" + HoverImageUrl.Replace("~/", "") + "';</script>";
                img.Parent.Controls.AddAt(img.Parent.Controls.IndexOf(img), lit);
            }
        }
    }

    public static string renderVideo(string content)
    {
        string text = "[[showvideo(";
        string text2 = ")]]";
        string text3 = content;
        int index = text3.IndexOf(text, StringComparison.OrdinalIgnoreCase);
        int num2 = 0;
        int i = 0;
        while (index > -1)
        {
            num2 = text3.IndexOf(text2, index, StringComparison.OrdinalIgnoreCase);
            try
            {
                i = ToN(text3.Substring(index + text.Length, (num2 - index) - text.Length));
                if (text == "[[showvideo(")
                {
                    text3 = text3.Replace(text + i.ToString() + text2, getVideo(i));
                }
            }
            catch
            {
                i = 0;
            }
            index = text3.IndexOf(text, StringComparison.OrdinalIgnoreCase);
        }
        return text3;
    }
    public static string getVideo(int i)
    {
        SqlParameter[] p = new SqlParameter[] { new SqlParameter("@VideoID", i) };
        DataSet set = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString(), CommandType.StoredProcedure, "spVideo_Get", p);
        string text = ToS(set.Tables[0].Rows[0]["Filename"]);
        string text2 = ToS(set.Tables[0].Rows[0]["StandByFilename"]);
        string text3 = ToS(set.Tables[0].Rows[0]["VideoSize"]);
        string text4 = "";
        string text5 = "";
        if (text3 == "small")
        {
            text4 = "250";
            text5 = "219";
        }
        else
        {
            text4 = "400";
            text5 = "332";
        }
        set.Dispose();
        string text6 = "vid" + i.ToString();
        return ("<div id=\"" + text6 + "\"><a href='' target='_blank'>It seems the required  version of Flash is not installed on this computer.  Please <a href='http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash&promoid=BIOW' target='_blank'>click here</a> to install.</div><script language=\"javascript\">\tvar staticviewer = new SWFObject(\"playa_" + text3 + ".swf\", \"flv\", \"" + text4 + "\", \"" + text5 + "\", \"8\", \"#ffffff\");\t\tstaticviewer.addVariable ( \"file_flv\", \"library/video/" + text + "\" );\t\t\tstaticviewer.addVariable ( \"file_img\", \"library/video/" + text2 + "\" );\t\t\tstaticviewer.write(\"" + text6 + "\");</script>");
    }



    public static Literal createLiteral(string s)
    {
        Literal l = new Literal();
        l.Text = s;
        return l;
    }


    public static string renderPod(string content)
    {
        string sStart = "[[showpod(";
        string sEnd = ")]]";
        string c = content;
        int iStart = c.IndexOf(sStart, StringComparison.OrdinalIgnoreCase);
        int iEnd = 0;
        string sVal = "";

        while (iStart > -1)
        {
            iEnd = c.IndexOf(sEnd, iStart, StringComparison.OrdinalIgnoreCase);
            try
            {
                sVal = utils.ToS(c.Substring(iStart + sStart.Length, iEnd - iStart - sStart.Length));
                if (sStart == "[[showpod(")
                {

                    c = c.Replace(sStart + sVal + sEnd, getPod(sVal.Split(',')[0], sVal.Split(',')[1]));
                }
            }
            catch
            {
                sVal = "";
            }

            iStart = c.IndexOf(sStart, StringComparison.OrdinalIgnoreCase);
        }
        return c;
    }
    public static string getPod(string path, string name)
    {
        string id = "pod" + path.Replace("/", "").Replace("%", "").Replace(".", "").Replace(" ", "");
        string s = "<table cellpadding='0' cellspacing='0' border='0'><tr><td style=\"padding-right: 2px;\"><a href=\"" + path + "\"><img src=\"library/image/site/podcast_download.gif\" onmouseover=\"this.src='library/image/site/podcast_download_over.gif';\" onmouseout=\"this.src='library/image/site/podcast_download.gif';\" alt=\"download\" border=\"0\" /></a></td><td style=\"padding-right: 3px;\"><div id=\"" + id + "\"></div></td><td style='vertical-align: middle;'><span class=\"redtext\">" + name + "</span></td></tr></table>"
            + "<script language=\"javascript\">"
            + "	var sopod" + id + " = new SWFObject(\"podplayer.swf\", \"swoof" + id + "\", \"17\", \"17\", \"8\", \"#ffffff\");"
            + "		sopod" + id + ".addVariable(\"mp3\",\"" + path + "\");"
            + "		sopod" + id + ".write(\"" + id + "\");"
            + "</script>";

        return s;
    }

    public static string renderFlash(string content)
    {
        string sStart = "[[showflash(";
        string sEnd = ")]]";
        string c = content;
        int iStart = c.IndexOf(sStart, StringComparison.OrdinalIgnoreCase);
        int iEnd = 0;
        string sVal = "";

        while (iStart > -1)
        {
            iEnd = c.IndexOf(sEnd, iStart, StringComparison.OrdinalIgnoreCase);
            try
            {
                sVal = utils.ToS(c.Substring(iStart + sStart.Length, iEnd - iStart - sStart.Length));
                if (sStart == "[[showflash(")
                {
                    c = c.Replace(sStart + sVal + sEnd, getFlash(sVal.Split(',')[0], sVal.Split(',')[1], sVal.Split(',')[2], sVal.Split(',')[3], sVal.Split(',')[4]));
                }

            }
            catch
            {
                sVal = "";
            }

            iStart = c.IndexOf(sStart, StringComparison.OrdinalIgnoreCase);
        }
        return c;

    }
    public static string getFlash(string path, string ver, string width, string height, string bg)
    {
        string id = "swoof" + path.Replace("/", "").Replace("%", "");
        string s = "<div id=\"" + id + "\">It seems the required  version of Flash is not installed on this computer.  Please <a href='http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash&promoid=BIOW' target='_blank'>click here</a> to install.</div>"
            + "<script language=\"javascript\">"
            + "	var staticviewer = new SWFObject(\"" + path + "\", \"vv\", \"" + width + "\", \"" + height + "\", \"" + ver + "\", \"" + bg + "\");"
            + "		staticviewer.write(\"" + id + "\");"
            + "</script>";

        return s;
    }

    public static void loadList(ListBox lst, string sql, string textField, string valueField)
    {
        DataSet ds = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString(),
            CommandType.Text, sql);

        lst.DataValueField = valueField;
        lst.DataTextField = textField;

        lst.DataSource = ds;
        lst.DataBind();

        ds.Dispose();
    }
    public static void loadList(ListBox lst, string sql, string textField, string valueField, string defaultValue)
    {
        loadList(lst, sql, textField, valueField);
        selectListItem(lst, defaultValue);
    }
    public static void loadList(ListBox lst, string sql, string textField, string valueField, string[] defaultValues)
    {
        loadList(lst, sql, textField, valueField);
        selectListItem(lst, defaultValues);
    }

    public static void loadList(DropDownList ddl, string sql, string textField, string valueField)
    {
        DataSet ds = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString(),
            CommandType.Text, sql);

        ddl.DataValueField = valueField;
        ddl.DataTextField = textField;

        ddl.DataSource = ds;
        ddl.DataBind();

        ds.Dispose();
    }
    public static void loadList(DropDownList ddl, string sql, string textField, string valueField, string defaultValue)
    {
        loadList(ddl, sql, textField, valueField);
        selectListItem(ddl, defaultValue);
    }
    public static void loadList(DropDownList ddl, string sql, string textField, string valueField, string[] defaultValues)
    {
        loadList(ddl, sql, textField, valueField);
        selectListItem(ddl, defaultValues);
    }

    public static void selectListItem(ListBox lst, string selectedItem)
    {
        foreach (ListItem li in lst.Items)
        {
            if (li.Value.ToString() == selectedItem || li.Text.ToString() == selectedItem)
                li.Selected = true;
        }

    }
    public static void selectListItem(DropDownList ddl, string selectedItem)
    {
        foreach (ListItem li in ddl.Items)
        {
            if (li.Value.ToString() == selectedItem || li.Text.ToString() == selectedItem)
                li.Selected = true;
        }

    }

    public static void selectListItem(ListBox lst, string[] selectedItems)
    {
        foreach (string selectedItem in selectedItems)
        {
            selectListItem(lst, selectedItem);
        }

    }
    public static void selectListItem(DropDownList ddl, string[] selectedItems)
    {
        foreach (string selectedItem in selectedItems)
        {
            selectListItem(ddl, selectedItem);
        }

    }

    public static Control FindControlRecursive(Control root, string id)
    {
        if (root.ID == id)
        {
            return root;
        }

        foreach (Control c in root.Controls)
        {
            Control t = FindControlRecursive(c, id);
            if (t != null)
            {
                return t;
            }
        }

        return null;
    }

    // Convert string to LowerCase
    public static String Lower(String strParam)
    {
        return strParam.ToLower();
    }

    //Convert String to UpperCase
    public static String Upper(String strParam)
    {
        return strParam.ToUpper();
    }

    //Convert String to ProperCase
    public static String PCase(String strParam)
    {
        try
        {
            String strProper = strParam.Substring(0, 1).ToUpper();
            strParam = strParam.Substring(1).ToLower();
            String strPrev = "";

            for (int iIndex = 0; iIndex < strParam.Length; iIndex++)
            {
                if (iIndex > 1)
                {
                    strPrev = strParam.Substring(iIndex - 1, 1);
                }
                if (strPrev.Equals(" ") ||
                    strPrev.Equals("\t") ||
                    strPrev.Equals("\n") ||
                    strPrev.Equals("."))
                {
                    strProper += strParam.Substring(iIndex, 1).ToUpper();
                }
                else
                {
                    strProper += strParam.Substring(iIndex, 1);
                }
            }
            return strProper;
        }
        catch
        {
            return "";
        }
    }

    // Function to Reverse the String
    public static String Reverse(String strParam)
    {
        if (strParam.Length == 1)
        {
            return strParam;
        }
        else
        {
            return Reverse(strParam.Substring(1)) + strParam.Substring(0, 1);
        }
    }

    // Function to Test for Palindrome
    public static bool IsPalindrome(String strParam)
    {
        int iLength, iHalfLen;
        iLength = strParam.Length - 1;
        iHalfLen = iLength / 2;
        for (int iIndex = 0; iIndex <= iHalfLen; iIndex++)
        {
            if (strParam.Substring(iIndex, 1) != strParam.Substring(iLength - iIndex, 1))
            {
                return false;
            }
        }
        return true;
    }

    // Function to get string from left.
    public static String Left(String strParam, int iLen)
    {
        if (iLen > 0)
            return strParam.Substring(0, iLen);
        else
            return strParam;
    }

    //Function to get string from right
    public static String Right(String strParam, int iLen)
    {
        if (iLen > 0)
            return strParam.Substring(strParam.Length - iLen, iLen);
        else
            return strParam;
    }

    //Function to count no.of occurences of Substring in Main string
    public static int CharCount(String strSource, String strToCount)
    {
        int iCount = 0;
        int iPos = strSource.IndexOf(strToCount);
        while (iPos != -1)
        {
            iCount++;
            strSource = strSource.Substring(iPos + 1);
            iPos = strSource.IndexOf(strToCount);
        }
        return iCount;
    }

    //Function to count no.of occurences of Substring in Main string
    public static int CharCount(String strSource, String strToCount, bool IgnoreCase)
    {
        if (IgnoreCase)
        {
            return CharCount(strSource.ToLower(), strToCount.ToLower());
        }
        else
        {
            return CharCount(strSource, strToCount);
        }
    }

    //Useful Function can be used whitespace stripping programs
    //Function Trim the string to contain Single between words
    public static String ToSingleSpace(String strParam)
    {
        int iPosition = strParam.IndexOf("  ");
        if (iPosition == -1)
        {
            return strParam;
        }
        else
        {
            return ToSingleSpace(strParam.Substring(0, iPosition) + strParam.Substring(iPosition + 1));
        }
    }

    //Function Replace string function.
    public static string Mid(string param, int startIndex, int length)
    {

        string result = param.Substring(startIndex, length);

        return result;
    }

    public static String Replace(String strText, String strFind, String strReplace)
    {
        int iPos = strText.IndexOf(strFind);
        String strReturn = "";
        while (iPos != -1)
        {
            strReturn += strText.Substring(0, iPos) + strReplace;
            strText = strText.Substring(iPos + strFind.Length);
            iPos = strText.IndexOf(strFind);
        }
        if (strText.Length > 0)
            strReturn += strText;
        return strReturn;
    }

    public static Size FacebookImage(int Width, int Height)
    {
        double AspectRatio = 0;
        double NewWidth = 0;
        double NewHeight = 0;

        if (Width > Height)
        {

            if (Width > 600)
            {
                AspectRatio = 600 / Width;
                NewWidth = 600;
                NewHeight = AspectRatio * Height;
            }
        }
        else
        {

            if (Height > 315)
            {
                AspectRatio = 315 / Height;
                NewHeight = 315;
                NewWidth = AspectRatio * Width;
            }
        }

        Size ret = new Size(utils.ToN(NewWidth), utils.ToN(NewHeight));
        return ret;
    }

    public static Size TwitterImage(int Width, int Height)
    {
        double AspectRatio = 0;
        double NewWidth = 0;
        double NewHeight = 0;

        if (Width > Height)
        {

            if (Width > 240)
            {
                AspectRatio = 240 / Width;
                NewWidth = 240;
                NewHeight = AspectRatio * Height;
            }
        }
        else
        {

            if (Height > 240)
            {
                AspectRatio = 240 / Height;
                NewHeight = 240;
                NewWidth = AspectRatio * Width;
            }
        }

        Size ret = new Size(utils.ToN(NewWidth), utils.ToN(NewHeight));
        return ret;
    }

    //resize image to fixed size
    public static System.Drawing.Image FixedSize(System.Drawing.Image imgPhoto, int Width, int Height)
    {
        int sourceWidth = imgPhoto.Width;
        int sourceHeight = imgPhoto.Height;
        int sourceX = 0;
        int sourceY = 0;
        int destX = 0;
        int destY = 0;

        float nPercent = 0;
        float nPercentW = 0;
        float nPercentH = 0;

        nPercentW = ((float)Width / (float)sourceWidth);
        nPercentH = ((float)Height / (float)sourceHeight);
        if (nPercentH < nPercentW)
        {
            nPercent = nPercentH;
            destX = System.Convert.ToInt16((Width -
                          (sourceWidth * nPercent)) / 2);
        }
        else
        {
            nPercent = nPercentW;
            destY = System.Convert.ToInt16((Height -
                          (sourceHeight * nPercent)) / 2);
        }

        int destWidth = (int)(sourceWidth * nPercent);
        int destHeight = (int)(sourceHeight * nPercent);

        Bitmap bmPhoto = new Bitmap(Width, Height,
                          System.Drawing.Imaging.PixelFormat.Format24bppRgb);
        bmPhoto.SetResolution(imgPhoto.HorizontalResolution,
                         imgPhoto.VerticalResolution);

        Graphics grPhoto = Graphics.FromImage(bmPhoto);
        grPhoto.Clear(Color.Black);
        grPhoto.InterpolationMode =
                System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;

        grPhoto.DrawImage(imgPhoto,
            new Rectangle(destX, destY, destWidth, destHeight),
            new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
            GraphicsUnit.Pixel);

        grPhoto.Dispose();
        return bmPhoto;
    }

    /// <summary>
    /// Saves an image as a jpeg image, with the given quality
    /// </summary>
    /// <param name="path">Path to which the image would be saved.</param>
    // <param name="quality">An integer from 0 to 100, with 100 being the
    /// highest quality</param> 
    public static void SaveJpeg(string path, System.Drawing.Image img, int quality)
    {
        if (quality < 0 || quality > 100)
            throw new ArgumentOutOfRangeException("quality must be between 0 and 100.");


        // Encoder parameter for image quality
        System.Drawing.Imaging.EncoderParameter qualityParam =
            new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, quality);
        // Jpeg image codec
        System.Drawing.Imaging.ImageCodecInfo jpegCodec = GetEncoderInfo("image/jpeg");

        System.Drawing.Imaging.EncoderParameters encoderParams = new System.Drawing.Imaging.EncoderParameters(1);
        encoderParams.Param[0] = qualityParam;

        img.Save(path, jpegCodec, encoderParams);
    }

    public static void SavePNG(string path, System.Drawing.Image img, int quality)
    {
        if (quality < 0 || quality > 100)
            throw new ArgumentOutOfRangeException("quality must be between 0 and 100.");


        // Encoder parameter for image quality
        System.Drawing.Imaging.EncoderParameter qualityParam =
            new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, quality);
        // Jpeg image codec
        System.Drawing.Imaging.ImageCodecInfo jpegCodec = GetEncoderInfo("image/png");

        System.Drawing.Imaging.EncoderParameters encoderParams = new System.Drawing.Imaging.EncoderParameters(1);
        encoderParams.Param[0] = qualityParam;

        img.Save(path, jpegCodec, encoderParams);
    }

    /// <summary>
    /// Returns the image codec with the given mime type
    /// </summary>
    private static System.Drawing.Imaging.ImageCodecInfo GetEncoderInfo(string mimeType)
    {
        // Get image codecs for all image formats
        System.Drawing.Imaging.ImageCodecInfo[] codecs = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders();

        // Find the correct image codec
        for (int i = 0; i < codecs.Length; i++)
            if (codecs[i].MimeType == mimeType)
                return codecs[i];
        return null;
    }

    public static string StripHTML(string source)
    {

        try
        {

            string result;

            // Remove HTML Development formatting
            // Replace line breaks with space
            // because browsers inserts space
            result = source.Replace("\r", " ");
            // Replace line breaks with space
            // because browsers inserts space
            result = result.Replace("\n", " ");
            // Remove step-formatting
            result = result.Replace("\t", string.Empty);
            // Remove repeating speces becuase browsers ignore them
            result = System.Text.RegularExpressions.Regex.Replace(result,
                                                                  @"( )+", " ");

            // Remove the header (prepare first by clearing attributes)
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*head([^>])*>", "<head>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"(<( )*(/)( )*head( )*>)", "</head>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(<head>).*(</head>)", string.Empty,
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // remove all scripts (prepare first by clearing attributes)
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*script([^>])*>", "<script>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"(<( )*(/)( )*script( )*>)", "</script>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            //result = System.Text.RegularExpressions.Regex.Replace(result, 
            //         @"(<script>)([^(<script>\.</script>)])*(</script>)",
            //         string.Empty, 
            //         System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"(<script>).*(</script>)", string.Empty,
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // remove all styles (prepare first by clearing attributes)
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*style([^>])*>", "<style>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"(<( )*(/)( )*style( )*>)", "</style>",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(<style>).*(</style>)", string.Empty,
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // insert tabs in spaces of <td> tags
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*td([^>])*>", "\t",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // insert line breaks in places of <BR> and <LI> tags
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*br( )*>", "\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*li( )*>", "\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // insert line paragraphs (double line breaks) in place
            // if <P>, <DIV> and <TR> tags
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*div([^>])*>", "\r\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*tr([^>])*>", "\r\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<( )*p([^>])*>", "\r\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // Remove remaining tags like <a>, links, images,
            // comments etc - anything thats enclosed inside < >
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"<[^>]*>", string.Empty,
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // replace special characters:
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&nbsp;", " ",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&bull;", " * ",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&lsaquo;", "<",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&rsaquo;", ">",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&trade;", "(tm)",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&frasl;", "/",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&lt;", "<",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&gt;", ">",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&copy;", "(c)",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&reg;", "(r)",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            // Remove all others. More can be added, see
            // http://hotwired.lycos.com/webmonkey/reference/special_characters/
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     @"&(.{2,6});", string.Empty,
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // for testng
            //System.Text.RegularExpressions.Regex.Replace(result, 
            //       txtRegex.Text,string.Empty, 
            //       System.Text.RegularExpressions.RegexOptions.IgnoreCase);

            // make line breaking consistent
            result = result.Replace("\n", "\r");

            // Remove extra line breaks and tabs:
            // replace over 2 breaks with 2 and over 4 tabs with 4. 
            // Prepare first to remove any whitespaces inbetween
            // the escaped characters and remove redundant tabs inbetween linebreaks
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\r)( )+(\r)", "\r\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\t)( )+(\t)", "\t\t",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\t)( )+(\r)", "\t\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\r)( )+(\t)", "\r\t",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            // Remove redundant tabs
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\r)(\t)+(\r)", "\r\r",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            // Remove multible tabs followind a linebreak with just one tab
            result = System.Text.RegularExpressions.Regex.Replace(result,
                     "(\r)(\t)+", "\r\t",
                     System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            // Initial replacement target string for linebreaks
            string breaks = "\r\r\r";
            // Initial replacement target string for tabs
            string tabs = "\t\t\t\t\t";
            for (int index = 0; index < result.Length; index++)
            {
                result = result.Replace(breaks, "\r\r");
                result = result.Replace(tabs, "\t\t\t\t");
                breaks = breaks + "\r";
                tabs = tabs + "\t";
            }

            // Thats it.
            return result;

        }
        catch
        {
            //MessageBox.Show("Error");
            return source;
        }
    }

    public static string Truncate(string Text, int len)
    {
        string sTemp = "";
        if (Text.Length > len)
        {
            sTemp = utils.Left(Text, len) + " ...";
        }
        else
        {
            sTemp = Text;
        }
        return sTemp;
    }

    public static DataSet ReturnDataset(SqlParameter SQLParam, string QueryName)
    {
        DataSet ds = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString,
            CommandType.StoredProcedure,
            QueryName,
            SQLParam);

        return ds;

    }
    public static DataSet ReturnDataset(SqlParameter[] SQLParams, string QueryName)
    {
        DataSet ds = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString,
            CommandType.StoredProcedure,
            QueryName,
            SQLParams);

        return ds;

    }
    public static DataSet ReturnDataset(string QueryName)
    {
        //char[] ParamSplit = { '|' };
        //char[] ValuesSplit = { ',' };
        //string[] sParams = Parameters.Split(ParamSplit);


        //SqlParameter[] oParams = { 
        //            new SqlParameter("@A_PK", utils.ToS(Session["a_pk"])),
        //            new SqlParameter("@Query", SQL.Replace("<br />" ," "))
        //            };

        DataSet ds = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString,
            CommandType.StoredProcedure, QueryName);

        return ds;

    }
    public static void ReturnNoDataset(SqlParameter SQLParam, string QueryName)
    {
        SqlHelper.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString,
            CommandType.StoredProcedure,
            QueryName,
            SQLParam);
    }
    public static void ReturnNoDataset(SqlParameter[] SQLParams, string QueryName)
    {
        SqlHelper.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString,
            CommandType.StoredProcedure,
            QueryName,
            SQLParams);
    }
    public static void ReturnNoDataset(string QueryName)
    {
        SqlHelper.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString,
            CommandType.StoredProcedure, QueryName);
    }
    public static void RunSQLStringQuery(string SQL)
    {
        SqlHelper.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString, CommandType.Text, SQL);
    }
    public static DataSet RunSQLStringQueryRet(string SQL)
    {
        DataSet ds = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString, CommandType.Text, SQL);
        return ds;
    }
    public class Settings
    {
        public static string Get(string SettingName)
        {
            SqlParameter[] p = { new SqlParameter("@SettingName", SettingName) };
            DataSet ds = ReturnDataset(p, "spSetting_Get");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ds.Dispose();
                return utils.ToS(ds.Tables[0].Rows[0]["SettingValue"]);
            }
            ds.Dispose();
            return "";
        }
        public static void Set(string SettingName, string SettingValue)
        {
            //todo
        }
    }
}

public static class SqlHelper
{
    public static void ExecuteNonQuery(string connstring, CommandType ct, string sql)
    {
        SqlParameter[] p2 = { };
        ExecuteNonQuery(connstring, ct, sql, p2);
    }
    public static void ExecuteNonQuery(string connstring, CommandType ct, string sql, SqlParameter p)
    {
        SqlParameter[] p2 = { p };
        ExecuteNonQuery(connstring, ct, sql, p2);
    }
    public static void ExecuteNonQuery(string connstring, CommandType ct, string sql, SqlParameter[] p)
    {
        SqlConnection conn = new SqlConnection(connstring);
        conn.Open();

        SqlCommand comm = new SqlCommand(sql, conn);
        comm.Parameters.AddRange(p);
        comm.CommandType = ct;

        comm.ExecuteNonQuery();

        conn.Close();
    }
    public static DataSet ExecuteDataset(string connstring, CommandType ct, string sql, SqlParameter p)
    {
        SqlParameter[] p2 = { p };
        return ExecuteDataset(connstring, ct, sql, p2);
    }
    public static DataSet ExecuteDataset(string connstring, CommandType ct, string sql)
    {
        SqlParameter[] p2 = { };
        return ExecuteDataset(connstring, ct, sql, p2);
    }
    public static DataSet ExecuteDataset(string connstring, CommandType ct, string sql, SqlParameter[] p)
    {
        SqlConnection conn = new SqlConnection(connstring);
        conn.Open();

        SqlCommand comm = new SqlCommand(sql, conn);
        comm.Parameters.AddRange(p);
        comm.CommandType = ct;

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = comm;

        DataSet ds = new DataSet();
        da.Fill(ds);

        da.Dispose();
        conn.Close();
        conn.Dispose();

        return ds;
    }

    public static DataSet convertDataReaderToDataSet(SqlDataReader reader)
    {
        DataSet dataSet = new DataSet();
        do
        {
            // Create new data table

            DataTable schemaTable = reader.GetSchemaTable();
            DataTable dataTable = new DataTable();

            if (schemaTable != null)
            {
                // A query returning records was executed

                for (int i = 0; i < schemaTable.Rows.Count; i++)
                {
                    DataRow dataRow = schemaTable.Rows[i];
                    // Create a column name that is unique in the data table
                    string columnName = (string)dataRow["ColumnName"]; //+ "<C" + i + "/>";
                    // Add the column definition to the data table
                    DataColumn column = new DataColumn(columnName, (Type)dataRow["DataType"]);
                    dataTable.Columns.Add(column);
                }

                dataSet.Tables.Add(dataTable);

                // Fill the data table we just created

                while (reader.Read())
                {
                    DataRow dataRow = dataTable.NewRow();

                    for (int i = 0; i < reader.FieldCount; i++)
                        dataRow[i] = reader.GetValue(i);

                    dataTable.Rows.Add(dataRow);
                }
            }
            else
            {
                // No records were returned

                DataColumn column = new DataColumn("RowsAffected");
                dataTable.Columns.Add(column);
                dataSet.Tables.Add(dataTable);
                DataRow dataRow = dataTable.NewRow();
                dataRow[0] = reader.RecordsAffected;
                dataTable.Rows.Add(dataRow);
            }
        }
        while (reader.NextResult());
        return dataSet;
    }
}

