﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-All.master" AutoEventWireup="true" CodeFile="gritter.aspx.cs" Inherits="gritter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/jquery.gritter.css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-wrapper">
    <div class="row">
        <div class="col-sm-12">

        
    <div id="container">
	<h1>Gritter Demo</h1>
	<p>
		The super awesome background is just to show you that all notifications are transparent!
		<em>Tested in: FF 3+, Opera 9, IE7, IE8, Safari 4+</em>
	</p>
	<ul>
		<li>
			<a href="#" id="add-regular1" onclick="trythis()">Add regular notification</a>: Fades out after a certain amount of time, can be set for each notification.
		</li>
		<li>
			<a href="#" id="add-sticky">Add sticky notification</a>: Doesn't run on a fade timer.  Just sits there until the user manually removes it by clicking on the (X).
		</li>
		<li>
			<a href="#" id="add-without-image">Add notification without image</a>
		</li>
        <li>
            <a href="#" id="add-gritter-light">Add a white notification</a>: has a 'gritter-light' class_name applied to it.
        </li>
		<li>
			<a href="#" id="add-with-callbacks">Add notification (with callbacks)</a>
		</li>
		<li>
			<a href="#" id="add-sticky-with-callbacks">Add a sticky notification (with callbacks)</a>
		</li>
        <li>
            <a href="#" id="add-max">Add notification with max of 3</a>: If there are 3 messages already on screen, it won't show another one.
        </li>
		<li>
			<a href="#" id="remove-all">Remove all notifications</a>
		</li>
		<li>
			<a href="#" id="remove-all-with-callbacks">Remove all notifications (with callbacks)</a>
		</li>
	</ul>
