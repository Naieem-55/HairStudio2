<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="stuffManagementPage.aspx.cs" Inherits="HairStudio.stuffManagementPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
      $(document).ready(function () {
      
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
    </script>

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

    <link href="CSS/stuffManagementCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid" style="background-color:antiquewhite">
            <br /><br />
        <div class="row">
            <div class="col-md-5">

                <div class="card" id="one">
                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/product6.jpg" style="border-radius:50%"  id="imageview"/>
                                    <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                                </center>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Product Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Product ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button11" runat="server" Text="Go" OnClick="Button11_Click"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Product Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Product Name"></asp:TextBox>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-5">
                                <label>Product Price</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Price" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-7">
                                <label>Product Quantity</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Quantity" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-7">
                                <label>Origin</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Origin"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <label>Issue Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button12_Click"/>
                             </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button13_Click"/>
                            </div>
                             <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn btn-danger" runat="server" Text="Delete" OnClick="Button14_Click"/>
                             </div>
                            </div>

                    </div>
                </div>


                <br />

                <p><i class="fa-solid fa-house-user"></i><a href="homePage.aspx"><i>Back to Home Page</i></a></p>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card" id="two">
                    <div class="card-body">



                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Product List</h4>
                                </center>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hairStudioDbConnectionString6 %>" SelectCommand="SELECT [productId], [name], [price], [quantity], [origin], [imgLink] FROM [productTBL]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="productId" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="productId" HeaderText="productId" ReadOnly="True" SortExpression="productId" />
                                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                                        <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin" />
                                        <asp:BoundField DataField="imgLink" HeaderText="imgLink" SortExpression="imgLink" />
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
