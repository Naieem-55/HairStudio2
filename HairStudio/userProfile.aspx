<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="HairStudio.userProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid"  style="background-color:aquamarine">
        <div class="row">
            <div class="col-md-5">
                <br />

                <div class="card" style="background-color:#e6f2ff"> 
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                               <center>
                                   <img width="150px" src="images/style7.jpg" style="border-radius:60%"/>
                                    
                               </center>
                            </div>
                        </div>

                        
                        <div class="row">
                            <div class="col">
                               <center>
                                   <h3>My Profile</h3>
                                   <span>Account status - </span>
                                   <asp:Label class="badge rounded-pill bg-success" ID="Label1" runat="server" Text="Active"></asp:Label>
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

                                       
                                       <div class="col-md-12">
                                           <label>Full Name</label>
                                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                       </div>

                                   </div>
                               </div>


                                <div class="form-group">
                                    <div class="row">


                                        <div class="col-md-5">
                                            <label>Contact No</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                        </div>


                                        <div class="col-md-7">
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
                                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Zip Code"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>


                                <div class="form-group">
                                    <label>Full Address</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Full Address" class="input-group input-group-lg"></asp:TextBox>
                                </div>


                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h3>My Account</h3>
                                            <span>Account - </span>
                                            <asp:Label class="badge bg-info text-dark" ID="Label2" runat="server" Text="Active"></asp:Label>
                                        </center>
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
                                            <label>Member ID</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Member ID" ReadOnly="True"  TextMode="SingleLine"></asp:TextBox>
                                        </div>


                                        <div class="col-md-4">
                                            <label>Old Password</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox17" runat="server" placeholder="Old Password" ReadOnly="True" TextMode="Password"></asp:TextBox>
                                        </div>


                                        <div class="col-md-5">
                                            <label>New Password</label>
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

                <div class="card" style="background-color:#e6f2ff"> 
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                               <center>
                                   <img width="150px" src="images/resources.jpg" style="border-radius:60%"/>
                                    
                               </center>
                            </div>
                        </div>

                        
                        <div class="row">
                            <div class="col">
                               <center>
                                   <h3>My History</h3>
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
