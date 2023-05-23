<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="HairStudio.userLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid"  style="background-color:aquamarine">
        <div class="row">
            <div class="col-md-6 mx-auto">

                <br />
                <div class="card"  style="background-color:#e6f2ff"> 
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                               <center>
                                    <img width="150px" src="images/generalUser.png"/>
                                    
                               </center>
                            </div>
                        </div>

                        
                        <div class="row">
                            <div class="col">
                               <center>
                                   <h3>User Login</h3>
                               </center>
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
                                   <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="User ID"></asp:TextBox>
                               </div>

                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="User Password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-block" ID="Button1" runat="server" Text="Login" />
                                </div>

                                
                                <div class="form-group">
                                    <a href="userSignUp.aspx"><input class="btn btn-info btn-block" ID="Button2" type="button" value="Sign Up" /></a>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

                <br />

                <p> <i class="fa-solid fa-house-user"></i> <a href="homePage.aspx"><i>Back to Home Page</i></a></p>


            </div>
        </div>
    </div>
</asp:Content>
