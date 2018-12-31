<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-All.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="sell2.aspx.cs" Inherits="sell2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Sell Stuff on Social Shop</title>
    <link href="css/jquery.gritter.css" rel="stylesheet" />
        <link href="css/cropper.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row hidden-md hidden-sm hidden-xs">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>150</h3>

              <p>New Orders</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>53<sup style="font-size: 20px">%</sup></h3>

              <p>Bounce Rate</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>

              <p>User Registrations</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65</h3>

              <p>Unique Visitors</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      <!-- Main row -->

        

            
      <div class="row">
        <!-- Left col -->
        <section class="col-lg-7 connectedSortable">
          <!-- Custom tabs (Charts with tabs)-->
          
          <!-- /.nav-tabs-custom -->


          <!-- Main widget -->
            <asp:Panel ID="pnlProduct" runat="server">
          <div class="box box-info">
            <div class="box-header">
                <i class="fa fa-gift" aria-hidden="true"></i>
              

              <h3 class="box-title">What do you want to sell?</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                
              </div>
              <!-- /. tools -->
            </div>

              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <Triggers><asp:PostBackTrigger ControlID="lbtnSave" /></Triggers>
            <ContentTemplate>
            <div class="box-body">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="txtProductName">What is the name of your product?</label>
                        <asp:TextBox ID="txtProductName" autocomplete="off" CssClass="form-control" placeholder="eg. Yellow Teapot" runat="server"></asp:TextBox>
                  
                    </div>
                </div>
                <div class="col-md-6">

                    <div class="form-group">
                        <label for="txtPrice">How much are you selling it for?</label>

                        <div class="input-group">
                          <span class="input-group-addon" id="sizing-addon2">$</span>
                      
                            <asp:TextBox ID="txtPrice" autocomplete="off" CssClass="form-control" placeholder="eg. 2.50" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>



                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="txtDescription">Tell us about your product</label>
                        <asp:TextBox ID="txtDescription" CssClass="form-control" TextMode="MultiLine" Width="100%" Height="125" runat="server"></asp:TextBox>
                      
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="txtDownloadLink">Is this is a digital download product?</label><br />
                        <p>
                        <asp:RadioButton ID="rbDigital" GroupName="DigiDownload" Text="Yes it is" AutoPostBack="true" runat="server" /></p>
                        <p><asp:RadioButton ID="rbNonDigital" GroupName="DigiDownload" Text="No it's not" AutoPostBack="true" runat="server" /></p>
                        
                        <asp:TextBox ID="txtDownloadLink" CssClass="form-control" placeholder="The full url for your download file" runat="server"></asp:TextBox>
                      
                    </div>
                </div>

                <asp:Panel ID="pnlShipping" Visible="false" runat="server">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="txtPrice">What shipping options do you provide?</label>
                

                        <asp:Repeater ID="rptShippingOptions" runat="server">
                            <ItemTemplate>
                               <div class="col-xs-12"> 
                                    <div class="col-xs-12 col-md-4">
                                        <asp:CheckBox ID="chkOption" Text='<%# Eval("OptionName") %>' runat="server" /><asp:Literal ID="litOptionID" Text='<%# Eval("OptionID") %>' Visible="false" runat="server"></asp:Literal>
                                    </div>

                                    <div class="col-xs-12 col-md-8">
                                        <div class="form-group">
                        
                        
                                            <div class="input-group">
                            
                                              <span class="input-group-addon" id="sizing-addon2">$</span>
                      
                                                <asp:TextBox ID="txtShipping" autocomplete="off" CssClass="form-control" placeholder="how much?" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                               </div>

                            </ItemTemplate>

                        </asp:Repeater>
                    </div>
                </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>

          </div>
                
<section class="col-lg-12 connectedSortable">

