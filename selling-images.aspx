<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="selling-images.aspx.cs" Inherits="selling_images" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Extra Images For Your Product on Social Shop</title>

    <link href="css/main.css" rel="stylesheet" />
     <link href="css/basic.css" rel="stylesheet" />
    <link href="css/dropzone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content-wrapper">
    <asp:Panel ID="pnlImages" Visible="true" runat="server">
    <section class="content-header">
        <h1>How About Some Extra Images
        
        </h1>

    </section>

        <section class="content">

            <div class="row">
                <!-- Left col -->
                <section class="col-lg-9">

                    <div class="box box-info">
                        <div class="box-header">
                            <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>


                            <h3 class="box-title">Upload more images?</h3>
                            <!-- tools box -->
                            <div class="pull-right box-tools">
                            </div>
                            <!-- /. tools -->
                        </div>

                        <div class="box-body">
                            <div class="col-lg-12">
                                <div id="my-awesome-dropzone" class="dropzone">

                                    <div class="dz-message">
                                        <div class="drag-icon-cph">
                                            <i class="fa fa-upload fa-3x" aria-hidden="true"></i>
                                        </div>
                                        <h3>Drop files here or click to upload.</h3>

                                    </div>
                                    <div class="fallback">
                                        <input name="file" type="file" multiple />
                                    </div>

                                </div>

                            </div>
                            <div class="col-lg-12">
                                <button class="pull-right btn btn-app" id="add" name="add"><i class="fa fa-save"></i> Save</button>
                                
                            </div>

                        </div>
                    </div>
                </section>
            </div>
        </section>

    </asp:Panel>

    <asp:Panel ID="pnlLinks" Visible="true" runat="server">
        <section class="content">

            <div class="row">
                <!-- Left col -->
                <section class="col-lg-9">

                    <div class="box box-info">
                        <div class="box-header">
                            <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>


                            <h3 class="box-title">Here are your item details</h3>
                            <!-- tools box -->
                            <div class="pull-right box-tools">
                            </div>
                            <!-- /. tools -->
                        </div>

                        <div class="box-body">
                            <div class="col-lg-12">
                                <div class="callout callout-success">
                                        <h4>Here is your unique link</h4>

                                        <p>All you have to do is copy and paste the link to Facebook, Twitter, Pinterest and start spreading the word about your product</p>
                    
                                        <h2><asp:Label ID="lblSocialLink" runat="server" Text="http://www.socialshop.com.au/product.aspx?gid=dcvhfkjdcvgbjk"></asp:Label></h2>
                                        <p><asp:HyperLink ID="hlTweetLink" CssClass="btn btn-twitter" runat="server"><i class="fa fa-twitter" aria-hidden="true"></i> Tweet Your Product</asp:HyperLink></p>
                                    <p>
                                        <asp:HyperLink ID="hlProduct" runat="server">Have a look at your product</asp:HyperLink>
                                        

                                    </div>

                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </section>

    </asp:Panel>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" Runat="Server">
    <%--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.2.0/min/dropzone.min.js" integrity="sha256-eO9VTVeZLaplH86Iwt8l39+l7GZpLOTsVWYziS5oY0Q=" crossorigin="anonymous"></script>

    <script>
        
            Dropzone.options.myAwesomeDropzone = {
                paramName: "file", // The name that will be used to transfer the file
                maxFilesize: 12, // MB
                addRemoveLinks: true,
                acceptedFiles: ".jpg,.jpeg,.png,.gif,.tiff",
                //parallelUploads: 10,
                url: "/fileupload.aspx",
                // Prevents Dropzone from uploading dropped files immediately
                autoProcessQueue: false,
                init: function () {
                    //this.on("addedfile", function (file) { alert(GetTags()); });
                    this.on("processing", function (file) {
                        this.options.url = "/fileupload.aspx"; // *** have to change the url here so that it includes the selected tags
                        this.options.autoProcessQueue = true; //** so it does more than 2 files at a time
                    });
                    this.on("queuecomplete", function (file) {
                        alert('complete');
                        //SaveAlertUpload();
                        $("#<%= pnlImages.ClientID %>").hide();
                        $("#<%= pnlLinks.ClientID %>").show();
                        
                    });
                }
            };

            $('#add').on('click', function (e) {
                e.preventDefault();
                $('#my-awesome-dropzone').get(0).dropzone.processQueue();
                alert('part 1');
            });
        
    </script>

</asp:Content>

