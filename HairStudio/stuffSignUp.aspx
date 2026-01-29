<%@ Page Title="Hair Studio - Staff Sign Up" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="stuffSignUp.aspx.cs" Inherits="HairStudio.stuffSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                    <img class="login-img" src="images/generalUser.png" alt="Staff sign up icon"/>

                               </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                               <div class="text-center">
                                   <h3>Staff Sign Up</h3>
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
                                   <asp:Label AssociatedControlID="TextBox1" runat="server">Staff ID</asp:Label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                               </div>

                                <div class="form-group">
                                    <asp:Label AssociatedControlID="TextBox2" runat="server">Password</asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
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
