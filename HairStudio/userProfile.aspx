<%@ Page Title="Hair Studio - My Profile" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="HairStudio.userProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid section-form">
        <div class="row">
            <div class="col-md-5">
                <br />

                <div class="card section-card-blue">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                               <div class="text-center">
                                   <img class="login-img profile-img" src="images/style7.jpg" alt="User profile photo"/>

                               </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                               <div class="text-center">
                                   <h3>My Profile</h3>
                                   <span>Account status - </span>
                                   <asp:Label class="badge rounded-pill bg-success" ID="Label1" runat="server" Text="Active"></asp:Label>
                               </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">

                               <div class="form-group">
                                   <div class="row">


                                       <div class="col-md-12">
                                           <asp:Label AssociatedControlID="TextBox1" runat="server">Full Name</asp:Label>
                                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                       </div>

                                   </div>
                               </div>


                                <div class="form-group">
                                    <div class="row">


                                        <div class="col-md-5">
                                            <asp:Label AssociatedControlID="TextBox2" runat="server">Contact No</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                        </div>


                                        <div class="col-md-7">
                                            <asp:Label AssociatedControlID="TextBox4" runat="server">Email ID</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="row">


                                        <div class="col-md-4">
                                            <asp:Label AssociatedControlID="TextBox5" runat="server">State</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="State"></asp:TextBox>
                                        </div>


                                        <div class="col-md-4">
                                            <asp:Label AssociatedControlID="TextBox6" runat="server">City</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox>
                                        </div>


                                        <div class="col-md-4">
                                            <asp:Label AssociatedControlID="TextBox3" runat="server">Zip Code</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Zip Code"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>


                                <div class="form-group">
                                    <asp:Label AssociatedControlID="TextBox7" runat="server">Full Address</asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Full Address"></asp:TextBox>
                                </div>


                                <div class="row">
                                    <div class="col">
                                        <div class="text-center">
                                            <h3>My Account</h3>
                                            <span>Account - </span>
                                            <asp:Label class="badge bg-info text-dark" ID="Label2" runat="server" Text="Active"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row">


                                        <div class="col-md-3">
                                            <asp:Label AssociatedControlID="TextBox8" runat="server">Member ID</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Member ID" ReadOnly="True"  TextMode="SingleLine"></asp:TextBox>
                                        </div>


                                        <div class="col-md-4">
                                            <asp:Label AssociatedControlID="TextBox17" runat="server">Old Password</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox17" runat="server" placeholder="Old Password" ReadOnly="True" TextMode="Password"></asp:TextBox>
                                        </div>


                                        <div class="col-md-5">
                                            <asp:Label AssociatedControlID="TextBox18" runat="server">New Password</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox18" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                        </div>


                                    </div>

                                    <br />
                                </div>



                                <div class="form-group">
                                    <asp:Button class="btn btn-info btn-block" ID="Button1" runat="server" Text="Update" />
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

                <br />

                <p> <i class="fa-solid fa-person-walking-luggage"></i> <a href="userLogin.aspx"><i>Go Login Page</i></a></p>


            </div>

            <div class="col-md-7">
                <br />

                <div class="card section-card-blue">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                               <div class="text-center">
                                   <img class="login-img profile-img" src="images/resources.jpg" alt="Order history icon"/>

                               </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                               <div class="text-center">
                                   <h3>My History</h3>
                               </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>

                            </div>
                        </div>


                    </div>
                </div>

                <br/>

            </div>
        </div>
    </div>

</asp:Content>