<div class="box box-warning">
            <div class="box-header with-border">
              <i class="fa fa-photo" aria-hidden="true"></i><h3 class="box-title">Images</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              
                <div class="col-lg-12" id="ScrollHere">
                    <div class="form-group">
                        <label for="txtImage">You'll need a good image of your product - choose it here. In fact it is best to have 3 images - 1 for this site, 1 for Facebook and 1 for Twitter. Let's get to it</label>
                        

                        <label class="btn btn-app btn-lg" for="inputImage" title="Upload image file">
                            <input class="hide" id="inputImage" name="file" type="file" accept="image/*" />
                            <i class="fa fa-arrow-circle-o-up"></i> Upload
                            
                        </label>
                        
                    </div>
                    
                </div>



                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                    <div class="btn-group">
                        <button class="btn btn-primary btn-lg" data-method="zoom" data-option="0.1" type="button" title="Zoom In">
                            <span class="docs-tooltip" data-toggle="tooltip">
                                <span class="glyphicon glyphicon-zoom-in"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary btn-lg" data-method="zoom" data-option="-0.1" type="button" title="Zoom Out">
                            <span class="docs-tooltip" data-toggle="tooltip">
                                <span class="glyphicon glyphicon-zoom-out"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary btn-lg" data-method="rotate" data-option="-90" type="button" title="Rotate Left">
                            <span class="docs-tooltip" data-toggle="tooltip">
                                <span class="glyphicon glyphicon-share-alt docs-flip-horizontal"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary btn-lg" data-method="rotate" data-option="90" type="button" title="Rotate Right">
                            <span class="docs-tooltip" data-toggle="tooltip">
                                <span class="glyphicon glyphicon-share-alt"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary btn-lg" data-method="setDragMode" data-option="move" type="button" title="Move">
                            <span class="docs-tooltip" data-toggle="tooltip">
                                <span class="glyphicon glyphicon-move"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary btn-lg" data-method="setDragMode" data-option="crop" type="button" title="Crop">
                            <span class="docs-tooltip" data-toggle="tooltip">
                                <span class="glyphicon glyphicon-plus"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary btn-lg" data-method="clear" type="button" title="Clear">
                            <span class="docs-tooltip" data-toggle="tooltip">
                                <span class="glyphicon glyphicon-remove"></span>
                            </span>
                        </button>
                        
                        <button class="btn btn-default btn-lg" id="NormalRatio" type="button" title="Landscape cropping">
                          <span class="docs-tooltip" data-toggle="tooltip" title="Landscape cropping">
                            <span class="glyphicon glyphicon-resize-horizontal"></span>
                          </span>
                        </button> 

                        <button class="btn btn-default btn-lg" id="PortraitRatio" type="button" title="Portrait cropping">
                          <span class="docs-tooltip" data-toggle="tooltip" title="Portrait cropping">
                            <span class="glyphicon glyphicon-resize-vertical"></span>
                          </span>
                        </button> 
                    </div>
                </div>


                
                <div class="col-xs-12">
                    
                    <div class="img-container">

                        <img src="images/holder.png" />

                    </div>

                    <textarea class="form-control hide" runat="server" id="dataURLInto" rows="8"></textarea>
                    <textarea class="form-control hide" runat="server" id="fbBase64" rows="8"></textarea>
                    <textarea class="form-control hide" runat="server" id="TwitterBase64" rows="8"></textarea>
                    <textarea class="form-control hide" runat="server" id="PortraitBase64" rows="8"></textarea>


                    <div class="row text-center">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <button class="btn btn-app btn-block" id="getDataURL5" data-toggle="tooltip" type="button" title="Save Selection"><i class="fa fa-crop"></i>Keep Selection</button>
                            <button class="btn btn-app btn-block hide" id="saveFBImage" data-toggle="tooltip" type="button" title="Save Selection"><i class="fa fa-crop"></i>Keep FB Image</button>
                            <button class="btn btn-app btn-block hide" id="saveTwitterImage" data-toggle="tooltip" type="button" title="Save Selection"><i class="fa fa-crop"></i>Keep Twitter Image</button>
                            <button class="btn btn-app btn-block hide" id="savePortraitImage" data-toggle="tooltip" type="button" title="Save Selection"><i class="fa fa-crop"></i>Keep Selection</button>


                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                            <h3>Preview:</h3>

                            

                            <input id="FacebookRatio" class="btn btn-primary hide" type="button" value="Facebook" />
                            <input id="TwitterRatio" class="btn btn-primary hide" type="button" value="Twitter" />
                        </div>
                        
                    </div>

                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12" id="imgNormalImage"></div>
                        <div class="col-lg-4 col-md-4 col-sm-12" id="imgFacebookImage"></div>
                        <div class="col-lg-4 col-md-4 col-sm-12" id="imgTwitterImage"></div>
                    </div>

                </div>


                



            
            <!-- /.box-body -->
          </div>
    </div>
</section>

<section class="col-lg-12 connectedSortable">

