$cropper(function () {

  "use strict";

  var console = window.console || { log: function () {} },
      $alert = $cropper(".docs-alert"),
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
      var $image = $cropper(".img-container > img"),
        $dataX = $cropper("#dataX"),
        $dataY = $cropper("#dataY"),
        $dataHeight = $cropper("#dataHeight"),
        $dataWidth = $cropper("#dataWidth"),
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

    $cropper(document).on("click", "[data-method]", function () {
        var data = $cropper(this).data();

      if (data.method) {
        $image.cropper(data.method, data.option);
      }
    });

      var $inputImage = $cropper("#inputImage"),
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

    $cropper("#download").click(function () {
      window.open($image.cropper("getDataURL"));
    });

    var $zoomWith = $cropper("#zoomWith");

    $cropper("#zoom").click(function () {
      $image.cropper("zoom", $zoomWith.val());
    });


    var $rotateWith = $cropper("#rotateWith");

    $cropper("#rotate").click(function () {
      $image.cropper("rotate", $rotateWith.val());
    });


    var $getDataInto = $cropper("#getDataInto");

    $cropper("#getData").click(function () {
      var data = $image.cropper("getData"),
          val = "";

      try {
        val = JSON.stringify(data);
      } catch (e) {
        console.log(data);
      }

      $getDataInto.val(val);
    });


    var $setDataX = $cropper("#setDataX"),
        $setDataY = $cropper("#setDataY"),
        $setDataWidth = $cropper("#setDataWidth"),
        $setDataHeight = $cropper("#setDataHeight");

    $cropper("#setData").click(function () {
      var data = {
            x: $setDataX.val(),
            y: $setDataY.val(),
            width: $setDataWidth.val(),
            height: $setDataHeight.val()
          };

      $image.cropper("setData", data);
    });


    var $setAspectRatioWith = $cropper("#setAspectRatioWith");

    $cropper("#setAspectRatio").click(function () {
      $image.cropper("setAspectRatio", $setAspectRatioWith.val());
    });

    $cropper("#NormalRatio").click(function () {
        $image.cropper("setAspectRatio", 1.33);
        $cropper("#savePortraitImage").addClass("hide");
        $cropper("#getDataURL5").show();
    });

    $cropper("#FacebookRatio").click(function () {
        $image.cropper("setAspectRatio", 1.9);
    });

    $cropper("#TwitterRatio").click(function () {
        $image.cropper("setAspectRatio", 1);
    });

    $cropper("#PortraitRatio").click(function () {
        $image.cropper("setAspectRatio", 0.75);
        $cropper("#getDataURL5").hide();
        $cropper("#savePortraitImage").removeClass("hide");
    });

    var $replaceWith = $cropper("#replaceWith");

    $cropper("#replace").click(function () {
      $image.cropper("replace", $replaceWith.val());
    });




    var $getImageDataInto = $cropper("#getImageDataInto");

    $cropper("#getImageData").click(function () {
      var data = $image.cropper("getImageData"),
          val = "";

      try {
        val = JSON.stringify(data);
      } catch (e) {
        console.log(data);
      }

      $getImageDataInto.val(val);
    });


    var $dataURLInto = $cropper("#ContentPlaceHolder1_dataURLInto"), // bit dodgy?
      $dataURLView = $cropper("#dataURLView"),
      $imgNormalImage = $cropper("#imgNormalImage"),
          $fbData = $cropper("#ContentPlaceHolder1_fbBase64"),
          $TwitterData = $cropper("#ContentPlaceHolder1_TwitterBase64"),
          $PortraitData = $cropper("#ContentPlaceHolder1_PortraitBase64");

    $cropper("#getDataURL").click(function () {
      var dataURL = $image.cropper("getDataURL");

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
    });

    $cropper("#getDataURL2").click(function () {
      var dataURL = $image.cropper("getDataURL", "image/jpeg");

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
    });

    $cropper("#getDataURL3").click(function () {
      var dataURL = $image.cropper("getDataURL", {
            width: 160,
            height: 90
          });

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
    });

    $cropper("#getDataURL4").click(function () {
      var dataURL = $image.cropper("getDataURL", {
            width: 320,
            height: 180
          }, "image/jpeg", 0.8);

      $dataURLInto.text(dataURL);
      $dataURLView.html('<img src="' + dataURL + '">');
    });

    $cropper("#getDataURL5").click(function () {
        var dataURL = $image.cropper("getDataURL", {
            width: 720,
            height: 540
        }, "image/jpeg", 0.8);
       
        $dataURLInto.text(dataURL);

        $image.cropper("setAspectRatio", 1.9);
        $imgNormalImage.html('<h4>Standard Image </h4><img class="img-responsive" src="' + dataURL + '">');
        $cropper("#getDataURL5").hide();
        $cropper("#saveFBImage").removeClass("hide");
        $cropper("#saveFBImage").show(); //also need this if the clear button had been clicked
        //alert("Well done! You have created your main image. \r\nClick Ok and I'll scroll down and show it to you. I'll scroll you back up to created your Facebook image.");
        normalsavemsg();
        Scroller();
        $cropper("#ClearImages").removeClass("hide");
        $cropper("#ClearImages").show();
    });

    $cropper("#saveFBImage").click(function () {
        var dataURL = $image.cropper("getDataURL", {
            width: 600,
            height: 315
        }, "image/jpeg", 0.8);

        $fbData.text(dataURL);

        $image.cropper("setAspectRatio", 1);

        $cropper("#imgFacebookImage").html('<h4><i class="fa fa-facebook-square" aria-hidden="true"></i> Facebook Image</h4><img class="img-responsive" src="' + dataURL + '">');
        $cropper("#saveFBImage").hide();
        $cropper("#saveTwitterImage").removeClass("hide");
        $cropper("#saveTwitterImage").show(); //also need this if the clear button had been clicked
        //alert("Awesome! You have created your Facebook image. I'll scroll you down and show it to you after then we'll create a Twitter image");
        fbsavemsg();
        Scroller();

        $cropper("#ClearImages").removeClass("hide");
        $cropper("#ClearImages").show();
    });

    $cropper("#ClearImages").click(function () {
        var dataURL = $image.cropper("getDataURL", {
            width: 600,
            height: 315
        }, "image/jpeg", 0.8);

        $fbData.text('');
        $dataURLInto.text('');
        $TwitterData.text('');

        $image.cropper("setAspectRatio", 1.33);

        $cropper("#imgFacebookImage").html('');
        $cropper("#imgTwitterImage").html('');
        $imgNormalImage.html('');

        $cropper("#saveFBImage").hide();
        $cropper("#saveTwitterImage").hide();

        $cropper("#ClearImages").hide();

        //$cropper("#getDataURL5").removeClass("hide");
        $cropper("#getDataURL5").show();

    });

    $cropper("#saveTwitterImage").click(function () {
        var dataURL = $image.cropper("getDataURL", {
            width: 240,
            height: 240
        }, "image/jpeg", 0.8);

        $TwitterData.text(dataURL);
        $cropper("#imgTwitterImage").html('<h4><i class="fa fa-twitter-square" aria-hidden="true"></i> Twitter Image</h4><img class="img-responsive" src="' + dataURL + '">');

        twittersavemsg();
        //** auto scroll to image preview and save button
        $cropper('html, body').animate({
            scrollTop: $cropper("#imgTwitterImage").offset().top
        }, 3000);
        
        $cropper("#ClearImages").removeClass("hide");
        $cropper("#ClearImages").show();
    });

    $cropper("#savePortraitImage").click(function () {
        var dataURL = $image.cropper("getDataURL", {
            width: 540,
            height: 720
        }, "image/jpeg", 0.8);

        $dataURLInto.text(dataURL);
        //$PortraitData.text(dataURL);
        $image.cropper("setAspectRatio", 1.9);
        $imgNormalImage.html('<h4>Standard Image <i class="fa fa-arrow-down" aria-hidden="true"></i></h4><img class="img-responsive" src="' + dataURL + '">');
        $cropper("#savePortraitImage").hide();
        $cropper("#saveFBImage").removeClass("hide");
        Scroller();
    });


    $cropper("#getdownload").click(function () {
        var dataURL = $image.cropper("getDataURL", {
            width: 600,
            height: 315
        }, "image/jpeg", 0.8);

        $dataURLInto.text(dataURL);
        $dataURLView.html('<img src="' + dataURL + '">');
    });

    $cropper(".docs-options :radio").on("change", function () {
      var $this = $cropper(this);

      if ($this.is(":checked")) {
        options[$this.attr("name")] = $this.val() === "true" ? true : false;
        $image.cropper("destroy").cropper(options);
      }
    });

    $cropper("[data-toggle='tooltip']").tooltip();
  }());

  function Scroller() {

      $cropper('html, body').animate({
          scrollTop: $cropper("#imgNormalImage").offset().top
      }, 3000);

      $cropper('html, body').animate({
          scrollTop: $cropper("#ScrollHere").offset().top
      }, 2000);


  }
  function getDownload() {
      var $dataURLInto = $cropper("#dataURLInto"),
          $dataURLView = $cropper("#dataURLView");

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
    var $sidebar = $cropper(".docs-sidebar"),
        offset = $sidebar.offset(),
        offsetTop = offset.top,
        mainHeight = $sidebar.parents(".row").height() - $sidebar.height();

    $cropper(window).bind("scroll", function () {
      var st = $cropper(this).scrollTop();

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
  $cropper(".fixed-dragger-cropper > img").cropper({
    aspectRatio: 640 / 320, // 2 / 1
    autoCropArea: 0.6, // Center 60%
    multiple: false,
    dragCrop: false,
    dashed: false,
    movable: false,
    resizable: false,
    built: function () {
      $cropper(this).cropper("zoom", 0.5);
    }
  });


  // Example 2
  var $image = $cropper(".bootstrap-modal-cropper > img"),
      originalData = {};

  $cropper("#bootstrap-modal").on("shown.bs.modal", function () {
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

function normalsavemsg() {

    $g.gritter.add({
        // (string | mandatory) the heading of the notification
        title: 'Nice Work!',
        // (string | mandatory) the text inside the notification
        text: "You have created your main image. \r\nNext you'll create your Facebook image.",
        class_name: "gritter-center gritter-success gritter-light"
    });

    return false;

}
function fbsavemsg() {

    $g.gritter.add({
        // (string | mandatory) the heading of the notification
        title: 'Great!',
        // (string | mandatory) the text inside the notification
        text: "You have created your Facebook image. \r\nNext you'll create your Twitter image.",
        class_name: "gritter-center gritter-success gritter-light"
    });

    return false;

}

function twittersavemsg() {

    $g.gritter.add({
        // (string | mandatory) the heading of the notification
        title: 'Well Done!',
        // (string | mandatory) the text inside the notification
        text: "You have have now created the images for your product",
        class_name: "gritter-center gritter-success gritter-light"
    });

    return false;

}
