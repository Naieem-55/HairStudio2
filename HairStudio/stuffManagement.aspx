<%@ Page Title="Hair Studio - Staff Management" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="stuffManagement.aspx.cs" Inherits="HairStudio.stuffManagement" %>
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
                                    <img width="150px" src="images/product6.jpg" class="profile-img" id="imageview" alt="Product image preview"/>
                                    <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload2" runat="server" />

                                    </div>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col">
                                <div class="text-center">
                                    <h4>Product Details</h4>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label AssociatedControlID="TextBox11" runat="server">Product ID</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button20" runat="server" Text="Go" OnClick="Button11_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <asp:Label AssociatedControlID="TextBox12" runat="server">Product Name</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Product Name"></asp:TextBox>

                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label AssociatedControlID="TextBox13" runat="server">Product Price</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="Price" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-7">
                                <asp:Label AssociatedControlID="TextBox14" runat="server">Product Quantity</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" placeholder="Quantity" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-7">
                                <asp:Label AssociatedControlID="TextBox15" runat="server">Origin</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox15" runat="server" placeholder="Origin"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <asp:Label AssociatedControlID="TextBox16" runat="server">Issue Date</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox16" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button12" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button12_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button13" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button13_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button14" class="btn btn-lg btn-block btn btn-danger" runat="server" Text="Delete" OnClick="Button14_Click" />
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
                                        <h4>Product List</h4>
                                    </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource runat="server" ID="SqlDataSource11" ConnectionString="<%$ ConnectionStrings:hairStudioDbConnectionString %>" SelectCommand="SELECT [productId], [name], [price], [quantity], [origin] FROM [productTBL]" ProviderName="<%$ ConnectionStrings:hairStudioDbConnectionString.ProviderName %>"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView11" runat="server" DataSourceID="SqlDataSource11" AutoGenerateColumns="False" DataKeyNames="productId">
                                    <Columns>
                                        <asp:BoundField DataField="productId" HeaderText="productId" ReadOnly="True" SortExpression="productId" />
                                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                                        <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin" />
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
