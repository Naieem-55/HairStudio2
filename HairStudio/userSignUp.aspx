<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userSignUp.aspx.cs" Inherits="HairStudio.userSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid"  style="background-color:aquamarine">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <br />

                <div class="card" style="background-color:#e6f2ff"> 
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                               <center>
                                   <img width="150px" src="images/userReg.jpg" style="border-radius:60%"/>
                                    
                               </center>
                            </div>
                        </div>

                        
                        <div class="row">
                            <div class="col">
                               <center>
                                   <h3>Sign Up</h3>
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
                                   <div class="row">

                                       
                                       <div class="col-md-6">
                                           <label>Full Name</label>
                                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                       </div>

                                       
                                       <div class="col-md-6">
                                           <label>Date Of Birth</label>
                                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Date Of Birth" TextMode="Date"></asp:TextBox>
                                       </div>

                                   </div>
                               </div>


                                <div class="form-group">
                                    <div class="row">


                                        <div class="col-md-6">
                                            <label>Contact No</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                        </div>


                                        <div class="col-md-6">
                                            <label>Email ID</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="row">


                                        <div class="col-md-4">
                                            <label>State</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="State"></asp:TextBox>
                                        </div>


                                        <div class="col-md-4">
                                            <label>City</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox>
                                        </div>


                                        <div class="col-md-4">
                                            <label>Zip Code</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row">


                                        <div class="col-md-5">
                                            <label>User ID</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="User ID"></asp:TextBox>
                                        </div>


                                        <div class="col-md-7">
                                            <label>Password</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Full Address</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Full Address" class="input-group input-group-lg"></asp:TextBox>
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
