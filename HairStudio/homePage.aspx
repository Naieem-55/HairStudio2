<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="HairStudio.homePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <%--javascript & css Code here--%>
    <link href="CSS/headText.css" rel="stylesheet" />
    <link href="CSS/featureImage.css" rel="stylesheet" />
    <link href="CSS/serviceImage.css" rel="stylesheet" />
    <link href="CSS/testimonialImage.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Home Page Section here--%>

   <section style="background-color:antiquewhite">
  <div class="container-fluid">
    <div class="row">
        <marquee id="myMarquee">
            <p style="text-align: center; font-size: 30px; font-style: italic; color: black" id="marqueeText"></p></marquee>
    </div>

    <div class="row">
      <div class="col-md-12">
        <div class="image-container">
          <img src="images/perfectBack.jpg" class="img-fluid" style="opacity:0.8">
          <div class="image-overlay">
              <p style="text-align:center;font-size:110px;font-style:italic;color:darkslategray;">Hair Studio</p>
            <p style="text-align:center;font-size:60px;font-style:oblique;color:lightseagreen">Style your hair is the style of your life.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

        <script>
            var marqueeText = document.getElementById("marqueeText");
            var strings = ["Welcome to Hair Studio Website !!", "Some brand new products just arrived today !", "Style yourself with Hair Studio ."];
            var index = 0;

            function changeText() {
                marqueeText.innerHTML = strings[index];  
                index = (index + 1) % strings.length;
            }
            changeText();
        </script>


    <%--Features Section Here--%>

    <section  style="background-color:aliceblue">
        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <center>
                    <h2 style="color:aqua"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <i>Features</i></h2>
                    <h5 style="color:cadetblue"> <b> <i>Why Choose Us</i></b></h5>
                    </center>
                </div>
            </div>

            <div class="row">

                <div class="col">
                    <div class="row">
                        <div class="col">
                            <img src="images/barber-man.jpg" width="400px" height="400px" style="border-radius:12%"/>
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

    <%--Service Section Here--%>

    <section style="background-color:antiquewhite">
        <div class="container-fluid">

            <div class="row">

                   <div class="col-md-12" style="font-size:40px;color:aqua;font-style:italic;text-align:center">Services</div>
                   <div class="col-md-12" style="font-size:20px;color:cadetblue;font-style:italic;text-align:center">We Provide Better</div>

            </div>

            <div class="row">

                <div class="col-md-6">
                    <center style="margin-top:30px;margin-bottom:30px">
                        <img  width="450px" src="images/pic-1.jpg" class="rounded"/>
                        <h4><i>Hair Style | Unique Hair Style</i></h4>
                    </center>
                </div>

                <div class="col-md-6">
                    <center style="margin-top:30px;margin-bottom:30px">
                        <img width="450px" src="images/pic-2.jpg" class="rounded"/>
                        <h4><i>Beared Trim | Handsome Beared Triming</i></h4>
                    </center>
                </div>

            </div>

            <div class="row">

                <div class="col-md-6">
                    <center style="margin-top:30px;margin-bottom:30px">
                        <img width="450px"  src="images/pic-3.jpg" class="rounded"/>
                       <h4><i>Hair Cut | Awsome Hair Cutting</i></h4>
                    </center>
                </div>

                <div class="col-md-6">
                    <center style="margin-top:30px;margin-bottom:30px">
                        <img width="450px"  src="images/pic-4.jpg"  class="rounded"/>
                        <h4><i>Dry Shampoo | Net & Clean Shampoo</i></h4>
                    </center>
                </div>

            </div>

            
        </div>
    </section>

    <%--Testimonial Section Here--%>

    <section style="background-color:aliceblue">
        <div class="container-fluid">

            <div class="row">

                <div class="col-md-12" style="font-size: 40px; color: aqua; font-style: italic; text-align: center">Testmonials</div>
                <div class="col-md-12" style="font-size: 30px; color: cadetblue; font-style: italic; text-align: center">What Our Client Says</div>

            </div>

            <div class="row" style="margin-top:30px;margin-bottom:30px">
                <div class="col-md-4">
                    <center>
                        <img src="images/img-1.jpg" width="180px" height="185px" class="rounded"/> 
                        <p><b>ANDERSON PITTER</b><i class="fa-brands fa-twitter"></i></p>
                        <p style="color:darkblue">@anderson_pitter</p>
                        <q><i>After visiting the branch today I left extremely happy with new colour and rehreshment.</i></q>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img src="images/img-2.jpg" width="180px" height="185px" class="rounded" />
                        <p><b>KELVIN JUNIOR</b><i class="fa-brands fa-twitter"></i></p>
                        <p style="color:darkblue">@kelvin_junior</p>
                        <q><i>Thrilled to bits with my haircut this afternoon from Sai  really good cut.</i></q>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img src="images/img-3.jpg" width="180px" height="185px" class="rounded" />
                        <p><b>MARK WOOD</b><i class="fa-brands fa-twitter"></i></p>
                        <p style="color:darkblue">@mark_wood</p>
                        <q><i>Another excellent & professional Cut at Tring this morning very experienced</i></q>
                    </center>
                </div>

            </div>

        </div>
    </section>

    <%--Contact Section Here--%>

    <section style="background-color:antiquewhite">
        <div class="container-fluid">

            <div class="row" style="margin-top:30px;margin-bottom:40px">
                <div class="col-md-12" style="font-size: 40px; color: aqua; font-style: italic; text-align: center">Visit Shop Today</div>
            </div>

            <div class="row">

                <div class="col-md-3">
                    <center>
                        <p><b>PLATFORM</b></p>
                        <p><asp:LinkButton runat="server" OnClick="Unnamed1_Click">Why We're Different</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server" OnClick="Unnamed2_Click">Pricing</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server" OnClick="Unnamed3_Click">Payments</asp:LinkButton></p>

                    </center>
                </div>

                <div class="col-md-3">
                    <center>
                         <p><b>FEATURES</b></p>
                        <p><asp:LinkButton runat="server">Calender & Scheduling</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Online Booking</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Express Booking</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Membership & Packages</asp:LinkButton></p>

                    </center>
                </div>

                <div class="col-md-3">
                    <center>
                         <p><b>RESOURCES</b></p>
                        <p><asp:LinkButton runat="server">Our Customers</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server" OnClick="Unnamed9_Click">About Us</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Contact Us</asp:LinkButton></p>

                    </center>
                </div>

                <div class="col-md-3">
                    <center>
                        <p><b>FOLLOW US</b></p>
                        <p><asp:LinkButton runat="server">Facebook</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Instagram</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Telegram</asp:LinkButton></p>

                    </center>
                </div>

            </div>

            <div class="row" style="margin-top:40px;margin-bottom:40px">
                <div class="col-md-12">
                    <center>
                        <p style="font-size:40px"><b><i>Hair Studio</i></b></p>
                    </center>
                </div>
            </div>

            <div class="row" style="margin-top:40px;margin-bottom:40px">
                <div class="col-md-12">
                    <center>
                         <p><i>Our hair studio website specializes in delivering cutting-edge styles and personalized consultations by a team of expert stylists.</i> </p>
                        <p><i>From trendy haircuts to vibrant color treatments, we are dedicated to providing exceptional salon services that cater to your unique style and exceed your expectations.</i></p>
                         <p><i>Experience the difference at our hair studio today.</i></p>
                    </center>
                </div>
            </div>
        </div>
    </section>


</asp:Content>
