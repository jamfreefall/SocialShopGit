<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-All.master" AutoEventWireup="true" CodeFile="dropzone.aspx.cs" Inherits="dropzone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/basic.css" rel="stylesheet" />
    <link href="css/dropzone.css" rel="stylesheet" />

        <style type="text/css">
    .dz-max-files-reached {
        background-color: darkgrey;
    }
            </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        User Profile
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">User profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-body">
                <p>stuff here</p>

                    
                    <div  class="dropzone" id="dropzoneForm">
                        <div class="fallback">
                            
                            <input name="file" type="file" runat="server" multiple="multiple" />
                            <input type="submit" value="Upload" />
                        </div>
                    </div>

                <p>
                    
                    <asp:Button ID="btnSave" CssClass="btn btn-default" runat="server" Text="Save" />
                </p>
            
            <!-- /.box-body -->
          </div>
        </div>
    </div>
          </div>
    </section>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" Runat="Server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="js/dropzone.js"></script>

        <script type="text/javascript">
            var $g = $.noConflict(true);
            //File Upload response from the server
            //Dropzone.autoDiscover = false;
            
            Dropzone.options.dropzoneForm = {
                maxFiles: 2,
                url: "ImageUpload.ashx?s=1000",
                autoProcessQueue: false,
                acceptedFiles: "image/*",
                init: function () {
                    
                        var submitButton = document.querySelector("#<%= btnSave.ClientID %>")
                        myDropzone = this; // closure

                        submitButton.addEventListener("click", function() {
                            myDropzone.processQueue(); // Tell Dropzone to process all queued files.
                        });

                    this.on("maxfilesexceeded", function (data) {
                        var res = eval('(' + data.xhr.responseText + ')');
                    });
                    this.on("addedfile", function (file) {
                        // Create the remove button
                        var removeButton = Dropzone.createElement("<button>Remove file</button>");
                        // Capture the Dropzone instance as closure.
                        var _this = this;
                        // Listen to the click event
                        removeButton.addEventListener("click", function (e) {
                            // Make sure the button click doesn't submit the form:
                            e.preventDefault();
                            e.stopPropagation();
                            // Remove the file preview.
                            _this.removeFile(file);
                            // If you want to the delete the file on the server as well,
                            // you can do the AJAX request here.
                        });
                        // Add the button to the file preview element.
                        file.previewElement.appendChild(removeButton);
                    });
                }
            };


        </script>


</asp:Content>

