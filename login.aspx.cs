using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;

using ASPSnippets.FaceBookAPI;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        btnSignIn.Click += BtnSignIn_Click;
        lbtnGoogle.Click += LbtnGoogle_Click;
        lbtnFacebook.Click += LbtnFacebook_Click;

        string code = Request.QueryString["code"];

        if (!IsPostBack)
        {
            //**** Google Sign In
            GoogleConnect.ClientId = "759444429779-fnlo07dnbkhqk60lpomeqatmvd12raq7.apps.googleusercontent.com";
            GoogleConnect.ClientSecret = "RsgfSaKEM23BDCtBZ1Yc3KDj";
            GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];

            if (Convert.ToBoolean(Session["GoogleLogin"]) == true)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["code"]))
                {
                    //string code = Request.QueryString["code"];
                    string json = GoogleConnect.Fetch("me", code);
                    GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);

                    string gID = profile.Id;
                    string sName = profile.DisplayName;
                    string sEmail = profile.Emails.Find(email => email.Type == "account").Value;
                    string sGender = profile.Gender;
                    string sProfileImage = profile.Image.Url;




                    SqlParameter[] oP = {
                new SqlParameter("@Email", sEmail),
                new SqlParameter("@FullName", sName),
                };
                    DataSet ds = utils.ReturnDataset(oP, "sp_Insert_GoogleLogin");

                    Session["ClientID"] = utils.ToN(ds.Tables[0].Rows[0]["UserID"]);
                    Session["ClientName"] = sName;
                    Session["ProfilePic"] = sProfileImage;
                    Session["PayPalEmail"] = utils.ToS(ds.Tables[0].Rows[0]["PayPalEmail"]);
                    Response.Redirect("profile.aspx");

                    //lblId.Text = profile.Id;
                    //lblName.Text = profile.DisplayName;
                    //lblEmail.Text = profile.Emails.Find(email => email.Type == "account").Value;
                    //lblGender.Text = profile.Gender;
                    //lblType.Text = profile.ObjectType;
                    //ProfileImage.ImageUrl = profile.Image.Url;
                    //pnlProfile.Visible = true;
                    //btnLogin.Enabled = false;
                }
                if (Request.QueryString["error"] == "access_denied")
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
                }
            }
            //**** End Google sign in

            //*** facebook signin
            FaceBookConnect.API_Key = "1399762596732302";
            FaceBookConnect.API_Secret = "af188185a026261899061c2635ba6ebf";

            

            if (Convert.ToBoolean(Session["FacebookLogin"]) == true)
            {
                
                if (!IsPostBack)
                {
                    if (Request.QueryString["error"] == "access_denied")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has denied access.')", true);
                        return;
                    }

                    //string code = Request.QueryString["code"];
                    if (!string.IsNullOrEmpty(code))
                    {
                        string data = FaceBookConnect.Fetch(code, "me");
                        FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
                        faceBookUser.PictureUrl = string.Format("https://graph.facebook.com/{0}/picture", faceBookUser.Id);
                        //pnlFaceBookUser.Visible = true;
                        //lblId.Text = faceBookUser.Id;
                        //lblUserName.Text = faceBookUser.UserName;
                        //lblName.Text = faceBookUser.Name;
                        //lblEmail.Text = faceBookUser.Email;
                        //ProfileImage.ImageUrl = faceBookUser.PictureUrl;
                        //btnLogin.Enabled = false;

                        SqlParameter[] oP = {
                            new SqlParameter("@Email", utils.ToS(faceBookUser.Email)),
                            new SqlParameter("@FullName", utils.ToS(faceBookUser.Name)),
                            };
                        DataSet ds = utils.ReturnDataset(oP, "sp_Insert_GoogleLogin");

                        Session["ClientID"] = utils.ToN(ds.Tables[0].Rows[0]["UserID"]);
                        Session["ClientName"] = utils.ToS(faceBookUser.Name);
                        Session["ProfilePic"] = faceBookUser.PictureUrl;
                        Session["PayPalEmail"] = utils.ToS(ds.Tables[0].Rows[0]["PayPalEmail"]);
                        Response.Redirect("profile.aspx");
                    }
                }
            }

        }

    }

    private void LbtnFacebook_Click(object sender, EventArgs e)
    {
        Session["FacebookLogin"] = true;
        FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split('?')[0]);
    }

    private void LbtnGoogle_Click(object sender, EventArgs e)
    {
        Session["GoogleLogin"] = true;
        
        GoogleConnect.Authorize("profile", "email");


    }

    private void BtnSignIn_Click(object sender, EventArgs e)
    {
        string refPage = HttpContext.Current.Request.UrlReferrer.AbsoluteUri;
        string sEmail = txtEmail.Text; //Request.Form["hdnEmail"].Replace(" ", "");
        string sPassword = txtPassword.Text; //Request.Form["hdnPassword"].Replace(" ", "");


        if (sEmail.Length > 0 && sPassword.Length > 0)
        {
            //*** new way
            SqlParameter[] oParams = { new SqlParameter("@Email", sEmail)
                                 };

            DataSet dsCheck = utils.ReturnDataset(oParams, "spLogin_CheckEmail");

            if (dsCheck.Tables[0].Rows.Count > 0)
            {
                string StoredPwd = utils.ToS(dsCheck.Tables[0].Rows[0]["Password"]);
                string guid = utils.ToS(dsCheck.Tables[0].Rows[0]["guid"]);

                string CheckPwd = utils.HashPassword(sPassword + guid);

                //SqlParameter[] oParams2 = { new SqlParameter("@Email", sEmail),
                //                        new SqlParameter("@Password", utils.ToS(CheckPwd))
                //                 };

                //DataSet dsCheckPwd = utils.ReturnDataset(oParams2, "spLogin_CheckPassword");

                if (CheckPwd == StoredPwd) // correct password
                {

                    Session["ClientID"] = utils.ToN(dsCheck.Tables[0].Rows[0]["UserID"]);
                    Session["ClientName"] = utils.ToS(dsCheck.Tables[0].Rows[0]["Firstname"]);
                    Session["PayPalEmail"] = utils.ToS(dsCheck.Tables[0].Rows[0]["PayPalEmail"]);

                    //SqlParameter[] oP = {
                    //    new SqlParameter("@ClientID", utils.ToN(dsCheck.Tables[0].Rows[0]["ClientID"]))
                    //    };
                    //utils.ReturnNoDataset(oP, "sp_ClientLogin_Log");

                    Response.Redirect("profile.aspx");
                }
                else
                {
                    pnlError.Visible = true;
                }
            }
            else
            {
                pnlError.Visible = true;
            }
        }
    }

    public class GoogleProfile
    {
        public string Id { get; set; }
        public string DisplayName { get; set; }
        public Image Image { get; set; }
        public List<Email> Emails { get; set; }
        public string Gender { get; set; }
        public string ObjectType { get; set; }
    }

    public class Email
    {
        public string Value { get; set; }
        public string Type { get; set; }
    }

    public class Image
    {
        public string Url { get; set; }
    }

    public class FaceBookUser
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public string PictureUrl { get; set; }
        public string Email { get; set; }
    }
}