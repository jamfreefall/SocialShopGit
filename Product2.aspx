﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product2.aspx.cs" Inherits="Product2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!-- GOOGLE FONT -->
    <link href='https://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>
    <link href="css/Product/owl.carousel.css" rel="stylesheet" />

    <link href="css/Product/style.css" rel="stylesheet" />
    <link href="css/Product/select_option1.css" rel="stylesheet" />

    <link href="css/Product/default.css" rel="stylesheet" />
    <link href="css/Product/settings.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">
     
        
        <div class="main-wrapper"> 
            <!-- HEADER -->             
            <div class="header clearfix"> 
                <!-- TOPBAR -->                 
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
                </div>                 
                      
    </div>     
    <!-- LIGHT SECTION -->     
    <section class="lightSection clearfix pageHeader"> 
        <div class="container"> 
            <div class="row"> 
                <div class="col-xs-6"> 
                    <div class="page-title"> 
                        <h2>Single Product</h2> 
                    </div>                     
                </div>                 
                <div class="col-xs-6"> 
                    <ol class="breadcrumb pull-right"> 
                        <li> 
                            <a href="index.html">Home</a> 
                        </li>                         
                        <li class="active">Single Product</li>                         
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
                        <div class="media-left productSlider"> 
                            <div id="carousel" class="carousel slide" data-ride="carousel"> 
                                <div class="carousel-inner"> 
                                    <div class="item active" data-thumb="0"> 
                                        <img src="Uploads/15.jpg" />
                                    </div>                                     
                                    <div class="item" data-thumb="1"> 
                                        <img src="Uploads/16.jpg" />
                                    </div>                                     
                                    <div class="item" data-thumb="2"> 
                                        <img src="Uploads/15.jpg" />
                                    </div>                                     
                                    <div class="item" data-thumb="3"> 
                                        <img src="Uploads/16.jpg" />
                                    </div>                                     
                                </div>                                 
                            </div>                             
                            <div class="clearfix"> 
                                <div id="thumbcarousel" class="carousel slide" data-interval="false"> 
                                    <div class="carousel-inner"> 
                                        <div data-target="#carousel" data-slide-to="0" class="thumb">
                                            <img src="Uploads/15.jpg" />
                                        </div>                                         
                                        <div data-target="#carousel" data-slide-to="1" class="thumb">
                                            <img src="Uploads/16.jpg" />
                                        </div>                                         
                                        <div data-target="#carousel" data-slide-to="2" class="thumb">
                                           <img src="Uploads/15.jpg" />
                                        </div>                                         
                                        <div data-target="#carousel" data-slide-to="3" class="thumb">
                                            <img src="Uploads/16.jpg" />
                                        </div>                                         
                                    </div>                                     
                                    <a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> 
                                    <a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> 
                                </div>                                 
                            </div>                             
                        </div>                         
                        <div class="media-body"> 
                                                        
                            <h2>Pellentesque non risus quis tellus</h2> 
                            <h3>$149</h3> 
                            <p>Mauris lobortis augue ex, ut faucibus nisi mollis ac. Sed volutpat scelerisque ex ut ullamcorper. Cras at velit quis sapien dapibus laoreet a id odio. Sed sit amet accumsan ante, eu congue metus. Aenean eros tortor, cursus quis feugiat sed, vestibulum vel purus. Etiam aliquam turpis quis blandit finibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor placerat lectus, facilisis ornare leo tincidunt vel. Duis rutrum felis felis, eget malesuada massa tincidunt a.</p> 
                            
                            <span class="quick-drop"> <select name="guiest_id3" id="guiest_id3" class="select-drop"> 
                                    <option value="0">Size</option>                                     
                                    <option value="1">Small</option>                                     
                                    <option value="2">Medium</option>                                     
                                    <option value="3">Big</option>                                     
                                </select> </span> 
                            <span class="quick-drop resizeWidth"> <select name="guiest_id4" id="guiest_id4" class="select-drop"> 
                                    <option value="0">Qty</option>                                     
                                    <option value="1">1</option>                                     
                                    <option value="2">2</option>                                     
                                    <option value="3">3</option>                                     
                                </select> </span> 
                            <div class="btn-area"> 
                                <a href="cart-page.html" class="btn btn-primary btn-block">Add to cart <i class="fa fa-angle-right" aria-hidden="true"></i></a> 
                            </div>                             
                            <div class="tabArea"> 
                                <ul class="nav nav-tabs"> 
                                    <li class="active">
                                        <a data-toggle="tab" href="#details">details</a>
                                    </li>                                     
                                    <li>
                                        <a data-toggle="tab" href="#about-art">about art</a>
                                    </li>                                     
                                    <li>
                                        <a data-toggle="tab" href="#sizing">sizing</a>
                                    </li>                                     
                                    <li>
                                        <a data-toggle="tab" href="#shipping">shipping</a>
                                    </li>                                     
                                </ul>                                 
                                <div class="tab-content"> 
                                    <div id="details" class="tab-pane fade in active"> 
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p> 
                                        <ul class="list-unstyled"> 
                                            <li>Black, Crew Neck</li>                                             
                                            <li>75% Cotton, 25% Rayon</li>                                             
                                            <li>Waterbased Ink</li>                                             
                                            <li>Wash Cold, dry low</li>                                             
                                        </ul>                                         
                                    </div>                                     
                                    <div id="about-art" class="tab-pane fade"> 
                                        <p>Nulla facilisi. Mauris efficitur, massa et iaculis accumsan, mauris velit ultrices purus, quis condimentum nibh dolor ut tortor. Donec egestas tortor quis mattis gravida. Ut efficitur elit vitae dignissim volutpat. </p> 
                                    </div>                                     
                                    <div id="sizing" class="tab-pane fade"> 
                                        <p>Praesent dui felis, gravida a auctor at, facilisis commodo ipsum. Cras eu faucibus justo. Nullam varius cursus nisi, sed elementum sem sagittis at. Nulla tellus massa, vestibulum a commodo facilisis, pulvinar convallis nunc.</p> 
                                    </div>                                     
                                    <div id="shipping" class="tab-pane fade"> 
                                        <p>Mauris lobortis augue ex, ut faucibus nisi mollis ac. Sed volutpat scelerisque ex ut ullamcorper. Cras at velit quis sapien dapibus laoreet a id odio. Sed sit amet accumsan ante, eu congue metus. Aenean eros tortor, cursus quis feugiat sed, vestibulum vel purus.</p> 
                                    </div>                                     
                                </div>                                 
                            </div>                             
                        </div>                         
                    </div>                     
                </div>                 
            </div>             
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
        </div>         
    </section>     
    <!-- FOOTER -->     
    <div class="footer clearfix"> 
        <div class="container"> 
            <div class="row"> 
                <div class="col-sm-2 col-xs-12"> 
                    <div class="footerLink"> 
                        <h5>Accessories</h5> 
                        <ul class="list-unstyled"> 
                            <li>
                                <a href="#">Body care </a>
                            </li>                             
                            <li>
                                <a href="#">Chambray </a>
                            </li>                             
                            <li>
                                <a href="#">Floral </a>
                            </li>                             
                            <li>
                                <a href="#">Rejuvination </a>
                            </li>                             
                            <li>
                                <a href="#">Shaving </a>
                            </li>                             
                            <li>
                                <a href="#">Toilette </a>
                            </li>                             
                        </ul>                         
                    </div>                     
                </div>                 
                <div class="col-sm-2 col-xs-12"> 
                    <div class="footerLink"> 
                        <h5>BRANDS</h5> 
                        <ul class="list-unstyled"> 
                            <li>
                                <a href="#">Barbour </a>
                            </li>                             
                            <li>
                                <a href="#">Brioni </a>
                            </li>                             
                            <li>
                                <a href="#">Oliver Spencer</a>
                            </li>                             
                            <li>
                                <a href="#">Belstaff</a>
                            </li>                             
                        </ul>                         
                    </div>                     
                </div>                 
                <div class="col-sm-2 col-xs-12"> 
                    <div class="footerLink"> 
                        <h5>Accessories</h5> 
                        <ul class="list-unstyled"> 
                            <li>
                                <a href="#">Body care </a>
                            </li>                             
                            <li>
                                <a href="#">Chambray </a>
                            </li>                             
                            <li>
                                <a href="#">Floral </a>
                            </li>                             
                            <li>
                                <a href="#">Rejuvination </a>
                            </li>                             
                            <li>
                                <a href="#">Shaving </a>
                            </li>                             
                            <li>
                                <a href="#">Toilette </a>
                            </li>                             
                        </ul>                         
                    </div>                     
                </div>                 
                <div class="col-sm-2 col-xs-12"> 
                    <div class="footerLink"> 
                        <h5>Get in Touch</h5> 
                        <ul class="list-unstyled"> 
                            <li>Call us at (555)-555-5555</li>                             
                            <li>
                                <a href="mailto:support@iamabdus.com">support@iamabdus.com</a>
                            </li>                             
                        </ul>                         
                    </div>                     
                </div>                 
                <div class="col-sm-4 col-xs-12"> 
                    <div class="newsletter clearfix"> 
                        <h4>Newsletter</h4> 
                        <h3>Sign up now</h3> 
                        <p>Enter your email address and get notified about new products. We hate spam!</p> 
                        <div class="input-group"> 
                            <input type="text" class="form-control" placeholder="your email address" aria-describedby="basic-addon2"> 
                            <a href="#" class="input-group-addon" id="basic-addon2">go <i class="glyphicon glyphicon-chevron-right"></i></a> 
                        </div>                         
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
                    <p>&copy; 2017 Copyright Social Shop.</p> 
                </div>                 
                <div class="col-sm-5 col-xs-12"> 
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


</asp:Content>


