<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminManagement.aspx.cs" Inherits="HairStudio.adminManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br /><br />

    <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/stuff1.jpg" style="border-radius:50%"/>
                                       
                                    </center>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Stuff Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-5  mx-auto">
                                <label>Stuff ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-7  mx-auto">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox7" runat="server" placeholder="Account Status" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton1" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton2" runat="server"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton3" runat="server"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>


                        </div>


                        <div class="row">


                            <div class="col-md-7 mx-auto">
                                <label>Stuff Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Author Name"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-5 mx-auto">
                                <label>Join Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Join Date" TextMode="Date"></asp:TextBox>

                                </div>
                            </div>

                        </div>

                         <div class="row">
                            <div class="col">


                                <div class="form-group">
                                    <label>Full Address</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Full Address" class="input-group input-group-lg"></asp:TextBox>
                                </div>

                                <div class="row">
                                    <div class="col-4">
                                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" />
                                    </div>
                                    <div class="col-4">
                                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" />
                                    </div>
                                    <div class="col-4">
                                        <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Remove" />
                                    </div>
                                </div>

                                <br />


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
                                            <label>ID</label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Member ID" ReadOnly="True"  TextMode="SingleLine"></asp:TextBox>
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
                                    <asp:Button class="btn btn-info btn-block" ID="Button5" runat="server" Text="Update" />
                                </div>

                            </div>
                        </div>


                    </div>
                </div>


                <br />

                <p> <i class="fa-solid fa-house-user"></i> <a href="homePage.aspx"><i>Back to Home Page</i></a></p>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">



                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Stuff List</h4>
                                    </center>
                            </div>
                        </div>

                       

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>


            </div>

        </div>
    </div>

</asp:Content>
