<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
          <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      
      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
      <!-- Bootstrap 3.3.6 -->
      <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
      <!-- Ionicons -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <title>Social Shop - Sell Socially</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
    <div class="row text-center">
        <div class="col-sm-12">
            <img class="img-responsive center-block" src="images/holder.png" />
            
        </div>
        <div class="col-sm-12">
           <h2> <b>Social</b>SHOP is currently open to invitees only in this pre-launch stage.<br /><br /><br />
            Would you like to get an invite to be one of the first to use <b>Social</b>SHOP? Fill out the form below...</h2>
            </div>
    </div>

        <div class="row">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                
            <asp:Panel ID="pnlSignUp" runat="server">
                <div class="col-sm-12 col-md-10 text-right"> 
                    <asp:TextBox ID="txtEmail" CssClass="input-lg col-md-10" placeholder="your email address" aria-describedby="basic-addon2" runat="server"></asp:TextBox>
                    
                            
                </div> 
                <div class="col-sm-12 col-md-2">
                    <asp:LinkButton ID="lbtnSignUp" CssClass="btn btn-info btn-block btn-lg" runat="server">go <i class="glyphicon glyphicon-chevron-right"></i></asp:LinkButton>
                </div>
            </asp:Panel>
                <div class="col-sm-12"> 
                    <asp:Literal ID="litSignUp" Visible="false" runat="server"><h1 class="text-success">Thanks for signing up, you have gone on the invite list</h1></asp:Literal>
                                       
                </div>                        
                         
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
            </div>
    </form>
</body>
</html>
