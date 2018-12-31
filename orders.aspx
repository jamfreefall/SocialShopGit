<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

            <title>Your Orders | Social Shop</title>

    <link href="css/main.css" rel="stylesheet" />
    


      <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap.css">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">


    </section>

      <!-- Main content -->
      <section class="content">
          <div class="row">
              <!-- Left col -->
              <section class="col-sm-12">

                  <div class="box box-info">
                      <div class="box-header">
                          <i class="fa fa-gift" aria-hidden="true"></i>


                          <h3 class="box-title">Your Orders</h3>
                          <!-- tools box -->
                          <div class="pull-right box-tools">
                          </div>
                          <!-- /. tools -->
                      </div>

                      <div class="box-body">
                          <div class="col-sm-12">
                              
                                <asp:Repeater ID="rptOrders" runat="server">
                                    <HeaderTemplate>
                                         <table id="Orders" class="table table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                  <th>Product</th>
                                                    <th>Order Date</th>
                                                  <th>Price</th>
                                                  <th>Shipping</th>
                                                  <th>Quantity</th>
                                                    <th>Option</th>
                                                  <th>Sent</th>
                                                    <th><i class="fa fa-cogs" aria-hidden="true"></i></th>
                                                    
                                                </tr>
                                                </thead>
                                                <tbody>

                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <asp:HiddenField ID="hfID" Value='<%# Eval("OrderID") %>' runat="server" />
                                        <asp:HiddenField ID="hfSent" Value='<%# Eval("isSent") %>' runat="server" />
                                        <asp:HiddenField ID="hfDownload" Value='<%# Eval("isDownload") %>' runat="server" />
                                                <tr>
                                                  <td><%# Eval("ProductName") %></td>
                                                    <td><%# String.Format("{0:dd/MMM/yyyy hh:mm}", Eval("OrderDate")) %></td>
                                                  <td><%# String.Format("{0:C}", Eval("PurchaseAmount")) %>
                                                  </td>
                                                  <td><%# String.Format("{0:C}", Eval("ShipAmount")) %></td>
                                                  <td><%# Eval("Qty") %></td>
                                                    <td><%# Eval("ProductOption") %></td>
                                                  <td><%# SentIcon(Convert.ToBoolean(Eval("isSent"))) %></i></td>
                                                    <td>
                                                        <div class="btn-group btn-flat">
                                                            <asp:LinkButton ID="lbtnSent" CssClass="btn btn-sm btn-primary" CommandName="Sent" CommandArgument='<%# Eval("OrderID") %>' ToolTip="Mark as sent" runat="server"><i class="fa fa-truck" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="lbtnRefunded" CssClass="btn btn-sm btn-primary" CommandName="Refund" ToolTip="Mark as refunded" runat="server"><i class="fa fa-money" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="lbtnView" CssClass="btn btn-sm btn-primary" CommandName="View" CommandArgument='<%# Eval("OrderID") %>' ToolTip="View Order" runat="server"><i class="fa fa-eye" aria-hidden="true"></i></asp:LinkButton>
                                                        </div>



                                                        
                                                        
                                                    </td>
                                                    
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
              </section>


          </div>

          <asp:Panel ID="pnlDetails" Visible="false" runat="server">
          <div class="row">
              <!-- Left col -->
              <section class="col-sm-12">

                  <div class="box box-info">
                      <div class="box-header">
                          <i class="fa fa-barcode" aria-hidden="true"></i>


                          <h3 class="box-title">Order Details</h3>
                          <!-- tools box -->
                          <div class="pull-right box-tools">
                          </div>
                          <!-- /. tools -->
                      </div>

                      <div class="box-body">
                         

                              <asp:Repeater ID="rptOrderDetails" runat="server">
                                <ItemTemplate>
                                        
                                  <div class="col-sm-4">
                                      <div class="form-group">
                                                  <label>Order No</label>

                                                  <div>
                                                      <%# Eval("OrderID") %>
                                                  </div>
                                              </div>
                                      </div>

                                    <div class="col-sm-4">
                                        <div class="form-group">
                                                  <label>PayPal Trans ID</label>

                                                  <div>
                                                      <%# Eval("PayPalID") %>
                                                  </div>
                                              </div>
                                      </div>

                                    <div class="col-sm-4">
                                        <div class="form-group">
                                                  <label>Buy Date</label>

                                                  <div>
                                                      <%# Eval("OrderDate") %>
                                                  </div>
                                              </div>
                                        </div>
                                     

                                      <div class="col-sm-4">
                                              <div class="form-group">
                                                  <label>Product</label>

                                                  <div>
                                                      <%# Eval("ProductName") %>
                                                      
                                                  </div>
                                              </div>
                                          </div>
                                    <div class="col-sm-4">
                                              <div class="form-group">
                                                  <label>Paid Amount</label>

                                                  <div>
                                                      <%# String.Format("{0:C}", Eval("PurchaseAmount")) %> + <%# String.Format("{0:C}", Eval("ShipAmount")) %> shipping
                                                  </div>
                                              </div>
                                        </div>
                                            
                                    <div class="col-sm-4">
                                              <div class="form-group">
                                                  <label>Shipping Method</label>

                                                  <div>
                                                      <%# Eval("ShippingOption") %>
                                                  </div>
                                              </div>
                                        </div>
                                      <div class="col-sm-12">
                                              <div class="form-group">
                                                  <label>Product Option (where applicable)</label>

                                                  <div>
                                                      <%# Eval("ProductOption") %>
                                                  </div>
                                              </div>
                                        </div>
                                          
                                    <div class="col-sm-12">
                                              <div class="form-group">
                                                  <label>Name</label>

                                                  <div>
                                                      <%# Eval("Firstname") %>  <%# Eval("Lastname") %>
                                                  </div>
                                              </div>
                                        </div>
                                           <div class="col-sm-12">
                                              <div class="form-group">
                                                  <label>Address</label>

                                                  <div>
                                                      <%# Eval("Address") %> 
                                                  </div>
                                              </div>
                                        </div>   
                                         <div class="col-sm-12">
                                              <div class="form-group">
                                                  <label>Suburb</label>

                                                  <div>
                                                      <%# Eval("Suburb") %>
                                                  </div>
                                              </div>
                                        </div> 

                                    <div class="col-sm-12">
                                              <div class="form-group">
                                                  <label>State, Post Code</label>

                                                  <div>
                                                      <%# Eval("State") %>,<%# Eval("Postcode") %> 
                                                  </div>
                                              </div>
                                        </div> 
                                    <div class="col-sm-12">
                                              <div class="form-group">
                                                  <label>Country</label>

                                                  <div>
                                                      <%# Eval("Country") %>
                                                  </div>
                                              </div>
                                        </div> 
                              </ItemTemplate>
                                </asp:Repeater>
                                    


                                



                              


                          
                      </div>
                  </div>
              </section>


          </div>
          </asp:Panel>


      </section>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" Runat="Server">

    <!-- jQuery 2.2.3 -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>



<!-- page script -->
<script>
    $(function () {
        
    $('#Orders').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>

</asp:Content>

