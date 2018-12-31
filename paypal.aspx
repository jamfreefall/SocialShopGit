<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paypal.aspx.cs" Inherits="paypal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">

      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
      <!-- Bootstrap 3.3.6 -->
      <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
      <!-- Font Awesome -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />

    <link rel="stylesheet" href="dist/css/AdminLTE.min.css" />
      <!-- AdminLTE Skins. Choose a skin from the css/skins
           folder instead of downloading all of them to reduce the load. -->
      <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css" />

    <title>Sending you to PayPal</title>
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
</head>
<body>
    <div class="wrapper">
    <div class="row">
        <div class="col-sm-12 text-center">
            <h1>Won't be a sec, sending you to</h1>
        </div>
        <div class="col-sm-12">
            <img class="img-responsive center-block" src="images/paypal-logo.png" />
        </div>
    </div>
        </div>
    <form id="frmmain" action="https://www.paypal.com/cgi-bin/webscr" method="post" runat="server">
            <asp:HiddenField ID="cmd" Value="_xclick" runat="server" />
            <asp:HiddenField ID="amount" Value="" runat="server" />
            <asp:HiddenField ID="item_name" Value="" runat="server" />
            <asp:HiddenField ID="item_number" Value="" runat="server" />
            <asp:HiddenField ID="currency_code" Value="" runat="server" />
            <asp:HiddenField ID="invoice" Value="" runat="server" />
            <asp:HiddenField ID="business" Value="" runat="server" />
            <asp:HiddenField ID="shipping" Value="" runat="server" />
            <asp:HiddenField ID="tax" Value="" runat="server" />
            <asp:HiddenField ID="return" Value="" runat="server" />
            <asp:HiddenField ID="cancel_return" Value="" runat="server" />
            <asp:HiddenField ID="cbt" Value="Return to Social Shop" runat="server" />
            <asp:HiddenField ID="quantity" Value="" runat="server" />
        <asp:HiddenField ID="no_shipping" Value="1" runat="server" />
        <asp:HiddenField ID="image_url" Value="http://www.socialshop.com.au/images/paypal-header.png" runat="server" />
        <asp:HiddenField ID="rm" Value="2" runat="server" />
        <asp:HiddenField ID="notify_url" Value="" runat="server" />
        <asp:HiddenField ID="custom" Value="" runat="server" />
        <asp:HiddenField ID="on0" Value="" runat="server" />
        <asp:HiddenField ID="os0" Value="" runat="server" />
    </form>
    <script>
        $(window).load(
     
            $("#frmmain").submit()
        
    );
    </script>

        <!-- Bootstrap 3.3.6 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
