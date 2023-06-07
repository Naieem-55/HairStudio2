<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="stuffManagement.aspx.cs" Inherits="HairStudio.stuffManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
      $(document).ready(function () {
      
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
    </script>

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
                                    <img width="150px" src="images/product6.jpg" style="border-radius:50%"/>
                                       
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
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
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
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
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
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:hairStudioDbConnectionString2 %>" ProviderName="<%$ ConnectionStrings:hairStudioDbConnectionString2.ProviderName %>" SelectCommand="SELECT [productId], [name], [price], [quantity] FROM [productTBL]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource1">
                                </asp:GridView>

                                
                            </div>
                        </div>


                    </div>
                </div>


            </div>

        </div>
    </div>

</asp:Content>