<div class="box box-navy">
            <div class="box-header with-border">
              <i class="fa fa-info-circle" aria-hidden="true"></i><h3 class="box-title"> Optional Extras</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="col-lg-12">
                    



                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                          <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              Option 1 - Sell Multiple quantities
                            </a>
                          </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                          <div class="panel-body">
                            <label for="txtQuantity">How many are you selling?</label>
                            
                              <asp:DropDownList CssClass="form-control" ID="ddlQty" runat="server">
                                            <asp:ListItem Selected="True">1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>
                          </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                          <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                              Option 2 - Image Gallery
                            </a>
                          </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                          <div class="panel-body">
                              <input id="Button1" onclick="trythis()" type="button" value="button" />
                              [upload area]
                          </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                          <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              Option 3 - Add multiple sizes/colours
                            </a>
                          </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                          <div class="panel-body">
                              <label for="txtOptions">What are your different options? <em>hint: you can have up to 5 options eg. S,M,L,XL,XXL</em></label>
                              <div class="form-horizontal">
                              <div class="form-group">
                                    <label for="txtOptions" class="col-sm-2 control-label">Option 1</label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtOption1" autocomplete="off" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                  <label for="txtOpt1Qty" class="col-sm-2 control-label">Quantity</label>
                                    <div class="col-sm-4">
                                        <asp:DropDownList CssClass="form-control" ID="ddlOpt1Qty" runat="server">
                                            <asp:ListItem Selected="True">1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
</div>
                            <div class="form-group">
                                  <label for="txtOptions" class="col-sm-2 control-label">Option 2</label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtOption2" autocomplete="off" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                  <label for="txtOpt1Qty" class="col-sm-2 control-label">Quantity</label>
                                    <div class="col-sm-4">
                                        <asp:DropDownList CssClass="form-control" ID="ddlOpt2Qty" runat="server">
                                            <asp:ListItem Selected="True">1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            <div class="form-group">
                                  <label for="txtOptions" class="col-sm-2 control-label">Option 3</label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtOption3" autocomplete="off" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                  <label for="txtOpt1Qty" class="col-sm-2 control-label">Quantity</label>
                                    <div class="col-sm-4">
                                        <asp:DropDownList CssClass="form-control" ID="ddlOpt3Qty" runat="server">
                                            <asp:ListItem Selected="True">1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                            </div>

                            <div class="form-group">
                                  <label for="txtOptions" class="col-sm-2 control-label">Option 4</label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtOption4" autocomplete="off" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                  <label for="txtOpt1Qty" class="col-sm-2 control-label">Quantity</label>
                                    <div class="col-sm-4">
                                        <asp:DropDownList CssClass="form-control" ID="ddlOpt4Qty" runat="server">
                                            <asp:ListItem Selected="True">1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                            </div>

                            <div class="form-group">
                                  <label for="txtOptions" class="col-sm-2 control-label">Option 5</label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtOption5" autocomplete="off" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                  <label for="txtOpt1Qty" class="col-sm-2 control-label">Quantity</label>
                                    <div class="col-sm-4">
                                        <asp:DropDownList CssClass="form-control" ID="ddlOpt5Qty" runat="server">
                                            <asp:ListItem Selected="True">1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                            </div>

                            </div>
                            
                            

                              
                          </div>
                        </div>
                      </div>
                    </div>










                </div>

            </div>
    </div>
    </section>

<section class="col-lg-12 connectedSortable">

<div class="box box-navy">
            <div class="box-header with-border">
              <i class="fa fa-flag-checkered" aria-hidden="true"></i><h3 class="box-title">Ready To Sell</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="col-lg-12">
                    <div class="box-footer clearfix">
                         <asp:LinkButton ID="lbtnSave" CssClass="pull-right btn btn-app" runat="server"> <i class="fa fa-save"></i> Save</asp:LinkButton>

                    </div>
                </div>
            </div>

</div>
                </section>

            </asp:Panel>

            <asp:Panel ID="pnlError" Visible="false" runat="server">
                <div class="col-md-12">
                <div class="box-body">
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h4><i class="icon fa fa-ban"></i>Alert!</h4>
                        Oops there were some things that need fixing before I can save. <br />Scroll up the page and you'll see the things that need fixing with a red box around them.
                    </div>
                </div>
                    </div>
            </asp:Panel>

            <asp:Panel ID="pnlSocialLink" Visible="false" runat="server">
            <div class="col-md-12">
          
                
                <div class="callout callout-success">
                <h4>Here is your unique link</h4>

                <p>All you have to do is copy and paste the link to Facebook, Twitter, Pinterest</p>
                    
                    <h2><asp:Label ID="lblSocialLink" runat="server" Text="http://www.socialshop.com.au/product.aspx?gid=dcvhfkjdcvgbjk"></asp:Label></h2>
                    <p><asp:HyperLink ID="hlTweetLink" CssClass="btn btn-twitter" runat="server">Tweet Your Product</asp:HyperLink></p>
                    
                    
              </div>
                
            </div>
            </asp:Panel>
        </section>



          


        <!-- /.Left col -->
        <!-- right col (We are only adding the ID to make the widgets sortable)-->
        <section class="col-lg-5 connectedSortable">

          <!-- Your Products box -->
          <div class="box box-solid bg-red-gradient">
            <div class="box-header">
              <!-- tools box -->
              

              <i class="fa fa-map-marker"></i>

              <h3 class="box-title">
                Your Products
              </h3>
            </div>
            <div class="box-body">
                <div class="img-preview img-preview-sm"></div>

                <asp:GridView ID="gvProducts" CssClass="table table-striped table-condensed table-hover table-responsive black-font" ForeColor="Black" Width="100%" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ProductTitle" HeaderText="Product" SortExpression="ProductTitle" />
                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" SortExpression="Price" >
<ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Shipping" HeaderText="Shipping" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" SortExpression="Shipping" >
<ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-HorizontalAlign="Center" SortExpression="Quantity" >
                        
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="View">
                            <ItemTemplate>
                                
                                <a href='<%# ViewLink(utils.ToS(Eval("myGUID"))) %>'><i class="fa fa-eye" aria-hidden="true"></i></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductTitle], [Price], [Quantity], [Shipping] FROM [tProduct] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="ClientID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

          </div>
          <!-- /.box -->

          <!-- solid sales graph -->
          <div class="box box-solid bg-yellow-gradient">
            <div class="box-header">
              <i class="fa fa-th"></i>

              <h3 class="box-title">Sales Graph</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn bg-yellow btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                
              </div>
            </div>
            <div class="box-body border-radius-none">
              <div class="chart" id="line-chart" style="height: 250px;"></div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer no-border">
              <div class="row">
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <input type="text" class="knob" data-readonly="true" value="20" data-width="60" data-height="60" data-fgColor="#39CCCC">

                  <div class="knob-label">Mail-Orders</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <input type="text" class="knob" data-readonly="true" value="50" data-width="60" data-height="60" data-fgColor="#39CCCC">

                  <div class="knob-label">Online</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center">
                  <input type="text" class="knob" data-readonly="true" value="30" data-width="60" data-height="60" data-fgColor="#39CCCC">

                  <div class="knob-label">In-Store</div>
                </div>
                <!-- ./col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->

          <!-- Calendar -->
          <div class="box box-solid bg-green-gradient">
            <div class="box-header">
              <i class="fa fa-calendar"></i>

              <h3 class="box-title">Calendar</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <!-- button with a dropdown -->
                <div class="btn-group">
                  <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-bars"></i></button>
                  <ul class="dropdown-menu pull-right" role="menu">
                    <li><a href="#">Add new event</a></li>
                    <li><a href="#">Clear events</a></li>
                    <li class="divider"></li>
                    <li><a href="#">View calendar</a></li>
                  </ul>
                </div>
                <button type="button" class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <!--The calendar -->
              <div id="calendar" style="width: 100%"></div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-black">
              <div class="row">
                <div class="col-sm-6">
                  <!-- Progress bars -->
                  <div class="clearfix">
                    <span class="pull-left">Task #1</span>
                    <small class="pull-right">90%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 90%;"></div>
                  </div>

                  <div class="clearfix">
                    <span class="pull-left">Task #2</span>
                    <small class="pull-right">70%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                  <div class="clearfix">
                    <span class="pull-left">Task #3</span>
                    <small class="pull-right">60%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 60%;"></div>
                  </div>

                  <div class="clearfix">
                    <span class="pull-left">Task #4</span>
                    <small class="pull-right">40%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 40%;"></div>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.box -->

        </section>
        <!-- right col -->
      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" Runat="Server">
    <!-- Uploadify for uploading files -->
     

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- this line kills the admin functionality from working but is essential for image cropping -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
    <script src="https://fengyuanchen.github.io/js/common.js"></script>
    <script src="js/cropper.min.js"></script>
    <script type="text/javascript">
     var $cropper = $.noConflict(true);
    </script>
    <script src="js/social-crop.js"></script>

    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">google.load('jquery', '1.7.1');</script>

    <script src="js/jquery.gritter.js"></script>

    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">google.load('jquery', '1.7.1');</script>
    <script src="js/jquery.gritter.js"></script>
    
    <script type="text/javascript">

        var $g = $.noConflict(true);

    </script>

</asp:Content>