</div>
    </div>

    </div>
         </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" Runat="Server">
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">google.load('jquery', '1.7.1');</script>
    <script src="js/jquery.gritter.js"></script>
    
    <script type="text/javascript">

        var $g = $.noConflict(true);

        function trythis()
        {
            alert('hh');

                $g.gritter.add({
                    // (string | mandatory) the heading of the notification
                    title: 'This is a notice without an image!',
                    // (string | mandatory) the text inside the notification
                    text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.'
                });

                return false;
            

        }
	$g(function(){
	    
		// global setting override
        /*
		$.extend($.gritter.options, {
		    class_name: 'gritter-light', // for light notifications (can be added directly to $.gritter.add too)
		    position: 'bottom-left', // possibilities: bottom-left, bottom-right, top-left, top-right
			fade_in_speed: 100, // how fast notifications fade in (string or int)
			fade_out_speed: 100, // how fast the notices fade out
			time: 3000 // hang on the screen for...
		});
        */

		$g('#add-sticky').click(function(){

			var unique_id = $g.gritter.add({
				// (string | mandatory) the heading of the notification
				title: 'This is a sticky notice!',
				// (string | mandatory) the text inside the notification
				text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.',
				// (string | optional) the image to display on the left
				image: 'http://s3.amazonaws.com/twitter_production/profile_images/132499022/myface_bigger.jpg',
				// (bool | optional) if you want it to fade out on its own or just sit there
				sticky: true,
				// (int | optional) the time you want it to be alive for before fading out
				time: '',
				// (string | optional) the class name you want to apply to that specific message
				class_name: 'my-sticky-class'
			});

			// You can have it return a unique id, this can be used to manually remove it later using
			/*
			setTimeout(function(){

				$.gritter.remove(unique_id, {
					fade: true,
					speed: 'slow'
				});

			}, 6000)
			*/

			return false;

		});
		
		$g('#add-regular').click(function(){
		    
			$g.gritter.add({
				// (string | mandatory) the heading of the notification
				title: 'This is a regular notice!',
				// (string | mandatory) the text inside the notification
				text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.',
				// (string | optional) the image to display on the left
				image: 'http://a0.twimg.com/profile_images/59268975/jquery_avatar_bigger.png',
				// (bool | optional) if you want it to fade out on its own or just sit there
				sticky: false,
				// (int | optional) the time you want it to be alive for before fading out
				time: ''
			});

			return false;

		});

        $g('#add-max').click(function(){

            $g.gritter.add({
                // (string | mandatory) the heading of the notification
                title: 'This is a notice with a max of 3 on screen at one time!',
                // (string | mandatory) the text inside the notification
                text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.',
                // (string | optional) the image to display on the left
                image: 'http://a0.twimg.com/profile_images/59268975/jquery_avatar_bigger.png',
                // (bool | optional) if you want it to fade out on its own or just sit there
                sticky: false,
                // (function) before the gritter notice is opened
                before_open: function(){
                    if($('.gritter-item-wrapper').length == 3)
                    {
                        // Returning false prevents a new gritter from opening
                        return false;
                    }
                }
            });

            return false;

        });

		$g('#add-without-image').click(function(){
		    
			$g.gritter.add({
				// (string | mandatory) the heading of the notification
				title: 'This is a notice without an image!',
				// (string | mandatory) the text inside the notification
				text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" style="color:#ccc">magnis dis parturient</a> montes, nascetur ridiculus mus.'
			    
			});
			
			return false;
		});

        $g('#add-gritter-light').click(function(){

            $g.gritter.add({
                // (string | mandatory) the heading of the notification
                title: 'This is a light notification',
                // (string | mandatory) the text inside the notification
                text: 'Just add a "gritter-light" class_name to your $.gritter.add or globally to $.gritter.options.class_name',
                class_name: 'gritter-light'
            });

            return false;
        });

		$g('#add-with-callbacks').click(function(){

			$g.gritter.add({
				// (string | mandatory) the heading of the notification
				title: 'This is a notice with callbacks!',
				// (string | mandatory) the text inside the notification
				text: 'The callback is...',
				// (function | optional) function called before it opens
				before_open: function(){
					alert('I am called before it opens');
				},
				// (function | optional) function called after it opens
				after_open: function(e){
					alert("I am called after it opens: \nI am passed the jQuery object for the created Gritter element...\n" + e);
				},
				// (function | optional) function called before it closes
				before_close: function(e, manual_close){
                    var manually = (manual_close) ? 'The "X" was clicked to close me!' : '';
					alert("I am called before it closes: I am passed the jQuery object for the Gritter element... \n" + manually);
				},
				// (function | optional) function called after it closes
				after_close: function(e, manual_close){
                    var manually = (manual_close) ? 'The "X" was clicked to close me!' : '';
					alert('I am called after it closes. ' + manually);
				}
			});

			return false;
		});

		$g('#add-sticky-with-callbacks').click(function(){

			$g.gritter.add({
				// (string | mandatory) the heading of the notification
				title: 'This is a sticky notice with callbacks!',
				// (string | mandatory) the text inside the notification
				text: 'Sticky sticky notice.. sticky sticky notice...',
				// Stickeh!
				sticky: true,
				// (function | optional) function called before it opens
				before_open: function(){
					alert('I am a sticky called before it opens');
				},
				// (function | optional) function called after it opens
				after_open: function(e){
					alert("I am a sticky called after it opens: \nI am passed the jQuery object for the created Gritter element...\n" + e);
				},
				// (function | optional) function called before it closes
				before_close: function(e){
					alert("I am a sticky called before it closes: I am passed the jQuery object for the Gritter element... \n" + e);
				},
				// (function | optional) function called after it closes
				after_close: function(){
					alert('I am a sticky called after it closes');
				}
			});

			return false;

		});

		$g("#remove-all").click(function(){

			$g.gritter.removeAll();
			return false;

		});

		$g("#remove-all-with-callbacks").click(function(){

			$g.gritter.removeAll({
				before_close: function(e){
					alert("I am called before all notifications are closed.  I am passed the jQuery object containing all  of Gritter notifications.\n" + e);
				},
				after_close: function(){
					alert('I am called after everything has been closed.');
				}
			});
			return false;

		});


	});
</script>


</asp:Content>

