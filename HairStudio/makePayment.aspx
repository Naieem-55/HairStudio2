<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="makePayment.aspx.cs" Inherits="HairStudio.makePayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/makePaymentCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <br />
    <br />

    <div class="container bg-light d-md-flex align-items-center">
        <div class="card box1 shadow-sm p-md-5 p-md-5 p-4">
            <div class="fw-bolder mb-4"><span class="fas fa-dollar-sign"></span><span class="ps-1">HAIR STUDIO</span></div>
            <div class="d-flex flex-column">
                <div class="d-flex align-items-center justify-content-between text"><span class="">Commission</span> <span class="fas fa-dollar-sign"><span class="ps-1">100TK</span></span> </div>
                <div class="d-flex align-items-center justify-content-between text mb-4"><span>Total</span> <span class="fas fa-dollar-sign"><span class="ps-1">100TK</span></span> </div>
                <div class="border-bottom mb-4"></div>
                <div class="d-flex flex-column mb-4"><span class="far fa-file-alt text"><span class="ps-2">Invoice ID:</span></span> <span class="ps-3">SN8478042099</span> </div>
                <div class="d-flex flex-column mb-5"><span ><span class="ps-2"></span></span> <span class="ps-3"></span> </div>
                <div class="d-flex align-items-center justify-content-between text mt-5">
                    <div class="d-flex flex-column text"><span>Customer Support:</span> <span>online chat 24/7</span> </div>
                    <div class="btn btn-primary rounded-circle"><span class="fas fa-comment-alt"></span></div>
                </div>
            </div>
        </div>
        <div class="card box2 shadow-sm">
            <div class="d-flex align-items-center justify-content-between p-md-5 p-4"><span class="h5 fw-bold m-0">Payment Methods</span>
                <div class="btn btn-primary bar"><span class="fas fa-bars"></span></div>
            </div>
            <ul class="nav nav-tabs mb-3 px-md-4 px-2">
                <li class="nav-item"><a class="nav-link px-2 active" aria-current="page" href="#">Credit Card</a> </li>
                <li class="nav-item"><a class="nav-link px-2" href="#">Mobile Payment</a> </li>
                <li class="nav-item ms-auto"><a class="nav-link px-2" href="#">+ More</a> </li>
            </ul>
            <form action="">
                <div class="row">
                    <div class="col-12">
                        <div class="d-flex flex-column px-md-5 px-4 mb-4"><span>Credit Card</span>
                            <div class="inputWithIcon">
                                <input class="form-control" type="text" value=" ">
                                <span class="">
                                    <img src="https://www.freepnglogos.com/uploads/mastercard-png/mastercard-logo-logok-15.png" alt=""></span> </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="d-flex flex-column ps-md-5 px-md-0 px-4 mb-4"><span><span class="ps-1">Amount</span></span>
                            <div class="inputWithIcon">
                                <input type="text" class="form-control" value=" ">
                              </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="d-flex flex-column pe-md-5 px-md-0 px-4 mb-4"><span>Code CVV</span>
                            <div class="inputWithIcon">
                                <input type="password" class="form-control" value="">
                                <span class="fas fa-lock"></span></div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="d-flex flex-column px-md-5 px-4 mb-4"><span>Name</span>
                            <div class="inputWithIcon">
                                <input class="form-control text-uppercase" type="text" value="">
                                <span class="far fa-user"></span></div>
                        </div>
                    </div>
                    <div class="col-12 px-md-5 px-4 mt-3">
                        <div class="btn btn-primary w-100">Conform Payment</div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
