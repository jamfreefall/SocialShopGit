<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="image.aspx.cs" Inherits="image" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# product: http://ogp.me/ns/product#">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cropper</title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/cropper.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
   
    <form runat="server">

    <!-- content -->
    <!-- Overview -->
    <div class="container docs-overview">
        <h1 id="overview">Overview</h1>
        <div class="row">
            <div class="col-md-9">
                <h3>Image:</h3>
                <div class="img-container">

                    <img src="Uploads/fb-5.jpg" />

                </div>
                <div class="docs-toolbar">
                    <div class="btn-group">
                        <button class="btn btn-primary" data-method="zoom" data-option="0.1" type="button" title="Zoom In">
                            <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;zoom&quot;, 0.1)">
                                <span class="glyphicon glyphicon-zoom-in"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary" data-method="zoom" data-option="-0.1" type="button" title="Zoom Out">
                            <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;zoom&quot;, -0.1)">
                                <span class="glyphicon glyphicon-zoom-out"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary" data-method="rotate" data-option="-90" type="button" title="Rotate Left">
                            <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;rotate&quot;, -90)">
                                <span class="glyphicon glyphicon-share-alt docs-flip-horizontal"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary" data-method="rotate" data-option="90" type="button" title="Rotate Right">
                            <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;rotate&quot;, 90)">
                                <span class="glyphicon glyphicon-share-alt"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary" data-method="setDragMode" data-option="move" type="button" title="Move">
                            <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
                                <span class="glyphicon glyphicon-move"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary" data-method="setDragMode" data-option="crop" type="button" title="Crop">
                            <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;setDragMode&quot;, &quot;crop&quot;)">
                                <span class="glyphicon glyphicon-plus"></span>
                            </span>
                        </button>
                        <button class="btn btn-primary" data-method="clear" type="button" title="Clear">
                            <span class="docs-tooltip" data-toggle="tooltip" title="$().cropper(&quot;clear&quot;)">
                                <span class="glyphicon glyphicon-remove"></span>
                            </span>
                        </button>
                        <label class="btn btn-primary" for="inputImage" title="Upload image file">
                            <input class="hide" id="inputImage" name="file" type="file" accept="image/*">
                            <span class="docs-tooltip" data-toggle="tooltip" title="Import image with Blob URLs">
                                <span class="glyphicon glyphicon-upload"></span>
                            </span>
                        </label>
                        <button class="btn btn-primary" id="getdownload" type="button" title="Download cropped image">
                          <span class="docs-tooltip" data-toggle="tooltip" title="Export image with &quot;getDataURL&quot;">
                            
                              <span class="glyphicon glyphicon-download"></span>
                          </span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <h3>Preview:</h3>
                <div class="row">
                    <div class="col-md-8">
                        <div class="img-preview img-preview-sm"></div>
                    </div>
                    <div class="col-md-4">
                        <div class="img-preview img-preview-xs"></div>
                    </div>
                </div>
                <hr>

            </div>
        </div>
        <div class="row">
            <div class="col-md-9">
                <div class="docs-btn-group">
                    <h3>Methods:</h3>
                    <div class="button-group">
                        <button class="btn btn-warning" id="reset" data-method="reset" data-toggle="tooltip" type="button" title="$().cropper(&quot;reset&quot;)">Reset</button>
                        <button class="btn btn-warning" id="reset2" data-method="reset" data-option="true" data-toggle="tooltip" type="button" title="$().cropper(&quot;reset&quot;, true)">Reset (deep)</button>
                        <button class="btn btn-success" id="enable" data-method="enable" type="button">Enable</button>
                        <button class="btn btn-warning" id="disable" data-method="disable" type="button">Disable</button>
                        <button class="btn btn-primary" id="clear" data-method="clear" type="button">Clear</button>
                        <button class="btn btn-danger" id="destroy" data-method="destroy" type="button">Destroy</button>
                        <button class="btn btn-info" id="freeRatio" data-method="setAspectRatio" data-option="auto" data-toggle="tooltip" type="button" title="$().cropper(&quot;setAspectRatio&quot;, &quot;auto&quot;)">Free Ratio</button>
                        <button class="btn btn-primary" id="setData" type="button" title="Set with the following data">Set Data</button>
                        <button class="btn btn-primary" onclick="getDownload()"  type="button" title="Set with the following data">Custom</button>
                    </div>

                    <div class="row">
                        <div class="col-sm-6 col-md-3">
                            <div class="input-group">
                                <span class="input-group-addon">X</span>
                                <input class="form-control" id="setDataX" type="number" value="550">
                                <span class="input-group-addon">px</span>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="input-group">
                                <span class="input-group-addon">Y</span>
                                <input class="form-control" id="setDataY" type="number" value="100">
                                <span class="input-group-addon">px</span>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="input-group">
                                <span class="input-group-addon">Width</span>
                                <input class="form-control" id="setDataWidth" type="number" value="480">
                                <span class="input-group-addon">px</span>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="input-group">
                                <span class="input-group-addon">Height</span>
                                <input class="form-control" id="setDataHeight" type="number" value="270">
                                <span class="input-group-addon">px</span>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" id="zoom" type="button">Zoom</button>
                                </span>
                                <input class="form-control" id="zoomWith" type="number" value="0.5">
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" id="rotate" type="button">Rotate</button>
                                </span>
                                <input class="form-control" id="rotateWith" type="number" value="45">
                                <span class="input-group-addon">deg</span>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" id="replace" type="button">Replace</button>
                                </span>
                                <input class="form-control" id="replaceWith" type="text" value="img/picture-2.jpg" placeholder="Input image URL">
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" id="setAspectRatio" type="button">Set Aspect Ratio</button>
                                </span>
                                <input class="form-control" id="setAspectRatioWith" type="text" value="0.618" placeholder="Input aspect ratio">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <button class="btn btn-info" id="getData" type="button">Get Data</button>
                                </span>
                                <input class="form-control" id="getDataInto" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <button class="btn btn-info" id="getImageData" type="button">Get Image Data</button>
                                </span>
                                <input class="form-control" id="getImageDataInto" type="text">
                            </div>
                        </div>
                    </div>

                    <div class="row docs-data-url">
                        <div class="col-sm-12">
                            <button class="btn btn-primary" id="getDataURL" data-toggle="tooltip" type="button" title="$().cropper(&quot;getDataURL&quot;)">Get Data URL</button>
                            <button class="btn btn-primary" id="getDataURL2" data-toggle="tooltip" type="button" title="$().cropper(&quot;getDataURL&quot;, &quot;image/jpeg&quot;)">Get Data URL (JPG)</button>
                            <button class="btn btn-primary" id="getDataURL3" data-toggle="tooltip" type="button" title="$().cropper(&quot;getDataURL&quot;, {width: 160, height: 90})">Get Data URL (160*90)</button>
                            <button class="btn btn-primary" id="getDataURL4" data-toggle="tooltip" type="button" title="$().cropper(&quot;getDataURL&quot;, {width: 320, height: 180}, &quot;image/jpeg&quot;, 0.8)">Get Data URL (320*180, JPG, 0.8)</button>
                            <button class="btn btn-primary" id="getDataURL5" data-toggle="tooltip" type="button" title="$().cropper(&quot;getDataURL&quot;, {width: 320, height: 180}, &quot;image/jpeg&quot;, 0.8)">Get Data URL (600*315, JPG, 0.8)</button>
                        </div>
                        <div class="col-sm-6">
                            <textarea class="form-control" runat="server" id="dataURLInto" rows="8"></textarea>
                        </div>
                        <div class="col-sm-6">
                            <div id="dataURLView"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <h3>Options:</h3>
                <form class="form-horizontal docs-options" role="form">
                    <div class="form-group">
                        <label class="col-xs-4 control-label">autoCrop:</label>
                        <div class="col-xs-8">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary active">
                                    <input id="autoCrop1" name="autoCrop" type="radio" value="true" checked> Yes
                                </label>
                                <label class="btn btn-primary">
                                    <input id="autoCrop2" name="autoCrop" type="radio" value="false"> No
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 control-label">dragCrop:</label>
                        <div class="col-xs-8">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary active">
                                    <input id="dragCrop1" name="dragCrop" type="radio" value="true" checked> Yes
                                </label>
                                <label class="btn btn-primary">
                                    <input id="dragCrop2" name="dragCrop" type="radio" value="false"> No
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 control-label">modal:</label>
                        <div class="col-xs-8">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary active">
                                    <input id="modal1" name="modal" type="radio" value="true" checked> Yes
                                </label>
                                <label class="btn btn-primary">
                                    <input id="modal2" name="modal" type="radio" value="false"> No
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 control-label">dashed:</label>
                        <div class="col-xs-8">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary active">
                                    <input id="dashed1" name="dashed" type="radio" value="true" checked> Yes
                                </label>
                                <label class="btn btn-primary">
                                    <input id="dashed2" name="dashed" type="radio" value="false"> No
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 control-label">movable:</label>
                        <div class="col-xs-8">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary active">
                                    <input id="movable1" name="movable" type="radio" value="true" checked> Yes
                                </label>
                                <label class="btn btn-primary">
                                    <input id="movable2" name="movable" type="radio" value="false"> No
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 control-label">resizable:</label>
                        <div class="col-xs-8">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary active">
                                    <input id="resizable1" name="resizable" type="radio" value="true" checked> Yes
                                </label>
                                <label class="btn btn-primary">
                                    <input id="resizable2" name="resizable" type="radio" value="false"> No
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 control-label">zoomable:</label>
                        <div class="col-xs-8">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary active">
                                    <input id="zoomable1" name="zoomable" type="radio" value="true" checked> Yes
                                </label>
                                <label class="btn btn-primary">
                                    <input id="zoomable2" name="zoomable" type="radio" value="false"> No
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 control-label">rotatable:</label>
                        <div class="col-xs-8">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary active">
                                    <input id="rotatable1" name="rotatable" type="radio" value="true" checked> Yes
                                </label>
                                <label class="btn btn-primary">
                                    <input id="rotatable2" name="rotatable" type="radio" value="false"> No
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4 control-label">multiple:</label>
                        <div class="col-xs-8">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary">
                                    <input id="multiple1" name="multiple" type="radio" value="true"> Yes
                                </label>
                                <label class="btn btn-primary active">
                                    <input id="multiple2" name="multiple" type="radio" value="false" checked> No
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <asp:Button ID="btnSave" runat="server" Text="Save" />
        <asp:Image ID="imgOutput" runat="server" />



</div>
        </form>

    <!-- Alert -->
    <div class="docs-alert"><span class="warning message"></span></div>




    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
    <script src="https://fengyuanchen.github.io/js/common.js"></script>
    <script src="js/cropper.min.js"></script>
    <script src="js/main.js"></script>

</body>
</html>
