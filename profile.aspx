<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">

      <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        User Profile
      </h1>
<%--      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">User profile</li>
      </ol>--%>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
                <asp:Image ID="imgProfilePic" CssClass="profile-user-img img-responsive img-circle" ImageUrl="images/user-512.png" AlternateText="Profile Pic" runat="server" />
                
              

              <h3 class="profile-username text-center">
                    <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
              </h3>

              <p class="text-muted text-center">SocialSHOP Legend</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Total Products</b> <a class="pull-right">
                      <asp:Label ID="lblTotalProducts" runat="server" Text=""></asp:Label></a>
                </li>
                <li class="list-group-item">
                  <b>No of Sales</b> <a class="pull-right"><asp:Label ID="lblOrders" runat="server" Text=""></asp:Label></a>
                </li>
                  <li class="list-group-item">
                  <b>Unsent Orders</b> <a class="pull-right"><asp:Label ID="lblUnsentOrders" runat="server" Text=""></asp:Label></a>
                </li>
                <li class="list-group-item">
                  <b>Revenue</b> <a class="pull-right"><asp:Label ID="lblRevenue" runat="server" Text=""></asp:Label></a>
                </li>
                  <li class="list-group-item">
                  <b>Total Product Views</b> <a class="pull-right"><asp:Label ID="lblViews" runat="server" Text=""></asp:Label></a>
                </li>
              </ul>
               <!--<a href="http://www.uptrackapp.com/r/9b107c6564101ba0b1f8">Tracking link</a>-->
              <a href="selling.aspx" class="btn btn-primary btn-block"><b>Sell Something Now</b></a>
                <!--<asp:Button ID="btnEmail" CssClass="btn btn-primary btn-block" runat="server" Text="Email" />
                <asp:Button ID="btnFBLogout" CssClass="btn btn-primary btn-block" runat="server" Text="FB Logout" />-->
                
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">About Me</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> Username/Email</strong>

              <p class="text-muted">
                <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
              </p>

              <hr>

              <strong><i class="fa fa-paypal margin-r-5"></i> PayPal email</strong>  

              <p id="paypalstatic" onmouseover="showPPEdit()" onmouseout="hidePPEdit()" class="text-muted">
                    <asp:Label ID="lblPayPal" runat="server" onclick="editPayPal()" Text="Label"></asp:Label>   <i class="fa fa-pencil margin-r-5 hide" id="ppedit" onclick="editPayPal()"></i><i class="fa fa-pencil margin-r-5 visible-md visible-sm visible-xs" onclick="editPayPal()"></i>
              </p>

                <p id="paypaledit" style="display:none;">
                    <asp:TextBox ID="txtPayPal" autocomplete="off" CssClass="form-control" placeholder="Your PayPal Email" runat="server"></asp:TextBox>
                    <asp:LinkButton ID="btnSavePayPal" CssClass="pull-right" runat="server"><i class="fa fa-save"></i></asp:LinkButton>
                    <a href="#" onclick="return editPayPalCancel()"><i class="fa fa-close pull-left"></i></a>&nbsp;&nbsp;
                    
                </p>

              <hr />

              <strong><i class="fa fa-facebook-official margin-r-5"></i> Facebook</strong> 

              <p id="facebookstatic" onmouseover="showFBEdit()" onmouseout="hideFBEdit()" class="text-muted">
                    <asp:Label ID="lblFacebookPage" onclick="editFacebook()" runat="server" Text=""></asp:Label>  <i class="fa fa-pencil margin-r-5 hide" id="fbedit" onclick="editFacebook()"></i><i class="fa fa-pencil margin-r-5 visible-xs visible-md" onclick="editFacebook()"></i>
              </p>
                <p id="facebookedit" style="display:none;">
                    <asp:TextBox ID="txtFacebook" autocomplete="off" CssClass="form-control" placeholder="Your Facebook Page" runat="server"></asp:TextBox>
                    <asp:LinkButton ID="btnSaveFacebook" CssClass="pull-right" runat="server"><i class="fa fa-save"></i></asp:LinkButton>
                    <a href="#" onclick="editFacebookCancel()"><i class="fa fa-close pull-left"></i></a>
                        
                </p>

              <hr>

              <!--<strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>

              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>-->
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          
            <div class="box box-primary">
            <div class="box-header with-border">
              <i class="fa fa-shopping-cart" aria-hidden="true"></i><h3 class="box-title">Your Products</h3>

              <!-- /.box-tools -->
            </div>

            <div class="box-body">
                <div class="col-md-12">


<asp:Repeater ID="rptProducts" runat="server">
    <HeaderTemplate>
         <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                  <th>Product</th>
                  <th>Price</th>
                  
                  <th>Qty</th>
                    <th>Share</th>
                    <th>Page Views</th>
                    <th>Unique Views</th>
                  <th>View</th>
                </tr>
                </thead>
                <tbody>

    </HeaderTemplate>

    <ItemTemplate>
                <tr>
                    <td><%# Eval("ProductID") %></td>
                  <td><a href='<%# ViewLink(utils.ToS(Eval("myGUID"))) %>'><%# Eval("ProductTitle") %></a></td>
                  <td><%# String.Format("{0:C}", Eval("Price")) %>
                  </td>
                  
                  <td><%# Eval("Quantity") %></td>
                    <td>
                        <div class="btn-group-sm">
                            <a class="btn btn-twitter" target="_blank" href='<%# TwitterLink(utils.ToS(Eval("myGUID"))) %>'><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a class="btn btn-facebook" target="_blank" href='<%# FacebookLink(utils.ToS(Eval("myGUID"))) %>'><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        </div>
                    </td>
                    <td><%# Eval("PageViews") %></td>
                    <td><%# Eval("UniqueViews") %></td>
                  <td><a href='<%# ViewLink(utils.ToS(Eval("myGUID"))) %>'><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                </tr>
    </ItemTemplate>

    <FooterTemplate>
            </tbody>
            </table>
    </FooterTemplate>

</asp:Repeater>
               


                </div>
                </div>
          </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" Runat="Server">

    <!-- jQuery 2.2.3 -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>

    <!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>

    <script type="text/javascript">
     var $t = $.noConflict(true);
    </script>
    <script>
  $t(function () {
    $t('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });

  function editPayPal()
  {
      $('#paypalstatic').hide();
      $('#paypaledit').show();
      return false;
      
  }
  function editPayPalCancel() {
      
      $('#paypaledit').hide();
      $('#paypalstatic').show();
  }

  function editFacebook() {
      $('#facebookstatic').hide();
      $('#facebookedit').show();

  }
  function editFacebookCancel() {

      $('#facebookedit').hide();
      $('#facebookstatic').show();
  }

  function showPPEdit() {
      $('#ppedit').removeClass('hide');
  }
  function hidePPEdit() {
      $('#ppedit').addClass('hide');
  }
  function showFBEdit() {
      $('#fbedit').removeClass('hide');
  }
  function hideFBEdit() {
      $('#fbedit').addClass('hide');
  }
</script>
</asp:Content>

