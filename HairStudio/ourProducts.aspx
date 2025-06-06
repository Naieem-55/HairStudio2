﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ourProducts.aspx.cs" Inherits="HairStudio.ourProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/ourProductsCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section style="background-color:antiquewhite">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <p style="font-size:50px;color:midnightblue;text-align:center">HAIR STUDIO</p>
                <p style="font-size:40px;font-style:italic;text-align:center">Our Quality Products</p>
            </div>
        </div>
    </section>

    <section style="background-color:azure">
        <div class="container-fluid" style="margin-top:20PX;margin-bottom:20px">

            <div class="row row-cols-1 row-cols-md-2 g-3">

                <div class="col">
                    <div class="card">
                        <img src="images/product7.jpg"  class="card-img-top" height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">HAIR GEL</h5>
                            <p class="card-text">Product ID : o10</p>
                            <p class="card-text">Hair gel is a very popular styling product that is usually used on wet hair.</p>
                        </div>
                        <p style="font-size:20px;margin-left:10px">Price : 300 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button1" runat="server" Text="PURCHASE" OnClick="Button1_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product8.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">HAIR BRUSH</h5>
                            <p class="card-text">Product ID : o11</p>
                            <p class="card-text">Hair brush is essentially used to design hair in unique style with gorgeus look.</p>
                        </div>

                        <p style="font-size:20px;margin-left:10px">Price : 250 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button2" runat="server" Text="PURCHASE" OnClick="Button2_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product9.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">CHARCOAL SHAMPOO</h5>
                            <p class="card-text">Product ID : o12</p>
                            <p class="card-text">Dry shampoo is a powder or a spray that dries really fast and is used to clean your hair.</p>
                        </div>

                        <p style="font-size:20px;margin-left:10px">Price : 560 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button3" runat="server" Text="PURCHASE" OnClick="Button3_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </div>

         <div class="container-fluid" style="margin-top:20PX;margin-bottom:20px">

            <div class="row row-cols-1 row-cols-md-2 g-3">

                <div class="col">
                    <div class="card">
                        <img src="images/product10.jpg"  class="card-img-top" height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">FRESH WASH</h5>
                            <p class="card-text">Product ID : o13</p>
                            <p class="card-text">Smooth and light fesh wash to make skin glow and healthy.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 340 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button4" runat="server" Text="PURCHASE" OnClick="Button4_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product5.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">SNOW</h5>
                            <p class="card-text">Product ID : o14</p>
                            <p class="card-text">A stunning phenomenon where delicate white flakes dance upon one's lustrous locks.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 700 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button5" runat="server" Text="PURCHASE" OnClick="Button5_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product6.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">COMBO PACKAGE</h5>
                            <p class="card-text">Product ID : o15</p>
                            <p class="card-text">Dry shampoo , Hair gel , fresh wash , cream and hair brush togather.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 1200 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button6" runat="server" Text="PURCHASE" OnClick="Button6_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section style="background-color:azure">
        <div class="container-fluid" style="margin-top:20PX;margin-bottom:20px">

            <div class="row row-cols-1 row-cols-md-2 g-3">

                <div class="col">
                    <div class="card">
                        <img src="images/product7.jpg"  class="card-img-top" height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">BEARD OIL</h5>
                            <p class="card-text">Product ID : o16</p>
                            <p class="card-text">A nourishing elixir that transforms unruly whiskers into a sleek.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 450 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button7" runat="server" Text="PURCHASE" OnClick="Button7_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product8.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">HAND WASH</h5>
                            <p class="card-text">Product ID : o17</p>
                            <p class="card-text">A cleansing ritual that purifies and protects, leaving hands refreshed.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 220 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button8" runat="server" Text="PURCHASE" OnClick="Button8_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product9.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">SHAMPOO</h5>
                            <p class="card-text">Product ID : o18</p>
                            <p class="card-text">Liquid magic for clean, healthy, and luxuriously vibrant hair.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 520 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button9" runat="server" Text="PURCHASE" OnClick="Button9_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </div>

         <div class="container-fluid" style="margin-top:20PX;margin-bottom:20px">

            <div class="row row-cols-1 row-cols-md-2 g-3">

                <div class="col">
                    <div class="card">
                        <img src="images/product10.jpg"  class="card-img-top" height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">COLOUR GEL</h5>
                            <p class="card-text">Product ID : o19</p>
                            <p class="card-text">A vibrant potion that adds life and personality to your nails.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 700 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button10" runat="server" Text="PURCHASE" OnClick="Button10_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product11.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">HAIR STRAIGHTNER</h5>
                            <p class="card-text">Product ID : o20</p>
                            <p class="card-text">A transformative tool for sleek, smooth, and stylish locks.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 800 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button11" runat="server" Text="PURCHASE" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product12.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">CHARCOAL GEL</h5>
                            <p class="card-text">Product ID : o21</p>
                            <p class="card-text">A versatile substance that shapes, defines, and holds your style.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 490 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button12" runat="server" Text="PURCHASE" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section style="background-color:azure">
        <div class="container-fluid" style="margin-top:20PX;margin-bottom:20px">

            <div class="row row-cols-1 row-cols-md-2 g-3">

                <div class="col">
                    <div class="card">
                        <img src="images/product13.jpg"  class="card-img-top" height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">DEEP SOAP</h5>
                            <p class="card-text">Product ID : o22</p>
                            <p class="card-text">A cleansing potion that purifies and rejuvenates your skin.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 350 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button13" runat="server" Text="PURCHASE" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product14.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">ARGAN GEL</h5>
                            <p class="card-text">Product ID : o23</p>
                            <p class="card-text">A flexible and sculpting agent for hair and artistic expression.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 600 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button14" runat="server" Text="PURCHASE" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product15.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">GEL SHAMPOO</h5>
                            <p class="card-text">Product ID : o24</p>
                            <p class="card-text">A revitalizing elixir that cleanses and nourishes your precious hair.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 600 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button15" runat="server" Text="PURCHASE" />
                        </div>
                    </div>
                </div>

            </div>
        </div>

         <div class="container-fluid" style="margin-top:20PX;margin-bottom:20px">

            <div class="row row-cols-1 row-cols-md-2 g-3">

                <div class="col">
                    <div class="card">
                        <img src="images/product16.jpg"  class="card-img-top" height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">PERFUME</h5>
                            <p class="card-text">Product ID : o24</p>
                            <p class="card-text">An aromatic enchantment that evokes memories and ignites emotions.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 750 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button16" runat="server" Text="PURCHASE" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product17.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">SHAVING CREAM</h5>
                            <p class="card-text">Product ID : o26</p>
                            <p class="card-text">Smooth shield that ensures a flawless shaving experience.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 430 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button17" runat="server" Text="PURCHASE" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/product18.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">TELCOM POWDER</h5>
                            <p class="card-text">Product ID : o27</p>
                            <p class="card-text">A soothing remedy for skin ailments and discomfort & makes glow.</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 360 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button18" runat="server" Text="PURCHASE" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <p> <i class="fa-solid fa-house-user"></i> <a href="homePage.aspx"><i>Back to Home Page</i></a></p>

</asp:Content>
