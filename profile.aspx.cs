using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

using System.IO;

using System.Net;
using System.Net.Mail;

using ASPSnippets.FaceBookAPI;

public partial class profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //FaceBookConnect.Logout(Request.QueryString["code"]);
        
        if (utils.ToN(Session["ClientID"]) == 0)
            Response.Redirect("login.aspx");


        btnSavePayPal.Click += BtnSavePayPal_Click;
        btnSaveFacebook.Click += BtnSaveFacebook_Click;
        btnEmail.Click += BtnEmail_Click;

        if (!IsPostBack)
        {
            SqlParameter[] oParams = {
                        new SqlParameter("@UserID", utils.ToN(Session["ClientID"])),

                        };
            DataSet ds = utils.ReturnDataset(oParams, "sp_Get_UserDetails");

            lblPayPal.Text = utils.ToS(ds.Tables[0].Rows[0]["PayPalEmail"]);
            txtPayPal.Text = utils.ToS(ds.Tables[0].Rows[0]["PayPalEmail"]);
            lblEmail.Text = utils.ToS(ds.Tables[0].Rows[0]["Email"]);
            lblFacebookPage.Text = utils.ToS(ds.Tables[0].Rows[0]["FacebookPage"]);
            txtFacebook.Text = utils.ToS(ds.Tables[0].Rows[0]["FacebookPage"]);
            lblName.Text = utils.ToS(ds.Tables[0].Rows[0]["Firstname"]) + " " + utils.ToS(ds.Tables[0].Rows[0]["Lastname"]);
            ds.Dispose();

            if (lblPayPal.Text == "")
                lblPayPal.Text = "click here to edit";

            if (lblFacebookPage.Text == "")
                lblFacebookPage.Text = "click here to edit";

            LoadProductsList();

            SqlParameter[] oParams2 = {
                        new SqlParameter("@UserID", utils.ToN(Session["ClientID"])),

                        };
            DataSet ds2 = utils.ReturnDataset(oParams2, "sp_Get_ProfileDetails");

            int iTotProducts = utils.ToN(ds2.Tables[0].Rows[0][0]);
            int iOrders = utils.ToN(ds2.Tables[1].Rows[0][0]);
            double dRevenue = utils.ToD(ds2.Tables[2].Rows[0][0]);
            int iUnsent = utils.ToN(ds2.Tables[3].Rows[0][0]);
            int iViews = utils.ToN(ds2.Tables[4].Rows[0][0]);

            lblTotalProducts.Text = utils.ToS(iTotProducts);
            lblOrders.Text = utils.ToS(iOrders);
            lblRevenue.Text = dRevenue.ToString("C");
            lblUnsentOrders.Text = utils.ToS(iUnsent);
            lblViews.Text = utils.ToS(iViews);

            if (Convert.ToBoolean(Session["FacebookLogin"]) == true)
            {
                imgProfilePic.ImageUrl = utils.ToS(Session["ProfilePic"]);
            }

            if (Convert.ToBoolean(Session["GoogleLogin"]) == true)
            {
                imgProfilePic.ImageUrl = utils.ToS(Session["ProfilePic"]);
            }

        }
    }

    private void BtnFBLogout_Click(object sender, EventArgs e)
    {
        btnFBLogout.Click += BtnFBLogout_Click;
    }

    private void BtnEmail_Click(object sender, EventArgs e)
    {
        SendEmail();
    }

    private void BtnSaveFacebook_Click(object sender, EventArgs e)
    {
        try {
            SqlParameter[] oParams = {
                        new SqlParameter("@UserID", utils.ToN(Session["ClientID"])),
                        new SqlParameter("@FacebookPage", utils.ToS(txtFacebook.Text)),
                        };
            utils.ReturnNoDataset(oParams, "sp_Update_UserDetails");

            lblFacebookPage.Text = txtFacebook.Text;
        }
        catch { }
    }

    private void BtnSavePayPal_Click(object sender, EventArgs e)
    {
        try
        {
            SqlParameter[] oParams = {
                        new SqlParameter("@UserID", utils.ToN(Session["ClientID"])),
                        new SqlParameter("@PayPalEmail", utils.ToS(txtPayPal.Text)),
                        };
            utils.ReturnNoDataset(oParams, "sp_Update_UserDetails");

            lblPayPal.Text = txtPayPal.Text;

            if(lblPayPal.Text.Length > 0)
            {
                Session["PayPal"] = lblPayPal.Text;
            }
        }
        catch { }
    }

    void LoadProductsList()
    {
        SqlParameter[] oParams = {
                        new SqlParameter("@UserID", utils.ToN(Session["ClientID"])),

                        };
        DataSet ds = utils.ReturnDataset(oParams, "sp_Get_UserProducts");

        rptProducts.DataSource = ds;
        rptProducts.DataBind();

        ds.Dispose();
    }

    protected String ViewLink(string sGUID)
    {
        string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";

        return baseUrl + "product.aspx?gid=" + sGUID;
    }

    protected String TwitterLink(string sGUID)
    {
        string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";

        return "https://twitter.com/home?status=Checkout my cool product on Social Shop " + " " + baseUrl + "product.aspx?gid=" + sGUID;
    }

    protected String FacebookLink(string sGUID)
    {
        string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";
    //https://www.facebook.com/sharer/sharer.php?u=http://socialshop.com.au/product.aspx?gid=39b06f98-1ccb-4524-85bd-6c22711e74c4

        return "https://www.facebook.com/sharer/sharer.php?u=" + " " + baseUrl + "product.aspx?gid=" + sGUID;
    }

    void SendEmail()
    {
        string sReplyTo = "jeff@socialshop.com.au";

        // Command line argument must the the SMTP host.
        SmtpClient client = new SmtpClient();
        client.Host = "smtp.zoho.com";
        client.EnableSsl = true;
        System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
        NetworkCred.UserName = "jeff@socialshop.com.au";
        NetworkCred.Password = "Oa6ACK4P2oYWNiamnXGK";
        client.Credentials = NetworkCred;
        client.Port = 587;
        //client.Send(message);
        // Specify the e-mail sender. 
        // Create a mailing address that includes a UTF8 character 
        // in the display name.
        MailAddress from = new MailAddress("jeff@socialshop.com.au", "Jeff", System.Text.Encoding.UTF8);
        // Set destinations for the e-mail message.
        MailAddress to = new MailAddress("jeffhallam@live.com.au", "Jefferson");
        // Specify the message content.
        MailMessage message = new MailMessage(from, to);

        //message.Attachments.Add(new Attachment(Server.MapPath("~/invoice/" + InvoiceID.ToString() + ".pdf")));
        message.Body = "<h2>Thanks for signing up on socialshop.com.au</h2>";
        // Include some non-ASCII characters in body and subject. 
        //string someArrows = new string(new char[] { '\u2190', '\u2191', '\u2192', '\u2193' });
        //message.Body += Environment.NewLine + someArrows;
        message.IsBodyHtml = true;
        message.BodyEncoding = System.Text.Encoding.UTF8;
        message.Subject = "Your password for socialshop.com.au";
        message.SubjectEncoding = System.Text.Encoding.UTF8;
        message.ReplyToList.Add(sReplyTo);
        //try
        //{
            client.Send(message);


        //}
       // catch
       // {
            // oh no an error
            //pnlError.Visible = true;
            string err = "";
       // }

        // Clean up.
        message.Dispose();
    }
}