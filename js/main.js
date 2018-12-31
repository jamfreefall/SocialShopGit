$(function () {

  "use strict";

  var console = window.console || { log: function () {} },
      $alert = $(".docs-alert"),
      $message = $alert.find(".message"),
      showMessage = function (message, type) {
        $message.text(message);

        if (type) {
          $message.addClass(type);
        }

        

        setTimeout(function () {
        }, 3000);
      };

  // Overview
  // -------------------------------------------------------------------------

  (function () {
    var $image = $(".img-container > img"),
        $dataX = $("#dataX"),
        $dataY = $("#dataY"),
        $dataHeight = $("#dataHeight"),
        $dataWidth = $("#dataWidth"),
        options = {
          aspectRatio: 1.33,
          /*data: {
            x: 10,//480,
            y: 30,//60,
            width: 300,//640,
            height: 165,//360
          },*/
          preview: ".img-preview",
          done: function (data) {
            $dataX.val(Math.round(data.x));
            $dataY.val(Math.round(data.y));
            $dataHeight.val(Math.round(data.height));
            $dataWidth.val(Math.round(data.width));

          }
        };

    

    $image.cropper(options).on({
      "build.cropper": function (e) {
        console.log(e.type);
      },
      "built.cropper": function (e) {
        console.log(e.type);
      }
    });

    $(document).on("click", "[data-method]", function () {
      var data = $(this).data();

      if (data.method) {
        $image.cropper(data.method, data.option);
      }
    });

    var $inputImage = $("#inputImage"),
        blobURL;

    if (window.URL) {
      $inputImage.change(function () {
        var files = this.files,
            file;

        if (files && files.length) {
          file = files[0];

          if (/^image\/\w+$/.test(file.type)) {
            if (blobURL) {
              URL.revokeObjectURL(blobURL); // Revoke the old one
            }
            blobURL = URL.createObjectURL(file);
            $image.cropper("reset", true).cropper("replace", blobURL);
            $inputImage.val("");
          } else {
            showMessage("Please choose an image file.");
          }
        }
      });
    } else {
      $inputImage.parent().remove();
    }

    $("#download").click(function () {
      window.open($image.cropper("getDataURL"));
    });

    var $zoomWith = $("#zoomWith");

    $("#zoom").click(function () {
      $image.cropper("zoom", $zoomWith.val());
    });


    var $rotateWith = $("#rotateWith");

    $("#rotate").click(function () {
      $image.cropper("rotate", $rotateWith.val());
    });


    var $getDataInto = $("#getDataInto");

    $("#getData").click(function () {
      var data = $image.cropper("getData"),
          val = "";

      try {
        val = JSON.stringify(data);
      } catch (e) {
        console.log(data);
      }

      $getDataInto.val(val);
    });


    var $setDataX = $("#setDataX"),
        $setDataY = $("#setDataY"),
        $setDataWidth = $("#setDataWidth"),
        $setDataHeight = $("#setDataHeight");

    $("#setData").click(function () {
      var data = {
            x: $setDataX.val(),
            y: $setDataY.val(),
            width: $setDataWidth.val(),
            height: $setDataHeight.val()
          };

      $image.cropper("setData", data);
    });


    var $setAspectRatioWith = $("#setAspectRatioWith");

    $("#setAspectRatio").click(function () {
      $image.cropper("setAspectRatio", $setAspectRatioWith.val());
    });

    $("#NormalRatio").click(function () {
        $image.cropper("setAspectRatio", 1.33);
        $("#savePortraitImage").addClass("hide");
        $("#getDataURL5").show();
    });

    $("#FacebookRatio").click(function () {
        $image.cropper("setAspectRatio", 1.9);
    });

    $("#TwitterRatio").click(function () {
        $image.cropper("setAspectRatio", 1);
    });

    $("#PortraitRatio").click(function () {
        $image.cropper("setAspectRatio", 0.75);
        $("#getDataURL5").hide();
        $("#savePortraitImage").removeClass("hide");
    });

    var $replaceWith = $("#replaceWith");

    $("#replace").click(function () {
      $image.cropper("replace", $replaceWith.val());
    });




    var $getImageDataInto = $("#getImageDataInto");

    $("#getImageData").click(function () {
      var data = $image.cropper("getImageData"),
          val = "";

      try {
        val = JSON.stringify(data);
      } catch (e) {
        console.log(data);
      }

      $getImageDataInto.val(val);
    });


    var $dataURLInto = $("#ContentPlaceHolder1_dataURLInto"), // bit dodgy?
      $dataURLView = $("#dataURLView"),
      $imgNormalImage = $("#imgNormalImage"),
          $fbData = $("#ContentPlaceHolder1_fbBase64"),
          $TwitterData = $("#ContentPlaceHolder1_TwitterBase64"),
          $PortraitData = $("#ContentPlaceHolder1_PortraitBase64");

    $("#getDataURL").click(function () {
      var dataURL = $image.cropper("getDataURL");

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
    });

    $("#getDataURL2").click(function () {
      var dataURL = $image.cropper("getDataURL", "image/jpeg");

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
    });

    $("#getDataURL3").click(function () {
      var dataURL = $image.cropper("getDataURL", {
            width: 160,
            height: 90
          });

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
    });

    $("#getDataURL4").click(function () {
      var dataURL = $image.cropper("getDataURL", {
            width: 320,
            height: 180
          }, "image/jpeg", 0.8);

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
    });

    $("#getDataURL5").click(function () {
        var dataURL = $image.cropper("getDataURL", {
            width: 720,
            height: 540
        }, "image/jpeg", 0.8);
       
        $dataURLInto.text(dataURL);

        $image.cropper("setAspectRatio", 1.9);
        $imgNormalImage.html('<h4>Standard Image <i class="fa fa-arrow-down" aria-hidden="true"></i></h4><img class="img-responsive" src="' + dataURL + '">');
        $("#getDataURL5").hide();
        $("#saveFBImage").removeClass("hide");
        alert("Well done! You have created your main image.\r\n Click Ok and I'll scroll down and show it to you \r\nClick Ok and we'll create a Facebook image");
        //Scroller();
    });

    $("#saveFBImage").click(function () {
        var dataURL = $image.cropper("getDataURL", {
            width: 600,
            height: 315
        }, "image/jpeg", 0.8);

        $fbData.text(dataURL);

        $image.cropper("setAspectRatio", 1);

        $("#imgFacebookImage").html('<h4>Facebook Image <i class="fa fa-arrow-down" aria-hidden="true"></i></h4><img class="img-responsive" src="' + dataURL + '">');
        $("#saveFBImage").hide();
        $("#saveTwitterImage").removeClass("hide");
        alert("Well done! You have created your Facebook image. Hang on I'll scroll down and show it to you \r\nClick Ok and we'll create a Twitter image");
        //Scroller();
    });

    $("#saveTwitterImage").click(function () {
        var dataURL = $image.cropper("getDataURL", {
            width: 240,
            height: 240
        }, "image/jpeg", 0.8);

        $TwitterData.text(dataURL);
        $("#imgTwitterImage").html('<h4>Twitter Image <i class="fa fa-arrow-down" aria-hidden="true"></i></h4><img class="img-responsive" src="' + dataURL + '">');

        //** auto scroll to image preview and save button
        $('html, body').animate({
            scrollTop: $("#imgTwitterImage").offset().top
        }, 3000);
    });

    $("#savePortraitImage").click(function () {
        var dataURL = $image.cropper("getDataURL", {
            width: 540,
            height: 720
        }, "image/jpeg", 0.8);

        $dataURLInto.text(dataURL);
        //$PortraitData.text(dataURL);
        $image.cropper("setAspectRatio", 1.9);
        $imgNormalImage.html('<h4>Standard Image <i class="fa fa-arrow-down" aria-hidden="true"></i></h4><img class="img-responsive" src="' + dataURL + '">');
        $("#savePortraitImage").hide();
        $("#saveFBImage").removeClass("hide");
        Scroller();
    });


    $("#getdownload").click(function () {
        var dataURL = $image.cropper("getDataURL", {
            width: 600,
            height: 315
        }, "image/jpeg", 0.8);

        $dataURLInto.text(dataURL);
        $dataURLView.html('<img src="' + dataURL + '">');
    });

    $(".docs-options :radio").on("change", function () {
      var $this = $(this);

      if ($this.is(":checked")) {
        options[$this.attr("name")] = $this.val() === "true" ? true : false;
        $image.cropper("destroy").cropper(options);
      }
    });

    $("[data-toggle='tooltip']").tooltip();
  }());

  function Scroller() {

      $('html, body').animate({
          scrollTop: $("#imgNormalImage").offset().top
      }, 3000);

      $('html, body').animate({
          scrollTop: $("#ScrollHere").offset().top
      }, 2000);


  }
  function getDownload() {
      var $dataURLInto = $("#dataURLInto"),
          $dataURLView = $("#dataURLView");

      var dataURL = $image.cropper("getDataURL", {
          width: 600,
          height: 315
      }, "image/jpeg", 0.8);

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
  }

  // Sidebar
  // -------------------------------------------------------------------------

  (function () {
    var $sidebar = $(".docs-sidebar"),
        offset = $sidebar.offset(),
        offsetTop = offset.top,
        mainHeight = $sidebar.parents(".row").height() - $sidebar.height();

    $(window).bind("scroll", function () {
      var st = $(this).scrollTop();

      if (st > offsetTop && (st - offsetTop) < mainHeight) {
        $sidebar.addClass("fixed");
      } else {
        $sidebar.removeClass("fixed");
      }
    });
  }());

  // Examples
  // -------------------------------------------------------------------------

  // Example 1
  $(".fixed-dragger-cropper > img").cropper({
    aspectRatio: 640 / 320, // 2 / 1
    autoCropArea: 0.6, // Center 60%
    multiple: false,
    dragCrop: false,
    dashed: false,
    movable: false,
    resizable: false,
    built: function () {
      $(this).cropper("zoom", 0.5);
    }
  });


  // Example 2
  var $image = $(".bootstrap-modal-cropper > img"),
      originalData = {};

  $("#bootstrap-modal").on("shown.bs.modal", function () {
    $image.cropper({
      multiple: true,
      data: originalData,
      done: function (data) {
        console.log(data);
      }
    });
  }).on("hidden.bs.modal", function () {
    originalData = $image.cropper("getData"); // Saves the data on hide
    $image.cropper("destroy");
  });

});
