<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="HairStudio.homePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div style="position: relative">
            <img src="images/banner3.jpg" class="img-fluid">
            <div style="position: absolute; top: 30%; left: 30%; font-size: 120px; font-style: italic; color: #b3ffff"  class="caption text-center">Hair Studio</div>
            <div style="position: absolute; top: 55%; left: 30%; font-size: 35px; font-style: oblique; color: #4ddbff"  class="caption text-center">Hair your style is the style of your life</div>
        </div>
    </section>

    <section>
        <div class="container">

            <div class="row">
                <div class="col-12">
                    <center>
                    <p><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Features</p>
                    <h2> <b>Why Choose Us</b></h2>
                    </center>
                </div>
            </div>

            <div class="row">

                <div class="col">
                    <div class="row">
                        <div class="col">
                            <img src="images/barber-man.jpg" width="400px" height="400px"/>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="row">
                        <div class="col">
                             <h4 style="color:aquamarine"><i class="fa fa-shield" aria-hidden="true"></i> Experienced Staff</h4>
                             <p class="text-justify" style="font-size:20px;font-style:italic">Cut and style hair to client's specifications.Use hair dyes and hot styling tools.Experienced staff can offer valuable advice, suggest suitable hairstyles or treatments.</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <h4 style="color:aquamarine"><i class="fa fa-calendar" aria-hidden="true"></i> Pre Booking Online</h4>
                            <p class="text-justify" style="font-size:20px;font-style:italic"> Our services speak to your style , we specialize in in barbering and grooming services. Pre-booking can be facilitated through various channels, such as phone calls.</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <h4 style="color:aquamarine"><i class="fa fa-usd" aria-hidden="true"></i> Affordable Costs</h4>
                            <p class="text-justify"  style="font-size:20px;font-style:italic"> Check out our cost lists to get unique , handsome hair cut from Hair Studio.Affordable cost does not necessarily mean compromising on quality.</p>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section>

</asp:Content>
