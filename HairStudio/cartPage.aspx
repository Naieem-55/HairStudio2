<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="cartPage.aspx.cs" Inherits="HairStudio.cartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <script type="text/javascript">

       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imageview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }

   </script>


    <script type="text/javascript">
        $(document).ready(function () {

            //$(document).ready(function () {
            //$('.table').DataTable();
            // });

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            //$('.table1').DataTable();
        });
    </script>

    <%--custom css file--%>

    <link href="CSS/cartPageStyle.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />

    <div class="container-fluid"  style="background-color:antiquewhite">
        <br /> <br />
        <div class="row">
            <div class="col-md-5">

                <div class="card" id="one">
                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/generalUser.png" style="border-radius:50%" id="imageview"/>
                                    <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" /> 
                                </center>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>My Profile</h4>
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
                                <label>ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-7  mx-auto">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox7" runat="server" placeholder="Account Status" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-7 mx-auto">
                                <label>Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5 mx-auto">
                                <label>Phone</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Phone" TextMode="Number"></asp:TextBox>

                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email"></asp:TextBox>

                                </div>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">


                                <div class="form-group">
                                    <label>Full Address</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Full Address"  class="input-group input-group-lg"></asp:TextBox>
                                </div>

                                <div class="row">
                                    
                                    <div class="col-md-6 mx-auto">
                                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                                    </div>

                                </div>

                                <br />

                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>
                </div>


                <br />

                <div class="card" id="two">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-7 mx-auto">
                            <label>Order ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="ID"></asp:TextBox>
                                </div>
                            </div>
                                </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mx-auto">
                            <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Remove" Onclick="Button4_Click"/>
                            </div>
                        </div>
                     </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12 mx-auto">
                    <asp:Button class="btn btn-lg btn-block btn-warning" ID="Button1" runat="server" Text="Go to Payment" OnClick="Button1_Click" />
                        </div>
                </div>

                <br />

                <p> <i class="fa-solid fa-house-user"></i> <a href="homePage.aspx"><i>Back to Home Page</i></a></p>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card" id="three">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Order List</h4>                                       
                                </center>
                            </div>
                        </div>

                       

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hairStudioDbConnectionString5 %>" SelectCommand="SELECT [orderId], [quantity], [date], [status], [imgLink] FROM [orderTBL]"></asp:SqlDataSource>
                            <div class="col">
                            <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="orderId" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="orderId" HeaderText="orderId" ReadOnly="True" SortExpression="orderId" />

                                    <asp:TemplateField>

                                        <ItemTemplate>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-7">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                Total Quantity :
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("quantity") %>' Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-12">
                                                                Issue Date :
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("date") %>' Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-12">
                                                                Product status :
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("status") %>' Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-5">
                                                        <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("imgLink") %>' /> 
                                                    </div>

                                                </div>
                                            </div>
                                            

                                        </ItemTemplate>

                                    </asp:TemplateField>

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
