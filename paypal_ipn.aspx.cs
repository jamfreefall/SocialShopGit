using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.IO;
using System.Text;

using System.Data.SqlClient;
using System.Data;


using System.Net.Mail;

public partial class paypal_ipn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        //string sSQL = "Insert Into tShop(Shopname,UserID) Values('Test',1)";

        //utils.RunSQLStringQuery(sSQL);

        //Post back to either sandbox or live
        //string strSandbox = "https://www.sandbox.paypal.com/cgi-bin/webscr";
        string strSandbox = "https://www.paypal.com/cgi-bin/webscr";
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(strSandbox);

        //Set values for the request back
        req.Method = "POST";
        req.ContentType = "application/x-www-form-urlencoded";
        byte[] param = Request.BinaryRead(HttpContext.Current.Request.ContentLength);
        string strRequest = Encoding.ASCII.GetString(param);
        strRequest += "&cmd=_notify-validate";
        req.ContentLength = strRequest.Length;

        //Send the request to PayPal and get the response
        StreamWriter streamOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
        streamOut.Write(strRequest);
        streamOut.Close();
        StreamReader streamIn = new StreamReader(req.GetResponse().GetResponseStream());
        string strResponse = streamIn.ReadToEnd();
        streamIn.Close();

        int iShipID = utils.ToN(Request.QueryString["sid"]);
        string sGUID = utils.ToS(Request.QueryString["g"]);
        if (strResponse == "VERIFIED")
        {
            SqlParameter[] oParams2 = {
                    new SqlParameter("@PayPalID", utils.ToS(Request.Form["txn_id"])),
                    new SqlParameter("@PurchaseAmount", utils.ToD(Request.Form["mc_gross"])),
                    new SqlParameter("@TaxAmount", utils.ToD(Request.Form["tax"])),
                    new SqlParameter("@ShipAmount", utils.ToD(Request.Form["shipping"])),
                    new SqlParameter("@ShipID", utils.ToN(iShipID)),
                    new SqlParameter("@OrderDate", utils.ToS(Request.Form["payment_date"])),
                    new SqlParameter("@PayPalTXNID", utils.ToS(Request.Form["txn_id"])),
                    new SqlParameter("@ProductID", utils.ToN(Request.Form["item_number"])),
                    new SqlParameter("@Qty", utils.ToN(Request.Form["quantity"])),
                    new SqlParameter("@OptionID", utils.ToN(Request.Form["custom"])),
                    new SqlParameter("@payer_email", utils.ToS(Request.Form["payer_email"])),
                    new SqlParameter("@Firstname", utils.ToS(Request.Form["first_name"])),
                    new SqlParameter("@Lastname", utils.ToS(Request.Form["last_name"])),
                    new SqlParameter("@Address", utils.ToS(Request.Form["address_street"])),
                    new SqlParameter("@Suburb", utils.ToS(Request.Form["address_city"])),
                    new SqlParameter("@State", utils.ToS(Request.Form["address_state"])),
                    new SqlParameter("@PostCode", utils.ToN(Request.Form["address_zip"])),
                    new SqlParameter("@Country", utils.ToS(Request.Form["address_country"])),


                        };
            DataSet dsOrder = utils.ReturnDataset(oParams2, "sp_Insert_Order");

            int OrderID = utils.ToN(dsOrder.Tables[0].Rows[0]["myNewID"]);

            dsOrder.Dispose();

            Session["PayPalID"] = utils.ToS(Request.Form["txn_id"]);
            Session["ProductID"] = utils.ToN(Request.Form["item_number"]);

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
            SendBuyerEmail(utils.ToS(Request.Form["payer_email"]), utils.ToS(Request.Form["first_name"]) + " " + utils.ToS(Request.Form["last_name"]), sProduct, OrderID, utils.ToS(Request.Form["txn_id"]), utils.ToS(Request.Form["mc_gross"]), utils.ToS(Request.Form["shipping"]), utils.ToS(Request.Form["quantity"]), sGUID);

        }
        else if (strResponse == "INVALID")
        {
            //string sSQL2 = "Insert Into tShop(Shopname,UserID) Values('Test invalid',1)";

            //utils.RunSQLStringQuery(sSQL2);


            //string uploadPath = Server.MapPath("~/uploads");

            //using (StreamWriter writer =
            //new StreamWriter(Path.Combine(uploadPath, "invalid.txt")))
            //{
            //    foreach (string key in Request.Form.Keys)
            //    {
            //        writer.WriteLine(key + ": " + Request.Form[key] + "\r\n");
            //        //Response.Write(key + ": " + Request.Form[key] + "<br/>");
            //    }

            //}
        }
        else
        {
            //string sSQL2 = "Insert Into tShop(Shopname,UserID) Values('Test something else',1)";

            //utils.RunSQLStringQuery(sSQL2);

            //string uploadPath = Server.MapPath("~/uploads");

            //using (StreamWriter writer =
            //new StreamWriter(Path.Combine(uploadPath, "other.txt")))
            //{
            //    foreach (string key in Request.Form.Keys)
            //    {
            //        writer.WriteLine(key + ": " + Request.Form[key] + "\r\n");
            //        //Response.Write(key + ": " + Request.Form[key] + "<br/>");
            //    }

            //}
        }
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
        //string err = "";
        // }

        // Clean up.
        message.Dispose();
    }

    void SendBuyerEmail(string ToEMail, string ToName, string Product, int OrderID, string PayPalID, string PayAmnt, string ShipAmnt, string Quantity, string GUID)
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
        message.Body = "<h2>Thanks for your purchase on SocialSHOP</h2><p>You will find the payment details in your PayPal account</p><p>Here are your purchase details -</p>" +
            "<p>Product : " + Product + "</p>" +
            "<p>Quantity : " + Quantity + "</p>" +
            "<p>Purchase Amount : $" + PayAmnt + "</p>" +
            "<p>Shipping Amount : $" + ShipAmnt + "</p>" +
            "<p>PayPal Transaction ID :" + PayPalID + "</p>" +
            "<p>You can view your order details by going to <a href=\"" + baseUrl + "order_status.aspx?g=" + GUID + "\">this page here</a></p>" +
            "<p>Or copy and paste this into your browser URL - " + baseUrl + "order_status.aspx?g=" + GUID + "</p>" +
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
        //string err = "";
        // }

        // Clean up.
        message.Dispose();
    }
}