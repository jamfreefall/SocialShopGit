<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-All.master" AutoEventWireup="true" CodeFile="cropper.aspx.cs" Inherits="cropper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      
    <link href="cropper/cropper.css" rel="stylesheet" />
  <style>
    .container {
      max-width: 960px;
      margin: 20px auto;
    }

    img {
      max-width: 100%;
    }

    .row,
    .preview {
      overflow: hidden;
    }

    .col {
      float: left;
    }

    .col-6 {
      width: 50%;
    }

    .col-3 {
      width: 25%;
    }

    .col-2 {
      width: 16.7%;
    }

    .col-1 {
      width: 8.3%;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


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

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="txtPrice">How much is shipping?</label>

                        <div class="input-group">
                          <span class="input-group-addon" id="sizing-addon2">$</span>
                      
                            <asp:TextBox ID="txtShipping" autocomplete="off" CssClass="form-control" placeholder="leave this blank if you aren't charging for shipping" runat="server"></asp:TextBox>
                        </div>
                    </div>

                </div>

                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="txtQuantity">How many are you selling? <em>hint: leave this blank if you don't have a set amount to sell</em></label>
                        <asp:TextBox ID="txtQuantity" autocomplete="off" CssClass="form-control" placeholder="eg. 10" runat="server"></asp:TextBox>
                  
                    </div>
                </div>

                <div class="col-lg-12" id="ScrollHere">
                    <div class="form-group">
                        <label for="txtImage">You'll need a good image of your product - choose it here. In fact it is best to have 3 images - 1 for this site, 1 for Facebook and 1 for Twitter. Let's get to it</label>
                        
                        <label class="btn btn-primary btn-lg" for="inputImage" title="Upload image file">
                            <input class="hide" id="inputImage" name="file" type="file" accept="image/*" />
                            <span class="docs-tooltip" data-toggle="tooltip" title="Grab your image">
                                <span class="glyphicon glyphicon-upload"></span>
                            </span>
                        </label>
                        
                    </div>
                    
                </div>





                <div class="col-lg-12">
                    <div>
                        <label for="txtDescription">Tell us about your product</label>
                        <asp:TextBox ID="txtDescription" CssClass="form-control" TextMode="MultiLine" Width="100%" Height="125" runat="server"></asp:TextBox>
                      
                    </div>
                </div>

                <!-- new cropper -->
                <div class="col-lg-12">

                      <div class="container">
                        <h1>Customize preview for Cropper</h1>
                        <h3>Cropper</h3>
                        <div class="row">
                          <div class="col col-6">
                              <img id="image2" src="Uploads/16.jpg" />
                          </div>
                          <div class="col col-3">
                            <div class="preview"></div>
                          </div>
                          <div class="col col-2">
                            <div class="preview"></div>
                          </div>
                          <div class="col col-1">
                            <div class="preview"></div>
                          </div>
                        </div>
                      </div>



                </div>
                <!-- end cropper -->
            </div>
            <div class="box-footer clearfix">
                
                
                <asp:LinkButton ID="lbtnSave" CssClass="pull-right btn btn-app" runat="server"> <i class="fa fa-save"></i> Save</asp:LinkButton>

              
                
            </div>
          </div>



            </asp:Panel>

        </section>
        <!-- /.Left col -->

      </div>




    </section>
</div>


    


 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" Runat="Server">

     <!-- Scripts -->
  <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>

    <script src="cropper/cropper.js"></script>

      <script type="text/javascript">
     var $cropper = $.noConflict(true);
    </script>

  <script>
      $cropper(function () {
          var $previews = $cropper('.preview');

          $cropper('#image2').cropper({
          ready: function (e) {
              var $clone = $cropper(this).clone().removeClass('cropper-hidden');
            alert('ready');
            $clone.css({
              display: 'block',
              width: '100%',
              minWidth: 0,
              minHeight: 0,
              maxWidth: 'none',
              maxHeight: 'none'
            });

            $previews.css({
              width: '100%',
              overflow: 'hidden'
            }).html($clone);
          },

          crop: function (e) {
              var imageData = $cropper(this).cropper('getImageData');
            var previewAspectRatio = e.width / e.height;

            $previews.each(function () {
                var $preview = $cropper(this);
              var previewWidth = $preview.width();
              var previewHeight = previewWidth / previewAspectRatio;
              var imageScaledRatio = e.width / previewWidth;

              $preview.height(previewHeight).find('img').css({
                width: imageData.naturalWidth / imageScaledRatio,
                height: imageData.naturalHeight / imageScaledRatio,
                marginLeft: -e.x / imageScaledRatio,
                marginTop: -e.y / imageScaledRatio
              });
            });
          }
        });
    });
  </script>
</asp:Content>

