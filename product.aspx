<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="product.aspx.cs" Inherits="product" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# product: http://ogp.me/ns/product#">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title><asp:Literal ID="litPageTitle" runat="server"></asp:Literal></title>

        

          <meta property="og:type"                         content="website" /> 
          <meta content="<asp:Literal ID='ogURL' runat='server'></asp:Literal>" property="og:url" /> 
          <meta property="og:title"                        content="<asp:Literal ID='ogTitle' runat='server'></asp:Literal>" /> 
          <meta property="og:image"                        content="<asp:Literal ID='ogImage' runat='server'></asp:Literal>" /> 
        <meta property="og:description"                        content="<asp:Literal ID='ogDescription' runat='server'></asp:Literal>" /> 


        <meta name="twitter:card" content="summary" />
        <meta name="twitter:site" content="<asp:Literal ID='tcAccount' runat='server'></asp:Literal>" />
        <meta name="twitter:title" content="<asp:Literal ID='tcTitle' runat='server'></asp:Literal>" />
        <meta name="twitter:description" content="<asp:Literal ID='tcDescription' runat='server'></asp:Literal>" />
        <meta name="twitter:image" content="<asp:Literal ID='tcImage' runat='server'></asp:Literal>" />

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Custom styles for this template -->
        <link href="css/Product/style.css" rel="stylesheet" />
        
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" type="text/css" />

        <link href="ProductPageFiles/select_option1.css" rel="stylesheet" />
        <link href="ProductPageFiles/settings.css" rel="stylesheet" />
        <link href="ProductPageFiles/owl.carousel.css" rel="stylesheet" />

         <!-- GOOGLE FONT -->
    <link href='https://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>

        <!-- custom styles -->
        <link href="css/Product/style.css" rel="stylesheet" />
        <link href="ProductPageFiles/animate.css" rel="stylesheet" />
        <link href="ProductPageFiles/optionswitch.css" rel="stylesheet" />
        <link href="ProductPageFiles/default.css" rel="stylesheet" />
        <link href="ProductPageFiles/socialshop.css" rel="stylesheet" />

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>
    <body>
        <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.8&appId=1399762596732302";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>




        <form id="frmmain" runat="server">


                   <div class="main-wrapper"> 
            <!-- HEADER -->             
            <div class="header clearfix"> 
                <!-- TOPBAR                 
                <div class="topBar"> 
                    <div class="container"> 
                        <div class="row"> 
                            <div class="col-md-6 hidden-sm hidden-xs"> 
                                <ul class="list-inline"> 
                                    <li>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                    </li>                                     
                                    <li>
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                    </li>                                     
                                    <li>
                                        <a href="#"><i class="fa fa-dribbble"></i></a>
                                    </li>                                     
                                    <li>
                                        <a href="#"><i class="fa fa-vimeo"></i></a>
                                    </li>                                     
                                    <li>
                                        <a href="#"><i class="fa fa-tumblr"></i></a>
                                    </li>                                     
                                </ul>                                 
                            </div>                             
                            <div class="col-md-6 col-xs-12"> 
                                 
                            </div>                             
                        </div>                         
                    </div>                     
                </div>  -->                
                      
    </div>     
    <!-- LIGHT SECTION -->     
    <section class="lightSection clearfix pageHeader"> 
        <div class="container"> 
            <div class="row"> 
                <div class="col-xs-6"> 
                    <div class="page-title"> 
                        <h2>Social<b>SHOP</b></h2> 
                    </div>                     
                </div>                 
                <div class="col-xs-6"> 
                    <ol class="breadcrumb pull-right"> 
                        <li>
                                        <a href="https://www.facebook.com/socialshop.com.au"><i class="fa fa-facebook"></i></a>
                                    </li>
                         <li>
                                        <a href="https://twitter.com/socialshopaus"><i class="fa fa-twitter"></i></a>
                                    </li>                                     
                                                                         
                                   <!-- <li>
                                        <a href="#"><i class="fa fa-google-plus"></i></a>
                                    </li>   
                                    <li>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                    </li>     -->                              
                                                             
                    </ol> 

                                     
                </div>                 
            </div>             
        </div>         
    </section>     
    <!-- MAIN CONTENT SECTION -->     
    <section class="mainContent clearfix"> 
        <div class="container"> 
            <div class="row singleProduct"> 
                <div class="col-xs-12"> 
                    <div class="media"> 

                    <asp:Panel ID="pnlGallery" runat="server">
                        <div class="media-left productSlider"> 
                            <div id="carousel" class="carousel slide" data-ride="carousel"> 
                                <div class="carousel-inner"> 
                                    <div class="item active" data-thumb="0"> 
                                        <asp:Image ID="imgProduct" runat="server" />
                                    </div>      
                                    
                                    <asp:Repeater ID="rptMainImages" runat="server">
                                        <ItemTemplate>
                                            <div class="item" data-thumb='<%# Eval("OrdNum") %>'> 
                                                <img src='Uploads/gallery/<%# Eval("PhotoName") %>' />
                                            </div>  
                                        </ItemTemplate>

                                    </asp:Repeater>
                                    
                                </div>                                 
                            </div>                             
                            <div class="clearfix"> 
                                <div id="thumbcarousel" class="carousel slide" data-interval="false"> 
                                    <div class="carousel-inner"> 
                                        <div data-target="#carousel" data-slide-to='0' class="thumb">
                                                <asp:Image ID="imgThumb" runat="server" />
                                            </div>
                                        <asp:Repeater ID="rptThumbs" runat="server">
                                        <ItemTemplate>
                                            <div data-target="#carousel" data-slide-to='<%# Eval("OrdNum") %>' class="thumb">
                                                <img src='Uploads/gallery/<%# Eval("PhotoName") %>' />
                                            </div>
                                        </ItemTemplate>

                                    </asp:Repeater>
                                      
                                    </div>                                     
                                    <a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> 
                                    <a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> 
                                </div>                                 
                            </div>                             
                        </div>   
                        
                    </asp:Panel>   
                        
                    <asp:Panel ID="pnlSingleImage" runat="server">
                        <div class="media-left productSlider"> 
                            <div id="carouselsingle" class="carousel slide" data-ride="carousel"> 
                                <div class="carousel-inner"> 
                                    <div class="item active" data-thumb="0"> 
                                        <asp:Image ID="imgSingle" runat="server" />
                                    </div> 
                                </div>
                            </div>
                        </div>
                        
                    </asp:Panel>
                        
                                          
                        <div class="media-body"> 
                                                        
                            <h2><asp:Label ID="lblProductTitle" runat="server" Text="Label"></asp:Label></h2> 
                            <h3><asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label></h3> 
                            <asp:Literal ID="litBasePrice" Visible="false" runat="server"></asp:Literal>
                            <asp:Literal ID="litCampaignID" Visible="false" runat="server"></asp:Literal>

                            <div class="tabArea"> 
                                <ul class="nav nav-tabs"> 
                                    <li class="active">
                                        <a data-toggle="tab" href="#details"><i class="fa fa-list" aria-hidden="true"></i> details</a>
                                    </li>                                     
                                    
                                  
                                    <li>
                                        <a data-toggle="tab" href="#shipping"><i class="fa fa-truck" aria-hidden="true"></i> shipping</a>
                                    </li>                                     
                                </ul>                                 
                                <div class="tab-content"> 
                                    <div id="details" class="tab-pane fade in active"> 
                                        <p><asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label></p> 
                                        <!--<ul class="list-unstyled"> 
                                            <li>Black, Crew Neck</li>                                             
                                            <li>75% Cotton, 25% Rayon</li>                                             
                                            <li>Waterbased Ink</li>                                             
                                            <li>Wash Cold, dry low</li>                                             
                                        </ul>   -->                                      
                                    </div>                                     
                                  
                                    <div id="shipping" class="tab-pane fade"> 
                                        <p>SHIPPING OPTIONS</p>

                                        <asp:Repeater ID="rptShipOptionsText" runat="server">
                                            <HeaderTemplate>
                                                <ul class="list-unstyled">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li><%# Eval("OptionName") + " " + ShippingCost(utils.ToD(Eval("Cost"))) %></li> 
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </ul>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                        
                                    </div>                                     
                                </div>                                 
                            </div>  

                            <!--<h3>Tax <asp:Label ID="lblTax" runat="server" Text="Label"></asp:Label></h3>-->
                            
                            <!--<p><a class="btn btn-border" href="https://www.facebook.com/sharer/sharer.php?u=http://socialshop.com.au/product.aspx?gid=39b06f98-1ccb-4524-85bd-6c22711e74c4" target="_blank"><i class="fa fa-facebook-square" aria-hidden="true"></i> Share on Facebook <i class="fa fa-angle-right" aria-hidden="true"></i></a></p> -->
                            <p>
                                
                                <div class="fb-share-button" data-href='<asp:Literal ID="litfbShareURL1" runat="server"></asp:Literal>' data-layout="button" data-size="large" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href='https://www.facebook.com/sharer/sharer.php?u=<asp:Literal ID="litfbShareURL2" runat="server"></asp:Literal>%2F&amp;src=sdkpreparse'>Share</a></div>

                            </p>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="pnlOptions" runat="server">

                                        <div class="col-xs-12">
                                            <p><b>Select your Options</b></p>
                                            <span class="quick-drop">
                                                <asp:DropDownList ID="ddlOptions" AutoPostBack="true" CssClass="dropdown" runat="server"></asp:DropDownList>
                                            </span> 
                                            <span class="quick-drop resizeWidth"> 
                                                <asp:DropDownList ID="ddlQty" AutoPostBack="true" CssClass="dropdown" runat="server"></asp:DropDownList>
                                            </span> 
                                        </div>
                                    </asp:Panel>

                                    <asp:Panel ID="pnlShipping" runat="server">
                                        <div class="col-xs-12"><b>Shipping:</b></div>
                                        <div class="col-xs-12">
                                            <asp:HiddenField ID="hfShippingCost" runat="server" />
                                            <asp:HiddenField ID="hfShipCostMulti" runat="server" />
                                                <asp:RadioButtonList AutoPostBack="true" ID="rblShipping" CssClass="shipping" runat="server">
                                               
                                                </asp:RadioButtonList>
                                            
                                        
                                        </div>
                                    </asp:Panel>
                                    <div class="col-xs-12 total">TOTAL: <b>
                                        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></b>

                                    </div>

                                    <asp:Panel ID="pnlError" Visible="false" runat="server">
                                        <div class="row">
                                              <div class="col-md-12">
                                                <div class="box-body">
                                                    <div class="alert alert-danger alert-dismissible">
                                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                        <h4><i class="icon fa fa-exclamation-triangle"></i>  Oops!</h4>
                                                        You still need to select some stuff to proceed - <br />
                                                        
                                                            <asp:Literal ID="litErrors" runat="server"></asp:Literal>
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                          </div>
                                      </asp:Panel>

                                    <div class="btn-area"> 
                                        <asp:LinkButton ID="lbtnPayPal" CssClass="btn btn-primary btn-lg" runat="server"><i class="fa fa-paypal" aria-hidden="true"></i> Buy with PayPal <i class="fa fa-angle-right" aria-hidden="true"></i></asp:LinkButton>
                                        <asp:Label ID="lblSoldOut" Visible="false" runat="server" Text="SOLD OUT"></asp:Label>
                                    </div> 
                              </ContentTemplate>
                            </asp:UpdatePanel>    
                            
                            
                                                              
                           
                        </div>                         
                    </div>                     
                </div>                 
            </div>     
            <!--        
            <div class="row productsContent"> 
                <div class="col-xs-12"> 
                    <div class="page-header"> 
                        <h4>Related Products</h4> 
                    </div>                     
                </div>                 
                <div class="col-md-3 col-sm-6 col-xs-12"> 
                    <div class="productBox"> 
                        <div class="productImage clearfix"> 
                            <img src="Uploads/15.jpg" />
                            <div class="productMasking"> 
                                <ul class="list-inline btn-group" role="group"> 
                                    <li>
                                        <a data-toggle="modal" href=".login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a>
                                    </li>                                     
                                    <li>
                                        <a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a>
                                    </li>                                     
                                    <li>
                                        <a class="btn btn-default" data-toggle="modal" href=".quick-view"><i class="fa fa-eye"></i></a>
                                    </li>                                     
                                </ul>                                 
                            </div>                             
                        </div>                         
                        <div class="productCaption clearfix"> 
                            <h5>Nike Sportswear</h5> 
                            <h3>$199</h3> 
                        </div>                         
                    </div>                     
                </div>                 
                <div class="col-md-3 col-sm-6 col-xs-12"> 
                    <div class="productBox"> 
                        <div class="productImage clearfix"> 
                            <img src="img/products/products-02.jpg" alt="products-img"> 
                            <div class="productMasking"> 
                                <ul class="list-inline btn-group" role="group"> 
                                    <li>
                                        <a data-toggle="modal" href=".login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a>
                                    </li>                                     
                                    <li>
                                        <a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a>
                                    </li>                                     
                                    <li>
                                        <a class="btn btn-default" data-toggle="modal" href=".quick-view"><i class="fa fa-eye"></i></a>
                                    </li>                                     
                                </ul>                                 
                            </div>                             
                        </div>                         
                        <div class="productCaption clearfix"> 
                            <h5>Dip Dyed Sweater</h5> 
                            <h3>$249</h3> 
                        </div>                         
                    </div>                     
                </div>                 
                <div class="col-md-3 col-sm-6 col-xs-12"> 
                    <div class="productBox"> 
                        <div class="productImage clearfix"> 
                            <img src="img/products/products-03.jpg" alt="products-img"> 
                            <div class="productMasking"> 
                                <ul class="list-inline btn-group" role="group"> 
                                    <li>
                                        <a data-toggle="modal" href=".login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a>
                                    </li>                                     
                                    <li>
                                        <a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a>
                                    </li>                                     
                                    <li>
                                        <a class="btn btn-default" data-toggle="modal" href=".quick-view"><i class="fa fa-eye"></i></a>
                                    </li>                                     
                                </ul>                                 
                            </div>                             
                        </div>                         
                        <div class="productCaption clearfix"> 
                            <h5>Scarf Ring Corner</h5> 
                            <h3>$179</h3> 
                        </div>                         
                    </div>                     
                </div>                 
                <div class="col-md-3 col-sm-6 col-xs-12"> 
                    <div class="productBox"> 
                        <div class="productImage clearfix"> 
                            <img src="img/products/products-04.jpg" alt="products-img"> 
                            <div class="productMasking"> 
                                <ul class="list-inline btn-group" role="group"> 
                                    <li>
                                        <a data-toggle="modal" href=".login-modal" class="btn btn-default"><i class="fa fa-heart"></i></a>
                                    </li>                                     
                                    <li>
                                        <a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-cart"></i></a>
                                    </li>                                     
                                    <li>
                                        <a class="btn btn-default" data-toggle="modal" href=".quick-view"><i class="fa fa-eye"></i></a>
                                    </li>                                     
                                </ul>                                 
                            </div>                             
                        </div>                         
                        <div class="productCaption clearfix"> 
                            <h5>Sun Buddies</h5> 
                            <h3>$149</h3> 
                        </div>                         
                    </div>                     
                </div>                 
            </div>          
            
            -->   
        </div>         
    </section>     
    <!-- FOOTER -->     
    <div class="footer clearfix"> 
        <div class="container"> 
            <div class="row"> 
              
                
                    
                        <div class="col-sm-6 col-xs-12">
                            <div class="newsletter clearfix"> 
                        <h4>Join SocialSHOP</h4> 
                        <h3>Sign up now</h3> 
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12"> 
                            <div class="newsletter pull-left">  
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                <asp:Panel ID="pnlSignUp" runat="server">
                        <p>Selling on SocialSHOP is currently by invitation only</p>
                        <p>Enter your email address to get put on the invitation waiting list</p> 
                                

                                
                        <div class="input-group"> 
                            <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="your email address" aria-describedby="basic-addon2" runat="server"></asp:TextBox>
                            <asp:LinkButton ID="lbtnSignUp" CssClass="input-group-addon" runat="server">go <i class="glyphicon glyphicon-chevron-right"></i></asp:LinkButton>
                            
                        </div> 
                                    </asp:Panel>
                                <asp:Literal ID="litSignUp" Visible="false" runat="server"><p>Thanks for signing up, you have gone on the invite list</p></asp:Literal>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                            </div>                        
                        </div>               
                               
            </div>             
        </div>         
    </div>     
    <!-- COPY RIGHT -->     
    <div class="copyRight clearfix"> 
        <div class="container"> 
            <div class="row"> 
                <div class="col-sm-7 col-xs-12"> 
                    <p>&copy; 2017 Copyright SocialSHOP.</p> 
                </div>                 
                <div class="col-sm-5 col-xs-12"> 
                    <ul class="list-inline"> 
                        <li>
                            <a href="https://www.facebook.com/socialshop.com.au"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="https://twitter.com/socialshopaus"><i class="fa fa-twitter"></i></a>
                        </li>                         
                        <!-- <li>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </li> 
                                                
                        <li>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                        </li>                         
                                                -->
                                                
                    </ul>                     
                </div>                 
            </div>             
        </div>         
    </div>     
