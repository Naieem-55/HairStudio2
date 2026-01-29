<%@ Page Title="Hair Studio - Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="HairStudio.homePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Home Page Section here--%>

   <section class="section-warm">
  <div class="container-fluid">
    <div class="row">
        <div class="announcement-banner">
            <p id="marqueeText"></p>
        </div>
    </div>

    <div class="row">
      <div class="col-md-12">
        <div class="image-container">
          <img src="images/perfectBack.jpg" class="img-fluid" alt="Hair Studio salon interior">
          <div class="image-overlay">
              <p class="hero-overlay-title">Hair Studio</p>
            <p class="hero-overlay-subtitle">Style your hair is the style of your life.</p>
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
            setInterval(changeText, 5000);
        </script>


    <%--Features Section Here--%>

    <section class="section-cool">
        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <div class="text-center">
                    <h2 class="section-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <i>Features</i></h2>
                    <h5 class="section-subtitle"> <b> <i>Why Choose Us</i></b></h5>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col">
                    <div class="row">
                        <div class="col">
                            <img src="images/barber-man.jpg" class="feature-img" alt="Professional barber styling a client"/>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="row">
                        <div class="col">
                             <h4 class="feature-heading"><i class="fa fa-shield" aria-hidden="true"></i> Experienced Staff</h4>
                             <p class="text-justify feature-text">Cut and style hair to client's specifications. Use hair dyes and hot styling tools. Experienced staff can offer valuable advice, suggest suitable hairstyles or treatments.</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <h4 class="feature-heading"><i class="fa fa-calendar" aria-hidden="true"></i> Pre Booking Online</h4>
                            <p class="text-justify feature-text"> Our services speak to your style, we specialize in barbering and grooming services. Pre-booking can be facilitated through various channels, such as phone calls.</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <h4 class="feature-heading"><i class="fa fa-usd" aria-hidden="true"></i> Affordable Costs</h4>
                            <p class="text-justify feature-text"> Check out our cost lists to get unique, handsome hair cut from Hair Studio. Affordable cost does not necessarily mean compromising on quality.</p>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section>

    <%--Service Section Here--%>

    <section class="section-warm">
        <div class="container-fluid">

            <div class="row">

                   <div class="col-md-12 section-title">Services</div>
                   <div class="col-md-12 section-subtitle">We Provide Better</div>

            </div>

            <div class="row">

                <div class="col-md-6">
                    <div class="text-center my-30">
                        <img src="images/pic-1.jpg" class="rounded service-img" alt="Professional hair styling service"/>
                        <h4><i>Hair Style | Unique Hair Style</i></h4>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="text-center my-30">
                        <img src="images/pic-2.jpg" class="rounded service-img" alt="Professional beard trimming service"/>
                        <h4><i>Beard Trim | Handsome Beard Trimming</i></h4>
                    </div>
                </div>

            </div>

            <div class="row">

                <div class="col-md-6">
                    <div class="text-center my-30">
                        <img src="images/pic-3.jpg" class="rounded service-img" alt="Professional hair cutting service"/>
                       <h4><i>Hair Cut | Awesome Hair Cutting</i></h4>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="text-center my-30">
                        <img src="images/pic-4.jpg" class="rounded service-img" alt="Dry shampoo hair washing service"/>
                        <h4><i>Dry Shampoo | Neat & Clean Shampoo</i></h4>
                    </div>
                </div>

            </div>


        </div>
    </section>

    <%--Testimonial Section Here--%>

    <section class="section-cool">
        <div class="container-fluid">

            <div class="row">

                <div class="col-md-12 section-title">Testimonials</div>
                <div class="col-md-12 section-subtitle-lg">What Our Client Says</div>

            </div>

            <div class="row my-30">
                <div class="col-md-4">
                    <div class="text-center">
                        <img src="images/img-1.jpg" class="rounded testimonial-img" alt="Client Anderson Pitter" loading="lazy"/>
                        <p><b>ANDERSON PITTER</b><i class="fa-brands fa-twitter"></i></p>
                        <p class="testimonial-handle">@anderson_pitter</p>
                        <q><i>After visiting the branch today I left extremely happy with new colour and refreshment.</i></q>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="text-center">
                        <img src="images/img-2.jpg" class="rounded testimonial-img" alt="Client Kelvin Junior" loading="lazy"/>
                        <p><b>KELVIN JUNIOR</b><i class="fa-brands fa-twitter"></i></p>
                        <p class="testimonial-handle">@kelvin_junior</p>
                        <q><i>Thrilled to bits with my haircut this afternoon from Sai  really good cut.</i></q>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="text-center">
                        <img src="images/img-3.jpg" class="rounded testimonial-img" alt="Client Mark Wood" loading="lazy"/>
                        <p><b>MARK WOOD</b><i class="fa-brands fa-twitter"></i></p>
                        <p class="testimonial-handle">@mark_wood</p>
                        <q><i>Another excellent & professional Cut at Tring this morning very experienced</i></q>
                    </div>
                </div>

            </div>

        </div>
    </section>

    <%--Contact Section Here--%>

    <section class="section-warm">
        <div class="container-fluid">

            <div class="row my-40">
                <div class="col-md-12 section-title">Visit Shop Today</div>
            </div>

            <div class="row">

                <div class="col-md-3">
                    <div class="text-center">
                        <p><b>PLATFORM</b></p>
                        <p><asp:LinkButton runat="server" OnClick="Unnamed1_Click">Why We're Different</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server" OnClick="Unnamed2_Click">Pricing</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server" OnClick="Unnamed3_Click">Payments</asp:LinkButton></p>

                    </div>
                </div>

                <div class="col-md-3">
                    <div class="text-center">
                         <p><b>FEATURES</b></p>
                        <p><asp:LinkButton runat="server">Calendar & Scheduling</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Online Booking</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Express Booking</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Membership & Packages</asp:LinkButton></p>

                    </div>
                </div>

                <div class="col-md-3">
                    <div class="text-center">
                         <p><b>RESOURCES</b></p>
                        <p><asp:LinkButton runat="server">Our Customers</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server" OnClick="Unnamed9_Click">About Us</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Contact Us</asp:LinkButton></p>

                    </div>
                </div>

                <div class="col-md-3">
                    <div class="text-center">
                        <p><b>FOLLOW US</b></p>
                        <p><asp:LinkButton runat="server">Facebook</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Instagram</asp:LinkButton></p>
                        <p><asp:LinkButton runat="server">Telegram</asp:LinkButton></p>

                    </div>
                </div>

            </div>

            <div class="row my-40">
                <div class="col-md-12">
                    <div class="text-center">
                        <p class="section-heading-italic"><b><i>Hair Studio</i></b></p>
                    </div>
                </div>
            </div>

            <div class="row my-40">
                <div class="col-md-12">
                    <div class="text-center">
                         <p><i>Our hair studio website specializes in delivering cutting-edge styles and personalized consultations by a team of expert stylists.</i> </p>
                        <p><i>From trendy haircuts to vibrant color treatments, we are dedicated to providing exceptional salon services that cater to your unique style and exceed your expectations.</i></p>
                         <p><i>Experience the difference at our hair studio today.</i></p>
                    </div>
                </div>
            </div>
        </div>
    </section>


</asp:Content>
