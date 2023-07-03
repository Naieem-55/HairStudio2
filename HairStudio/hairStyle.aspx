<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="hairStyle.aspx.cs" Inherits="HairStudio.hairStyle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/hairStyleCSS.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section style="background-color:antiquewhite">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <p style="font-size:50px;color:midnightblue;text-align:center">HAIR STUDIO</p>
                <p style="font-size:40px;font-style:italic;text-align:center">Hair Looks</p>
            </div>
        </div>
    </section>

    <section style="background-color:azure">
        <div class="container-fluid" style="margin-top:20PX;margin-bottom:20px">

            <div class="row row-cols-1 row-cols-md-2 g-3">

                <div class="col">
                    <div class="card">
                        <img src="images/style7.jpg"  class="card-img-top" height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Butch cut</h5>
                            <p class="card-text">Order ID : o20</p>
                         
                        </div>
                        <p style="font-size:20px;margin-left:10px">Price : 340 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button7" runat="server" Text="ORDER" OnClick="Button7_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style8.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Crew cut</h5>
                            <p class="card-text">Order ID : o21</p>
                        </div>

                        <p style="font-size:20px;margin-left:10px">Price : 230 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button8" runat="server" Text="ORDER" OnClick="Button8_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style9.jpg" class="card-img-top" height="200px" />
                        <div class="card-body">
                            <h5 class="card-title">Flattop</h5>
                            <p class="card-text">Order ID : o22</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 210 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button9" runat="server" Text="ORDER" OnClick="Button9_Click" />
                        </div>
                    </div>
                </div>


            </div>
        </div>

         <div class="container-fluid" style="margin-top:20PX;margin-bottom:20px">

            <div class="row row-cols-1 row-cols-md-2 g-3">

                <div class="col">
                    <div class="card">
                        <img src="images/style4.jpg"  class="card-img-top" height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Undercut</h5>
                            <p class="card-text">Order ID : o23</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 240 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button10" runat="server" Text="ORDER" OnClick="Button10_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style5.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Hi-top fade</h5>
                            <p class="card-text">Order ID : o24</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 300 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button11" runat="server" Text="ORDER" OnClick="Button11_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style6.jpg" class="card-img-top" height="200px" />
                        <div class="card-body">
                            <h5 class="card-title">Fauxhawk</h5>
                            <p class="card-text">Order ID : o25</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 270 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button12" runat="server" Text="ORDER" OnClick="Button12_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section style="background-color:cornsilk">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <p style="font-size:50px;color:midnightblue;text-align:center">More Exclusive Style</p>
                <p style="font-size:40px;font-style:italic;text-align:center">Choose yours</p>
            </div>
        </div>
    </section>

    <section style="background-color:azure">
        <div class="container-fluid" style="margin-top:20PX;margin-bottom:20px">

            <div class="row row-cols-1 row-cols-md-2 g-3">

                <div class="col">
                    <div class="card">
                        <img src="images/style1.jpg"  class="card-img-top" height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Ducktail cut</h5>
                            <p class="card-text">Order ID : o26</p>
                         
                        </div>
                        <p style="font-size:20px;margin-left:10px">Price : 300 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button13" runat="server" Text="ORDER" OnClick="Button13_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style2.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Slicked-back</h5>
                            <p class="card-text">Order ID : o27</p>
                        </div>

                        <p style="font-size:20px;margin-left:10px">Price : 250 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button14" runat="server" Text="ORDER" OnClick="Button14_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style3.jpg" class="card-img-top" height="200px" />
                        <div class="card-body">
                            <h5 class="card-title">Jheri curl</h5>
                            <p class="card-text">Order ID : o28</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 200 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button15" runat="server" Text="ORDER" OnClick="Button15_Click" />
                        </div>
                    </div>
                </div>


            </div>
        </div>

         <div class="container-fluid" style="margin-top:20PX;margin-bottom:20px">

            <div class="row row-cols-1 row-cols-md-2 g-3">

                <div class="col">
                    <div class="card">
                        <img src="images/style4.jpg"  class="card-img-top" height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Mod cut</h5>
                            <p class="card-text">Order ID : o29</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 390 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button16" runat="server" Text="ORDER" OnClick="Button16_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style5.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Pompadour</h5>
                            <p class="card-text">Order ID : o30</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 230 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button17" runat="server" Text="ORDER" OnClick="Button17_Click" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style6.jpg" class="card-img-top" height="200px" />
                        <div class="card-body">
                            <h5 class="card-title">Shape-Up</h5>
                            <p class="card-text">Order ID : o31</p>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 310 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button18" runat="server" Text="ORDER" OnClick="Button18_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <p> <i class="fa-solid fa-house-user"></i> <a href="homePage.aspx"><i>Go to Cart</i></a></p>


</asp:Content>
