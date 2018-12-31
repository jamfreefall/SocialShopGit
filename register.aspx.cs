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
using System.Net.Mime;
using System.Threading;
using System.ComponentModel;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        btnRegister.Click += BtnRegister_Click;
    }

    private void BtnRegister_Click(object sender, EventArgs e)
    {
        try
        {
            

            if (FormValidate())
            {

                if (utils.ToN(Session["ClientID"]) > 0)
                {
                    SqlParameter[] oParams = {
                        new SqlParameter("@FirstName", utils.PCase(txtFName.Text)),
                        new SqlParameter("@LastName", utils.ToS(utils.PCase(txtLName.Text))),
                        new SqlParameter("@Email", txtEmail.Text),
                        new SqlParameter("@ClientID", utils.ToN(Session["ClientID"])),
                        new SqlParameter("@Password", txtPassword.Text),
                        };
                    DataSet ds = utils.ReturnDataset(oParams, "sp_Update_Client");
                    string PwdGUID = utils.ToS(ds.Tables[0].Rows[0]["guid"]);

                    if (PwdGUID.Length > 0)
                    {
                        //Session["ClientID"] = ClientID;
                        Session["ClientName"] = utils.PCase(txtFName.Text);

                        //Guid g = Guid.NewGuid();
                        //string RandomPwd = g.ToString();// utils.HashPassword(txtFName.Text);
                        //RandomPwd = utils.Right(RandomPwd, 10); // we'll shorten the random password a bit (well to 10 chars)
                        string pwd = utils.HashPassword(txtPassword.Text + PwdGUID);

                        utils.RunSQLStringQuery("Update tUser Set Password = '" + pwd + "' where UserID = " + utils.ToN(Session["ClientID"]));

                        SendEmail(txtEmail.Text, txtFName.Text + " " + txtLName.Text, "email@internetdogwhisperer.net", "Jeff from Online Dog Whisperer", txtPassword.Text);
                        //Response.Redirect("dog-details.aspx");
                        Response.Redirect("sell2.aspx");
                    }
                    else
                    {
                        txtEmail.BorderColor = System.Drawing.Color.Red;
                        pnlError.Visible = true;
                    }
                }
                else
                {
                    SqlParameter[] oParams = {
                        new SqlParameter("@FirstName", utils.PCase(txtFName.Text)),
                        new SqlParameter("@LastName", utils.ToS(utils.PCase(txtLName.Text))),
                        new SqlParameter("@ClientEmail", txtEmail.Text),
                        new SqlParameter("@Password", txtPassword.Text),
                        };
                    DataSet ds = utils.ReturnDataset(oParams, "sp_Insert_Client");

                    int ClientID = utils.ToN(ds.Tables[0].Rows[0]["ID"]);

                    if (ClientID > 0)
                    {
                        Session["ClientID"] = ClientID;
                        Session["ClientName"] = utils.PCase(txtFName.Text);


                        string PwdGUID = utils.ToS(ds.Tables[1].Rows[0]["guid"]);
                        //Guid g = Guid.NewGuid();
                        //string RandomPwd = g.ToString();// utils.HashPassword(txtFName.Text);
                        //RandomPwd = utils.Right(RandomPwd, 10); // we'll shorten the random password a bit (well to 10 chars)
                        string pwd = utils.HashPassword(txtPassword.Text + PwdGUID);

                        utils.RunSQLStringQuery("Update tUser Set Password = '" + pwd + "' where UserID = " + ClientID);

                        SendEmail(txtEmail.Text, txtFName.Text + " " + txtLName.Text, "email@internetdogwhisperer.net", "Jeff from Online Dog Whisperer", txtPassword.Text);
                        //Response.Redirect("dog-details.aspx");
                        Response.Redirect("sell2.aspx");
                    }
                    else
                    {

                        txtEmail.BorderColor = System.Drawing.Color.Red;
                        pnlError.Visible = true;
                    }
                }


            }
        }
        catch
        {
            txtEmail.BorderColor = System.Drawing.Color.Red;
            pnlError.Visible = true;
        }
    }

    Boolean FormValidate()
    {
        bool ret = true;
        txtFName.Text = txtFName.Text.Replace(" ", "");
        txtEmail.Text = txtEmail.Text.Replace(" ", "");
        txtPassword.Text = txtPassword.Text.Replace(" ", "");

        lblValidationMSG.Text = "Please scroll up and make sure you have filled in the fields in red";
        if (txtFName.Text.Length == 0)
        {
            txtFName.BorderColor = System.Drawing.Color.Red;
            ret = false;
        }
        else
        {
            txtFName.BorderColor = System.Drawing.Color.Empty;
        }

        if (txtEmail.Text.Length == 0)
        {
            txtEmail.BorderColor = System.Drawing.Color.Red;
            ret = false;
        }
        else
        {
            txtEmail.BorderColor = System.Drawing.Color.Empty;
        }


        bool ValidEmail = IsValidEmail(txtEmail.Text);

        if (ValidEmail)
        {
            txtEmail.BorderColor = System.Drawing.Color.Empty;
        }
        else
        {
            txtEmail.BorderColor = System.Drawing.Color.Red;
            ret = false;
        }

        if (txtPassword.Text.Length < 6)
        {
            txtPassword.BorderColor = System.Drawing.Color.Red;
            lblValidationMSG.Text += "<br />Make sure your password is at least 6 characters in length";
            ret = false;
        }
        else
        {
            txtPassword.BorderColor = System.Drawing.Color.Empty;
        }

        if (txtPassword.Text != txtPassword2.Text)
        {
            txtPassword2.BorderColor = System.Drawing.Color.Red;
            lblValidationMSG.Text += "<br />Make sure your password confirmation matches your password";
            ret = false;
        }
        else
        {
            txtPassword2.BorderColor = System.Drawing.Color.Empty;
        }

        if(chkTerms.Checked == false)
        {
            chkTerms.BorderColor = System.Drawing.Color.Red;
            lblValidationMSG.Text += "<br />You need to agree to the terms";
            ret = false;
        }
        else
        {
            chkTerms.BorderColor = System.Drawing.Color.Empty;
        }

        if (ret == false)
        {
            pnlValidation.Visible = true;
        }
        else
        {
            pnlValidation.Visible = false;
        }
        return ret;
    }

    bool IsValidEmail(string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }
    }

    void SendEmail(string sToEmail, string sToName, string sFromEmail, string sFromName, string sPassword)
    {
        string sReplyTo = "email@internetdogwhisperer.net";

        // Command line argument must the the SMTP host.
        SmtpClient client = new SmtpClient();
        client.Host = "mail.internetdogwhisperer.net";
        client.EnableSsl = false;
        System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
        NetworkCred.UserName = "email@internetdogwhisperer.net";
        NetworkCred.Password = "gSztv9I1Hq2VJ1VZRN4$";
        client.Credentials = NetworkCred;
        client.Port = 25;
        //client.Send(message);
        // Specify the e-mail sender. 
        // Create a mailing address that includes a UTF8 character 
        // in the display name.
        MailAddress from = new MailAddress(sFromEmail, sFromName, System.Text.Encoding.UTF8);
        // Set destinations for the e-mail message.
        MailAddress to = new MailAddress(sToEmail, sToName);
        // Specify the message content.
        MailMessage message = new MailMessage(from, to);

        //message.Attachments.Add(new Attachment(Server.MapPath("~/invoice/" + InvoiceID.ToString() + ".pdf")));
        message.Body = "<h2>Thanks for signing up on socialshop.com.au</h2><p>A password has been created for you so you can log in to the website at any time.</p><p>Your password is <b>" + sPassword + "</b></p>";
        // Include some non-ASCII characters in body and subject. 
        //string someArrows = new string(new char[] { '\u2190', '\u2191', '\u2192', '\u2193' });
        //message.Body += Environment.NewLine + someArrows;
        message.IsBodyHtml = true;
        message.BodyEncoding = System.Text.Encoding.UTF8;
        message.Subject = "Your password for socialshop.com.au";
        message.SubjectEncoding = System.Text.Encoding.UTF8;
        message.ReplyToList.Add(sReplyTo);
        try
        {
            client.Send(message);


        }
        catch
        {
            // oh no an error
            pnlError.Visible = true;
        }

        // Clean up.
        message.Dispose();
    }
}