<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="selling-options.aspx.cs" Inherits="selling_options" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Sell Stuff on Social Shop</title>

    <link href="css/main.css" rel="stylesheet" />
     <link href="css/basic.css" rel="stylesheet" />
    <link href="css/dropzone.css" rel="stylesheet" />

    <style type="text/css">
/* Buttons widths */
.ajax__fileupload_fileItemInfo div.removeButton{
    line-height: 10px;
color: rgb(255, 255, 255);
font-size: 11px;
padding: 3px;
text-shadow: 0px -1px 0px rgba(30, 30, 30, 0.8);
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
background: rgb(221, 24, 24);
background: -moz-linear-gradient(90deg, rgb(221, 24, 24) 30%, rgb(221, 24, 24) 70%);
background: -webkit-linear-gradient(90deg, rgb(221, 24, 24) 30%, rgb(221, 24, 24) 70%);
background: -o-linear-gradient(90deg, rgb(221, 24, 24) 30%, rgb(221, 24, 24) 70%);
background: -ms-linear-gradient(90deg, rgb(221, 24, 24) 30%, rgb(221, 24, 24) 70%);
background: linear-gradient(0deg, rgb(221, 24, 24) 30%, rgb(221, 24, 24) 70%);
-webkit-box-shadow: 0px 2px 1px rgba(50, 50, 50, 0.75);
-moz-box-shadow:    0px 2px 1px rgba(50, 50, 50, 0.75);
box-shadow:         0px 2px 1px rgba(50, 50, 50, 0.75);
}
div.ajax__fileupload_uploadbutton{
    margin: 5px 5px 5px 5px;
    width:120px;
    line-height: 12px;
    color: rgb(255, 255, 255);
font-size: 14px;
padding: 7px;
text-shadow: 0px -1px 0px rgba(30, 30, 30, 0.8);
-webkit-border-radius: 7px;
-moz-border-radius: 7px;
border-radius: 7px;
background: rgb(77, 110, 188);
background: -moz-linear-gradient(90deg, rgb(77, 110, 188) 30%, rgb(77, 110, 188) 70%);
background: -webkit-linear-gradient(90deg, rgb(77, 110, 188) 30%, rgb(77, 110, 188) 70%);
background: -o-linear-gradient(90deg, rgb(77, 110, 188) 30%, rgb(77, 110, 188) 70%);
background: -ms-linear-gradient(90deg, rgb(77, 110, 188) 30%, rgb(77, 110, 188) 70%);
background: linear-gradient(0deg, rgb(77, 110, 188) 30%, rgb(77, 110, 188) 70%);
-webkit-box-shadow: 0px 2px 1px rgba(50, 50, 50, 0.75);
-moz-box-shadow:    0px 2px 1px rgba(50, 50, 50, 0.75);
box-shadow:         0px 2px 1px rgba(50, 50, 50, 0.75);

}
.ajax__fileupload .ajax__fileupload_selectFileContainer{width: 110px;
                                                        height: 60px;
}
.ajax__fileupload_selectFileContainer .ajax__fileupload_selectFileButton{width: 110px;
                                                                         line-height: 12px;
                                                                         height:24px;
                                                                         
color: rgb(0, 0, 0);
font-size: 14px;
padding: 7px;
text-shadow: 0px -1px 0px rgba(30, 30, 30, 0.8);
-webkit-border-radius: 7px;
-moz-border-radius: 7px;
border-radius: 7px;
background: rgb(156, 185, 186);
background: -moz-linear-gradient(90deg, rgb(156, 185, 186) 30%, rgb(156, 185, 186) 70%);
background: -webkit-linear-gradient(90deg, rgb(156, 185, 186) 30%, rgb(156, 185, 186) 70%);
background: -o-linear-gradient(90deg, rgb(156, 185, 186) 30%, rgb(156, 185, 186) 70%);
background: -ms-linear-gradient(90deg, rgb(156, 185, 186) 30%, rgb(156, 185, 186) 70%);
background: linear-gradient(0deg, rgb(156, 185, 186) 30%, rgb(156, 185, 186) 70%);
-webkit-box-shadow: 0px 2px 1px rgba(50, 50, 50, 0.75);
-moz-box-shadow:    0px 2px 1px rgba(50, 50, 50, 0.75);
box-shadow:         0px 2px 1px rgba(50, 50, 50, 0.75);


}
.ajax__fileupload_queueContainer ajax__fileupload_footer
{
    height:180px;
    padding: 5px 5px 5px 5px;
}
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<div class="content-wrapper">

    <asp:Panel ID="pnlMain" runat="server">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Let's get Selling
        
        </h1>

    </section>

    <section class="content">

        


        <div class="row">
            <!-- Left col -->
            <section class="col-lg-9">

                <div class="box box-info">
                    <div class="box-header">
                        <i class="fa fa-tasks" aria-hidden="true"></i>


                        <h3 class="box-title">Extra options to make your product look snazzy</h3>
                        <!-- tools box -->
                        <div class="pull-right box-tools">
                        </div>
                        <!-- /. tools -->
                    </div>

                    <div class="box-body">
                        <div class="col-lg-12 padding-bottom20">
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
                        <div class="col-lg-12 padding-bottom20">
                            <b>Or, you can add Options and qualities below. This will override any quantity you enter above.</b>
                        </div>

                        <asp:Panel ID="pnlOptions" runat="server">

                        
                        <div class="col-lg-12">
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
                        </asp:Panel>

                        <div class="col-lg-12">
                              <div class="box-footer clearfix">
                                  
                                  

                                </div>
                        </div>
                    </div>
                </div>
            </section>


        </div>


        <div class="row">
            <!-- Left col -->
            <section class="col-lg-9">

                <div class="box box-info">
                    <div class="box-header">
                        <i class="fa fa-image" aria-hidden="true"></i>


                        <h3 class="box-title">Upload Extra Images (optional)</h3>
                        <!-- tools box -->
                        <div class="pull-right box-tools">
                        </div>
                        <!-- /. tools -->
                    </div>

                    <div class="box-body">

                        
                        

                        <div class="col-lg-12">
                              <div class="box-footer clearfix">
                                  
                                    <asp:LinkButton ID="lbtnSave" CssClass="pull-right btn btn-app" runat="server"> <i class="fa fa-save"></i> Save</asp:LinkButton>

                                </div>
                        </div>
                    </div>
                </div>
            </section>


        </div>

    </section>
    
    </asp:Panel>

    <asp:Panel ID="pnlImages" Visible="false" runat="server">
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
                                <button class="pull-right btn btn-app" onclick="UploadImages()"><i class="fa fa-save"></i> Save</button>
                                
                            </div>

                        </div>
                    </div>
                </section>
            </div>
        </section>

    </asp:Panel>

    <asp:Panel ID="pnlLinks" Visible="false" runat="server">
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
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

    <script src="js/dropzone.js"></script>

    <script>
        function UploadImages() {
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
                        //this.options.url = "/client-documents.aspx?cid=&tags=" + GetTags(); // *** have to change the url here so that it includes the selected tags
                        this.options.autoProcessQueue = true; //** so it does more than 2 files at a time
                    });
                    this.on("queuecomplete", function (file) {
                        //SaveAlertUpload();
                        $("#<%= pnlImages.ClientID %>").hide();
                        $("#<%= pnlLinks.ClientID %>").show();
                        $("#<%= lbtnSave.ClientID %>").click(); //refresh the document list with the latest uploads (won't work with linkbutton - has to be normal button)
                    });
                }
            };

            $('#add').on('click', function (e) {
                e.preventDefault();
                $('#my-awesome-dropzone').get(0).dropzone.processQueue();

            });
        }
    </script>
</asp:Content>

