using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbtnSignUp.Click += LbtnSignUp_Click;
    }

    private void LbtnSignUp_Click(object sender, EventArgs e)
    {
        SqlParameter[] oParams = {
                    new SqlParameter("@Email", utils.ToS(txtEmail.Text)),
                        };
        utils.ReturnNoDataset(oParams, "sp_Insert_InviteList");

        pnlSignUp.Visible = false;
        litSignUp.Visible = true;
    }
}