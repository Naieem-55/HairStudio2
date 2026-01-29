<%@ Page Title="Hair Studio - Place Order" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="makeOrder.aspx.cs" Inherits="HairStudio.makeOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />

    <div class="container-fluid section-warm">
        <br />
      <div class="row">
         <div class="col-md-7 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <div class="text-center">
                           <h4>Place Order</h4>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <div class="text-center">
                            <img width="150px" src="images/product6.jpg" class="profile-img" alt="Product order icon"/>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <asp:Label AssociatedControlID="TextBox2" runat="server">Member ID</asp:Label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Member ID" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <asp:Label AssociatedControlID="TextBox1" runat="server">Product ID</asp:Label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Product ID"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <asp:Label AssociatedControlID="TextBox3" runat="server">Quantity</asp:Label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Quantity"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <asp:Label AssociatedControlID="TextBox4" runat="server">Date</asp:Label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-6 mx-auto">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Confirm Order" OnClick="Button2_Click" />
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
