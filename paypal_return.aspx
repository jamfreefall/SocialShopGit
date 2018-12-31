<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="paypal_return.aspx.cs" Inherits="paypal_return" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Thanks for your Purchase on Social Shop</title>

    <link href="css/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblOutput" runat="server" Text="Label"></asp:Label>


        <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Thanks For your purchase
        
      </h1>

    </section>

      <!-- Main content -->
      <section class="content">
          <div class="row">
              <!-- Left col -->
              <section class="col-lg-7">

                  <div class="box box-info">
                      <div class="box-header">
                          <i class="fa fa-gift" aria-hidden="true"></i>


                          <h3 class="box-title">Here is what you bought</h3>
                          <!-- tools box -->
                          <div class="pull-right box-tools">
                          </div>
                          <!-- /. tools -->
                      </div>

                      <div class="box-body">
                          <div class="col-lg-12">
                              
                                <asp:Panel ID="pnlVerify" runat="server">  
                                    <label for="<%= txtPPEmail.ClientID %>">Enter the PayPal email you used for your purchase</label>
                                  <div class="form-group">
                                      <div class="input-group">
                                          
                                          <asp:TextBox ID="txtPPEmail" CssClass="form-control" placeholder="Enter your PayPal email address" runat="server"></asp:TextBox>
                                          <span class="input-group-btn">
                                              <asp:Button ID="btnCheck" CssClass="btn btn-info btn-flat" runat="server" Text="Verify" />
                                            </span>
                                          
                                      </div>

                                </div>
                                 </asp:Panel>

                              <asp:Panel ID="pnlSuccess" runat="server">
                                  <p><b><asp:Label ID="lblProduct" runat="server" Text=""></asp:Label></b></p>
                                  <p><asp:Label ID="lblInfo" runat="server" Text=""></asp:Label></p>
                                   <p><asp:HyperLink ID="hlDownload" Visible="false" CssClass="btn btn-warning" runat="server">Download your file</asp:HyperLink></p>
                              </asp:Panel>



                              <asp:Panel ID="pnlFail" Visible="false" runat="server">
                                    
                                    
                                  <div class="box-body">
                                      <div class="callout callout-danger">
                                        <h4>Well isn't this annoying!</h4>

                                        <p>I couldn't find your purchase information for this product</p>
                                          <p>Try a different email address or check your PayPal account to make sure the payment went through</p>
                                      </div>
                                </div>

                                    
                              </asp:Panel>


                          </div>
                      </div>
                  </div>
              </section>

            <section class="col-lg-5 hide">
                  <div class="box box-info">
                      <div class="box-header">
                          <i class="fa fa-gift" aria-hidden="true"></i>


                          <h3 class="box-title">Other items that may interest you</h3>
                          <!-- tools box -->
                          <div class="pull-right box-tools">
                          </div>
                          <!-- /. tools -->
                      </div>

                      <div class="box-body">
                          <div class="col-lg-12">
                              This is the body
                          </div>
                      </div>
                  </div>
            </section>
          </div>

        <div class="row hide">
              <!-- Left col -->
              <section class="col-lg-9">

                  <div class="box box-info">
                      <div class="box-header">
                          <i class="fa fa-gift" aria-hidden="true"></i>


                          <h3 class="box-title">Thanks For your purchase</h3>
                          <!-- tools box -->
                          <div class="pull-right box-tools">
                          </div>
                          <!-- /. tools -->
                      </div>

                      <div class="box-body">
                          <div class="col-lg-12">
                              This is the body
                          </div>
                      </div>
                  </div>
              </section>

              <section class="col-lg-3">
                  <div class="box box-info">
                      <div class="box-header">
                          <i class="fa fa-gift" aria-hidden="true"></i>


                          <h3 class="box-title">I'm not sure what I'll put in here</h3>
                          <!-- tools box -->
                          <div class="pull-right box-tools">
                          </div>
                          <!-- /. tools -->
                      </div>

                      <div class="box-body">
                          <div class="col-lg-12">
                              This is the body
                          </div>
                      </div>
                  </div>
            </section>
          </div>
      </section>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" Runat="Server">
</asp:Content>

