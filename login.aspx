<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Social SHOP | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">

    <a href="../../index2.html"><b>Social</b>SHOP</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start selling</p>

    <form runat="server">
      <div class="form-group has-feedback">
          <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>
        
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
        
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <!--<label>
            <asp:CheckBox ID="chkRemember" runat="server" />
              Remember me
            </label>-->
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          
            <asp:Button ID="btnSignIn" CssClass="btn btn-primary btn-block btn-flat" runat="server" Text="Sign In" />
        </div>
        <!-- /.col -->
      </div>
              <asp:Panel ID="pnlError" Visible="false" runat="server">
                    <div class="row">
              <div class="col-md-12">
                <div class="box-body">
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h4><i class="icon fa fa-ban"></i>Alert!</h4>
                        Oops!!<br />I couldn't find that username and password combination
                    </div>
                </div>
            </div>

          </div>
          </asp:Panel>

    

    <!--<div class="social-auth-links text-center">
      <p>- OR -</p>
        <asp:LinkButton ID="lbtnFacebook" CssClass="btn btn-block btn-social btn-facebook btn-flat" runat="server"><i class="fa fa-facebook"></i> Sign in using
        Facebook</asp:LinkButton>

        <asp:LinkButton ID="lbtnGoogle" CssClass="btn btn-block btn-social btn-google btn-flat" runat="server"><i class="fa fa-google-plus"></i>Sign in using Google+</asp:LinkButton>
     
    </div>-->
    <!-- /.social-auth-links -->
        </form>
    <a href="#">I forgot my password</a><br>
    <a href="register.aspx" class="text-center">Register a new membership</a>

  </div>

  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>

