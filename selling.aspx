<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="selling.aspx.cs" Inherits="selling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Sell Stuff on Social Shop</title>
    <link href="css/jquery.gritter.css" rel="stylesheet" />
    <link href="css/cropper.min.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Let's get Selling
        
      </h1>

    </section>

      <!-- Main content -->
      <section class="content">
          
          <div class="row">
              <!-- Left col -->
              <section class="col-lg-9">

                  <div class="box box-info">
                      <div class="box-header">
                          <i class="fa fa-gift" aria-hidden="true"></i>


                          <h3 class="box-title">What are you selling?</h3>
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
                              <asp:Panel ID="pnlPayPalMsg" Visible="true" runat="server">
                                
                                    <div class="alert alert-danger alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <h4><i class="icon fa fa-ban"></i>Alert!</h4>
                                       <p>Please note that you will be able to create a product to sell but you won't be able to sell it until you enter your PayPal email address on the Profile Page</p>
                                        <p>You can get to the profile page via the menu</p>
                                    </div>
                                
                            </asp:Panel>

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
                        
                                    <asp:TextBox ID="txtDownloadLink" CssClass="form-control" Visible="false" placeholder="The full url for your download file" runat="server"></asp:TextBox>
                      
                                </div>
                            </div>

                                <asp:Panel ID="pnlShipping" Visible="false" runat="server">
                                <div class="col-md-12" id="divShipOptions" runat="server">
                                    <div class="form-group">
                                        <label for="txtPrice">What shipping options do you provide?</label>
                

                                        <asp:Repeater ID="rptShippingOptions" runat="server">
                                            <ItemTemplate>
                                               <div class="col-xs-12"> 
                                                    <div class="col-xs-12 col-md-4">
                                                        <asp:CheckBox ID="chkOption" Text='<%# Eval("OptionName") %>' runat="server" /><asp:Literal ID="litOptionID" Text='<%# Eval("OptionID") %>' Visible="false" runat="server"></asp:Literal>
                                                    </div>

                                                    <div class="col-xs-12 col-md-4">
                                                        <div class="form-group">
                        
                        
                                                            <div class="input-group">
                            
                                                              <span class="input-group-addon" id="sizing-addon2">$</span>
                      
                                                                <asp:TextBox ID="txtShipping" autocomplete="off" CssClass="form-control" placeholder="1st item how much?" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>

                                                   <div class="col-xs-12 col-md-4">
                                                        <div class="form-group">
                        
                        
                                                            <div class="input-group">
                            
                                                              <span class="input-group-addon" id="sizing-addon2">$</span>
                      
                                                                <asp:TextBox ID="txtAdditionalShip" autocomplete="off" CssClass="form-control" placeholder="Additional items how much each?" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                               </div>

                                            </ItemTemplate>

                                        </asp:Repeater>
                                    </div>
                                </div>
                                </asp:Panel>
                            


                      </div>

                    </ContentTemplate>
                    </asp:UpdatePanel>
                  </div>
              </section>


          </div>




          <!-- Image Upload -->
        <div class="row">
              <!-- Left col -->
              <section class="col-lg-9">

                  <div class="box box-info">
                      <div class="box-header">
                          <i class="fa fa-gift" aria-hidden="true"></i>


                          <h3 class="box-title">Images</h3>
                          <!-- tools box -->
                          <div class="pull-right box-tools">
                          </div>
                          <!-- /. tools -->
                      </div>

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
                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                        <h3>&nbsp;</h3>
                                        
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <button class="btn btn-app btn-block bg-orange" id="getDataURL5" data-toggle="tooltip" type="button" title="Save Selection"><i class="fa fa-crop"></i>Keep Selection</button>
                                            <button class="btn btn-app btn-block bg-orange hide" id="saveFBImage" data-toggle="tooltip" type="button" title="Save Selection"><i class="fa fa-crop"></i>Keep FB Image</button>
                                            <button class="btn btn-app btn-block bg-orange hide" id="saveTwitterImage" data-toggle="tooltip" type="button" title="Save Selection"><i class="fa fa-crop"></i>Keep Twitter Image</button>
                                            <button class="btn btn-app btn-block bg-orange hide" id="savePortraitImage" data-toggle="tooltip" type="button" title="Save Selection"><i class="fa fa-crop"></i>Keep Selection</button>
                                        </div>

                                        <input id="FacebookRatio" class="btn btn-primary hide" type="button" value="Facebook" />
                                        <input id="TwitterRatio" class="btn btn-primary hide" type="button" value="Twitter" />
                                    </div>
                        
                                </div>

                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12" id="imgNormalImage"></div>
                                    <div class="col-lg-4 col-md-4 col-sm-12" id="imgFacebookImage"></div>
                                    <div class="col-lg-4 col-md-4 col-sm-12" id="imgTwitterImage"></div>
                                </div>

                                <div class="row text-center">
                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                        <input id="ClearImages" class="btn btn-danger hide" type="button" value="Remove Images" />
                                    </div>
                                </div>

                            </div>

                        </div>
                  </div>
              </section>

              <section class="col-lg-3">
                  <div class="box box-info">
                      <div class="box-header">
                          <i class="fa fa-gift" aria-hidden="true"></i>


                          <h3 class="box-title">Image Preview</h3>
                          <!-- tools box -->
                          <div class="pull-right box-tools">
                          </div>
                          <!-- /. tools -->
                      </div>

                      <div class="box-body">
                          <div class="col-lg-12">
                              <div class="img-preview img-preview-sm"></div>
                          </div>

                          

                      </div>
                  </div>
            </section>
          </div>
          <!-- end Image Upload -->



          <!-- Save -->
           <div class="row">
              <!-- Left col -->
              <section class="col-lg-9">

                  <div class="box box-info">
                      <div class="box-header">
                          <i class="fa fa-gift" aria-hidden="true"></i>


                          <h3 class="box-title">Ready To Sell</h3>
                          <!-- tools box -->
                          <div class="pull-right box-tools">
                          </div>
                          <!-- /. tools -->
                      </div>

                      <div class="box-body">
                          <div class="col-lg-12">
                              <div class="box-footer clearfix">
                                    <asp:LinkButton ID="lbtnSave" CssClass="pull-right btn btn-app" runat="server"> <i class="fa fa-save"></i> Save & Continue</asp:LinkButton>

                                </div>


                              <asp:Panel ID="pnlError" Visible="false" runat="server">
                                
                                    <div class="alert alert-danger alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <h4><i class="icon fa fa-ban"></i>Alert!</h4>
                                        Oops there were some things that need fixing before I can save. <br />Scroll up the page and you'll see the things that need fixing with a red box around them.
                                    </div>
                                
                            </asp:Panel>

                            <asp:Panel ID="pnlSocialLink" Visible="false" runat="server">

                                    <div class="callout callout-success">
                                        <h4>Here is your unique link</h4>

                                        <p>All you have to do is copy and paste the link to Facebook, Twitter, Pinterest</p>
                    
                                        <h2><asp:Label ID="lblSocialLink" runat="server" Text="http://www.socialshop.com.au/product.aspx?gid=dcvhfkjdcvgbjk"></asp:Label></h2>
                                        <p><asp:HyperLink ID="hlTweetLink" CssClass="btn btn-twitter" runat="server">Tweet Your Product</asp:HyperLink></p>

                                    </div>

                            </asp:Panel>
                          </div>
                      </div>
                  </div>
              </section>


          </div>

          <!-- end Save -->


    </section>
</div>
    

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" Runat="Server">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- this line kills the admin functionality from working but is essential for image cropping -->
    <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
    <script src="https://fengyuanchen.github.io/js/common.js"></script>
    <script src="js/cropper.min.js"></script>
    <script type="text/javascript"> <!-- this gets the admin functionality working again -->
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

