<%@ Page Title="Hair Studio - Sign Up" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userSignUp.aspx.cs" Inherits="HairStudio.userSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            if (typeof PasswordStrength !== 'undefined') {
                PasswordStrength.init('#<%= TextBox10.ClientID %>');
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid section-form">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <br />

                <div class="card section-card-blue">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                               <div class="text-center">
                                   <img class="login-img profile-img" src="images/userReg.jpg" alt="User registration icon"/>

                               </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                               <div class="text-center">
                                   <h3>Sign Up</h3>
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


                                       <div class="col-md-6">
                                           <asp:Label AssociatedControlID="TextBox1" runat="server">Full Name</asp:Label>
                                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                       </div>


                                       <div class="col-md-6">
                                           <asp:Label AssociatedControlID="TextBox3" runat="server">Date Of Birth</asp:Label>
                                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Date Of Birth" TextMode="Date"></asp:TextBox>
                                       </div>

                                   </div>
                               </div>


                                <div class="form-group">
                                    <div class="row">


                                        <div class="col-md-6">
                                            <asp:Label AssociatedControlID="TextBox2" runat="server">Contact No</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                        </div>


                                        <div class="col-md-6">
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
                                            <asp:Label AssociatedControlID="TextBox7" runat="server">Zip Code</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row">


                                        <div class="col-md-5">
                                            <asp:Label AssociatedControlID="TextBox9" runat="server">User ID</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="User ID"></asp:TextBox>
                                        </div>


                                        <div class="col-md-7">
                                            <asp:Label AssociatedControlID="TextBox10" runat="server">Password</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label AssociatedControlID="TextBox8" runat="server">Full Address</asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Full Address"></asp:TextBox>
                                </div>



                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-block" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

                <br />

                <p> <i class="fa-solid fa-person-walking-luggage"></i> <a href="userLogin.aspx"><i>Go Login Page</i></a></p>


            </div>
        </div>
    </div>
</asp:Content>