</div> 
<!-- LOGIN MODAL --> 
<div class="modal fade login-modal" id="login" tabindex="-1" role="dialog"> 
    <div class="modal-dialog"> 
        <div class="modal-content"> 
            <div class="modal-header"> 
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                 
                <h3 class="modal-title">log in</h3> 
            </div>             
            <div class="modal-body"> 
                <form action="" method="POST" role="form"> 
                    <div class="form-group"> 
                        <label for="">Enter Email</label>                         
                        <input type="text" class="form-control" id=""> 
                    </div>                     
                    <div class="form-group"> 
                        <label for="">Password</label>                         
                        <input type="password" class="form-control" id=""> 
                    </div>                     
                    <div class="checkbox"> 
                        <label> 
                            <input type="checkbox"> Remember Me
                        </label>                         
                    </div>                     
                    <button type="submit" class="btn btn-primary btn-block">log in</button>                     
                    <button type="button" class="btn btn-link btn-block">Forgot Password?</button>                     
                </form>                 
            </div>             
        </div>         
    </div>     
</div> 
<!-- SIGN UP MODAL --> 
<div class="modal fade" id="signup" tabindex="-1" role="dialog"> 
    <div class="modal-dialog"> 
        <div class="modal-content"> 
            <div class="modal-header"> 
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                 
                <h3 class="modal-title">Create an account</h3> 
            </div>             
            <div class="modal-body"> 
                <form action="" method="POST" role="form"> 
                    <div class="form-group"> 
                        <label for="">Enter Email</label>                         
                        <input type="email" class="form-control" id=""> 
                    </div>                     
                    <div class="form-group"> 
                        <label for="">Password</label>                         
                        <input type="password" class="form-control" id=""> 
                    </div>                     
                    <div class="form-group"> 
                        <label for="">Confirm Password</label>                         
                        <input type="password" class="form-control" id=""> 
                    </div>                     
                    <button type="submit" class="btn btn-primary btn-block">Sign up</button>                     
                </form>                 
            </div>             
        </div>         
    </div>     
