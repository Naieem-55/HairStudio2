<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderHairStyle.aspx.cs" Inherits="HairStudio.OrderHairStyle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />

    <div class="container-fluid" style="background-color:antiquewhite">
        <br />
      <div class="row">
         <div class="col-md-7 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Place Order</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                            <img width="150px" src="images/product6.jpg"  style="border-radius:50%"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Member ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Member ID" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Product ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Product ID"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Time slot</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">

                                <asp:ListItem Text="09:00 AM" Value="09:00 AM" />
                                <asp:ListItem Text="10:30 AM" Value="10:30 AM" />
                                <asp:ListItem Text="12:20 PM" Value="12:20 PM" />
                                <asp:ListItem Text="01:45 PM" Value="01:45 PM" />
                                <asp:ListItem Text="04:00 PM" Value="04:00 PM" />
                                <asp:ListItem Text="06:30 PM" Value="06:30 PM" />

                            </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Date</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-6 mx-auto">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Conform Order" OnClick="Button2_Click" />
                     </div>
                  </div>
               </div>
            </div>

             <br />

             <p><i class="fa-solid fa-house-user"></i><a href="homePage.aspx"><i>Back to Home Page</i></a></p>
         </div>
        </div>
   </div>

</asp:Content>
