<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="hairStyle.aspx.cs" Inherits="HairStudio.hairStyle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
                         
                        </div>
                        <p style="font-size:20px;margin-left:10px">Price : 340 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button7" runat="server" Text="ORDER" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style8.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Crew cut</h5>
                        </div>

                        <p style="font-size:20px;margin-left:10px">Price : 230 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button8" runat="server" Text="ORDER" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style9.jpg" class="card-img-top" height="200px" />
                        <div class="card-body">
                            <h5 class="card-title">Flattop</h5>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 210 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button9" runat="server" Text="ORDER" />
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
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 240 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button10" runat="server" Text="ORDER" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style5.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Hi-top fade</h5>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 300 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button11" runat="server" Text="ORDER" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style6.jpg" class="card-img-top" height="200px" />
                        <div class="card-body">
                            <h5 class="card-title">Fauxhawk</h5>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 270 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button12" runat="server" Text="ORDER" />
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
                         
                        </div>
                        <p style="font-size:20px;margin-left:10px">Price : 300 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button13" runat="server" Text="ORDER" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style2.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Slicked-back</h5>
                        </div>

                        <p style="font-size:20px;margin-left:10px">Price : 250 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button14" runat="server" Text="ORDER" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style3.jpg" class="card-img-top" height="200px" />
                        <div class="card-body">
                            <h5 class="card-title">Jheri curl</h5>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 200 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button15" runat="server" Text="ORDER" />
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
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 390 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button16" runat="server" Text="ORDER" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style5.jpg"  class="card-img-top"  height="200px"/>
                        <div class="card-body">
                            <h5 class="card-title">Pompadour</h5>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 230 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button17" runat="server" Text="ORDER" />
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card">
                        <img src="images/style6.jpg" class="card-img-top" height="200px" />
                        <div class="card-body">
                            <h5 class="card-title">Shape-Up</h5>
                        </div>

                        <p style="font-size: 20px; margin-left: 10px">Price : 310 BDT</p>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block" ID="Button18" runat="server" Text="ORDER" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <p> <i class="fa-solid fa-house-user"></i> <a href="homePage.aspx"><i>Go to Cart</i></a></p>


</asp:Content>
