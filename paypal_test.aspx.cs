using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

using System.Net;
using System.Net.Mail;

using System.IO;
using System.Text;

public partial class paypal_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btngo.Click += Btngo_Click;
    }

    private void Btngo_Click(object sender, EventArgs e)
    {

            SqlParameter[] oParams2 = {
                    new SqlParameter("@PayPalID", utils.ToS("ffffff")),
                    new SqlParameter("@PurchaseAmount", utils.ToD(1)),
                    new SqlParameter("@TaxAmount", utils.ToD(0)),
                    new SqlParameter("@ShipAmount", utils.ToD(4.95)),
                    new SqlParameter("@ShipID", utils.ToN(0)),
                    new SqlParameter("@OrderDate", utils.ToS("1/4/2017")),
                    new SqlParameter("@PayPalTXNID", utils.ToS("aaaaa")),
                    new SqlParameter("@ProductID", utils.ToN(3043)),
                    new SqlParameter("@Qty", utils.ToN(1)),
                    new SqlParameter("@OptionID", utils.ToN(1)),
                    new SqlParameter("@payer_email", utils.ToS("TestDeviceFilter@test.com")),
                    new SqlParameter("@Firstname", utils.ToS("test")),
                    new SqlParameter("@Lastname", utils.ToS("tester")),
                    new SqlParameter("@Address", utils.ToS("address")),
                    new SqlParameter("@Suburb", utils.ToS("suburb")),
                    new SqlParameter("@State", utils.ToS("state")),
                    new SqlParameter("@PostCode", utils.ToN(2250)),
                    new SqlParameter("@Country", utils.ToS("Australia")),


                        };
            DataSet dsOrder = utils.ReturnDataset(oParams2, "sp_Insert_Order");

            int OrderID = utils.ToN(dsOrder.Tables[0].Rows[0]["myNewID"]);

            dsOrder.Dispose();


            SqlParameter[] oParams = {
                    new SqlParameter("@OrderID", OrderID)
            };

            DataSet dsDetails = utils.ReturnDataset(oParams, "sp_Get_OrderDetails");

            string sToEmail = utils.ToS(dsDetails.Tables[0].Rows[0]["SellerEmail"]);
            string sToName = utils.ToS(dsDetails.Tables[0].Rows[0]["SellerName"]);
            string sProduct = utils.ToS(dsDetails.Tables[0].Rows[0]["ProductName"]) + " " + utils.ToS(dsDetails.Tables[0].Rows[0]["ProductOption"]);

            dsDetails.Dispose();
            //send email(s)
            SendEmail(sToEmail, sToName, sProduct, OrderID, utils.ToS(Request.Form["quantity"]));
            SendBuyerEmail(utils.ToS(Request.Form["payer_email"]), utils.ToS(Request.Form["first_name"]) + " " + utils.ToS(Request.Form["last_name"]), sProduct, OrderID, utils.ToS(Request.Form["txn_id"]), utils.ToS(Request.Form["mc_gross"]), utils.ToS(Request.Form["shipping"]), utils.ToS(Request.Form["quantity"]));

        
        
    }

    void SendEmail(string ToEMail, string ToName, string Product, int OrderID, string Quantity)
    {
        string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";
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
        MailAddress from = new MailAddress("jeff@socialshop.com.au", "Jeff from SocialSHOP", System.Text.Encoding.UTF8);
        // Set destinations for the e-mail message.
        MailAddress to = new MailAddress(ToEMail, ToName);
        // Specify the message content.
        MailMessage message = new MailMessage(from, to);

        //message.Attachments.Add(new Attachment(Server.MapPath("~/invoice/" + InvoiceID.ToString() + ".pdf")));
        message.Body = "<h2>You just received some money from a purchase from SocialSHOP</h2><p>You will find the payment in your PayPal account and here are the purchase details -</p>" +
            "<p>Product - " + Product + "</p>" +
            "<p>Quantity - " + Quantity + "</p>" +
            "<p>View the full details at " + baseUrl + "orders" + "</p>" +
            "<p>Thanks for using SocialSHOP</p>" +
            "<p>Jeff from SocialSHOP</p>";

        // Include some non-ASCII characters in body and subject. 
        //string someArrows = new string(new char[] { '\u2190', '\u2191', '\u2192', '\u2193' });
        //message.Body += Environment.NewLine + someArrows;
        message.IsBodyHtml = true;
        message.BodyEncoding = System.Text.Encoding.UTF8;
        message.Subject = "Congratulations you just received a purchase on SocialSHOP";
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

    void SendBuyerEmail(string ToEMail, string ToName, string Product, int OrderID, string PayPalID, string PayAmnt, string ShipAmnt, string Quantity)
    {
        string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";
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
        MailAddress from = new MailAddress("jeff@socialshop.com.au", "Jeff from SocialSHOP", System.Text.Encoding.UTF8);
        // Set destinations for the e-mail message.
        MailAddress to = new MailAddress(ToEMail, ToName);
        // Specify the message content.
        MailMessage message = new MailMessage(from, to);

        //message.Attachments.Add(new Attachment(Server.MapPath("~/invoice/" + InvoiceID.ToString() + ".pdf")));
        message.Body = "<h2>Thanks for your purchase on SocialSHOP</h2><p>You will find the payment details in your PayPal account and here are the purchase details -</p>" +
            "<p>Product : " + Product + "</p>" +
            "<p>Quantity : " + Quantity + "</p>" +
            "<p>Purchase Amount : $" + PayAmnt + "</p>" +
            "<p>Shipping Amount : $" + ShipAmnt + "</p>" +
            "<p>PayPal Transaction ID :" + PayPalID + "</p>" +
            "<p>Thanks for using SocialSHOP</p>" +
            "<p>Jeff from SocialSHOP</p>";

        // Include some non-ASCII characters in body and subject. 
        //string someArrows = new string(new char[] { '\u2190', '\u2191', '\u2192', '\u2193' });
        //message.Body += Environment.NewLine + someArrows;
        message.IsBodyHtml = true;
        message.BodyEncoding = System.Text.Encoding.UTF8;
        message.Subject = "Congratulations you just made a purchase on SocialSHOP";
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