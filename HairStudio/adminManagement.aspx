<%@ Page Title="Hair Studio - Admin Management" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminManagement.aspx.cs" Inherits="HairStudio.adminManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%-- DataTables --%>
    <link href="dataTables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="dataTables/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br /><br />

    <div class="container-fluid section-warm">
        <br /><br />
        <div class="row">
            <div class="col-md-5">

                <div class="card" id="one">
                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <div class="text-center">
                                    <img width="150px" src="images/stuff1.jpg" class="profile-img" alt="Staff member photo"/>

                                    </div>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col">
                                <div class="text-center">
                                    <h4>Staff Details</h4>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-5  mx-auto">
                                <asp:Label AssociatedControlID="TextBox1" runat="server">Staff ID</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-7  mx-auto">
                                <asp:Label AssociatedControlID="TextBox7" runat="server">Account Status</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox7" runat="server" placeholder="Account Status" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>


                        </div>


                        <div class="row">


                            <div class="col-md-7 mx-auto">
                                <asp:Label AssociatedControlID="TextBox2" runat="server">Staff Name</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Staff Name"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-5 mx-auto">
                                <asp:Label AssociatedControlID="TextBox3" runat="server">Join Date</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Join Date" TextMode="Date"></asp:TextBox>

                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label AssociatedControlID="TextBox4" runat="server">Email</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email"></asp:TextBox>

                                </div>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">


                                <div class="form-group">
                                    <asp:Label AssociatedControlID="TextBox11" runat="server">Full Address</asp:Label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Full Address"></asp:TextBox>
                                </div>

                                <div class="row">
                                    <div class="col-4">
                                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                                    </div>
                                    <div class="col-4">
                                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                                    </div>
                                    <div class="col-4">
                                        <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Remove" OnClick="Button4_Click" />
                                    </div>
                                </div>

                                <br />


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


                                        <div class="col-md-5">
                                            <asp:Label AssociatedControlID="TextBox12" runat="server">ID</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="ID"  TextMode="SingleLine"></asp:TextBox>
                                        </div>


                                        <div class="col-md-7">
                                            <asp:Label AssociatedControlID="TextBox18" runat="server">New Password</asp:Label>
                                            <asp:TextBox CssClass="form-control" ID="TextBox18" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                        </div>


                                    </div>

                                    <br />
                                </div>



                                <div class="form-group">
                                    <asp:Button class="btn btn-info btn-block" ID="Button5" runat="server" Text="Update" OnClick="Button5_Click" />
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

                <div class="card" id="two">
                    <div class="card-body">



                        <div class="row">
                            <div class="col">
                                <div class="text-center">
                                        <h4>Staff List</h4>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hairStudioDbConnectionString %>" SelectCommand="SELECT [stuffId], [email], [name], [status] FROM [stuffTBL]"></asp:SqlDataSource>

                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="stuffId">
                                    <Columns>
                                        <asp:BoundField DataField="stuffId" HeaderText="stuffId" ReadOnly="True" SortExpression="stuffId"></asp:BoundField>
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email"></asp:BoundField>
                                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
                                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status"></asp:BoundField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>


            </div>

        </div>
    </div>

</asp:Content>
