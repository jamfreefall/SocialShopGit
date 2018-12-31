<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Social SHOP | Registration Page</title>
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
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <b>Social</b>SHOP
  </div>
    <form runat="server" id="frmMain">
  <div class="register-box-body">
    <p class="login-box-msg">Register new membership</p>


      <div class="form-group has-feedback">
        
        <asp:TextBox ID="txtFName" CssClass="form-control" placeholder="First name" runat="server"></asp:TextBox>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
    <div class="form-group has-feedback">
        
        <asp:TextBox ID="txtLName" CssClass="form-control" placeholder="Last name" runat="server"></asp:TextBox>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        
          <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
        
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <asp:TextBox ID="txtPassword2" CssClass="form-control" TextMode="Password" placeholder="Retype Password" runat="server"></asp:TextBox>
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
<asp:CheckBox ID="chkTerms" Text="I agree to the <a target='_blank' href='terms.aspx'>terms</a>" runat="server" />
              
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
            <asp:Button ID="btnRegister" CssClass="btn btn-primary btn-block btn-flat" runat="server" Text="Register" />
          
        </div>
        <!-- /.col -->
      </div>

      <asp:Panel ID="pnlValidation" Visible="false" runat="server">
          <div class="row">
              <div class="col-md-12">
                <div class="box-body">
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h4><i class="icon fa fa-ban"></i>Alert!</h4>
                        <asp:Label ID="lblValidationMSG" runat="server" Text=""></asp:Label>

                    </div>
                </div>
            </div>
        </div>

          

    </asp:Panel>
      <asp:Panel ID="pnlError" Visible="false" runat="server">
                    <div class="row">
              <div class="col-md-12">
                <div class="box-body">
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h4><i class="icon fa fa-ban"></i>Alert!</h4>
                        Oops that email address is already being used. You'll have to try again.
                    </div>
                </div>
                    </div>

          </div>
          </asp:Panel>

    <!--<div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using
        Google+</a>
    </div>-->

    <a href="login.aspx" class="text-center">I already have a membership</a>
  </div>
        </form>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

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