</div> 
<!-- PORDUCT QUICK VIEW MODAL --> 
<div class="modal fade quick-view" tabindex="-1" role="dialog"> 
    <div class="modal-dialog"> 
        <div class="modal-content"> 
            <div class="modal-body"> 
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                 
                <div class="media"> 
                    <div class="media-left"> 
                        <img class="media-object" src="img/products/quick-view/quick-view-01.jpg" alt="Image"> 
                    </div>                     
                    <div class="media-body"> 
                        <h2>Old Skool Navy</h2> 
                        <h3>$149</h3> 
                        <p>Classic sneaker from Vans. Cotton canvas and suede upper. Textile lining with heel stabilizer and ankle support. Contrasting laces. Sits on a classic waffle rubber sole.</p> 
                        <span class="quick-drop"> <select name="guiest_id3" id="guiest_id3" class="select-drop"> 
                                <option value="0">Size</option>                                 
                                <option value="1">Size 1</option>                                 
                                <option value="2">Size 2</option>                                 
                                <option value="3">Size 3</option>                                 
                            </select> </span> 
                        <span class="quick-drop resizeWidth"> <select name="guiest_id4" id="guiest_id4" class="select-drop"> 
                                <option value="0">Qty</option>                                 
                                <option value="1">Qty 1</option>                                 
                                <option value="2">Qty 2</option>                                 
                                <option value="3">Qty 3</option>                                 
                            </select> </span> 
                        <div class="btn-area"> 
                            <a href="#" class="btn btn-primary btn-block">Add to cart <i class="fa fa-angle-right" aria-hidden="true"></i></a> 
                        </div>                         
                    </div>                     
                </div>                 
            </div>             
        </div>         
    </div> 












            </form>
        <!-- Bootstrap core JavaScript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
            <!-- jQuery 2.2.3 -->
            <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
            <!-- jQuery UI 1.11.4 -->
            <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
            <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
            <script>
              $.widget.bridge('uibutton', $.ui.button);
            </script>
            <!-- Bootstrap 3.3.6 -->
            <script src="bootstrap/js/bootstrap.min.js"></script>

        <script src="ProductPageFiles/owl.carousel.js"></script>
        <script src="ProductPageFiles/jquery.selectbox-0.1.3.min.js"></script>
        <script src="ProductPageFiles/jquery.syotimer.js"></script>
        <script src="ProductPageFiles/custom.js"></script>

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug 
        <script src="assets/js/ie10-viewport-bug-workaround.js"></script>-->

    </body>
</html>
