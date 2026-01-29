<%@ Page Title="Hair Studio - About Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutUs.aspx.cs" Inherits="HairStudio.aboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="section-warm">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <p class="page-hero-title">HAIR STUDIO</p>
                <p class="section-subtitle">Founded in 2017, Hair Studio started with the belief that great software should be so intuitive and easy to use.</p>
            </div>
        </div>
    </section>

    <section>
        <div class="row">

            <div class="col-md-6">
                <p class="about-label">OUR MISSION</p>
                <p class="about-heading"><b>Creating salon & spa tools, not obstacles.</b></p>
                <p class="about-text">Most tools available today add too much friction to everyday tasks like engaging with clients, managing appointments, or even getting paid. They are often poorly designed, not well integrated, and needlessly complicated.
                  We believe that people often think of salon and spa technology as an inconvenience. Instead of making things easier, it gets in the way of what they actually want to get done.
                 Our mission is to build a future where software is so naturally integrated into the day-to-day of salons and spas, it effectively disappears.</p>

            </div>

            <div class="col-md-6">
                <img src="images/banner.jpg" class="img-responsive about-img about-img-left" alt="Hair Studio salon banner" loading="lazy"/>
            </div>

        </div>
    </section>


    <section>
        <div class="row">

            <div class="col-md-6">
                <img src="images/banner2.jpg" class="img-responsive about-img about-img-right" alt="Hair Studio team at work" loading="lazy"/>
            </div>

            <div class="col-md-6">
                <p class="about-label">OUR VALUES</p>
                <p class="about-heading"><b>Taking trust, excellence, and design a step further.</b></p>
                <p class="about-text">Nothing means more to us than building trust. We strive to be open and honest about our product, practices, and values.
                 That means embodying excellence through thoughtful software design, comprehensive customer support, and data privacy.
                 These pillars inform every decision we make so that our customers and their clients can focus on their time together instead of the software connecting them.</p>

            </div>

        </div>
    </section>


    <section class="section-warm">
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">
                    <p class="section-heading-italic">Our leadership team</p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <img src="images/founder1.jpg" class="leader-img" alt="Daniel Lang, Founder and CEO" loading="lazy"/>
                    <p class="leader-name">Daniel Lang</p>
                    <p class="leader-role">Founder/CEO</p>
                </div>

                <div class="col-md-4">
                    <img src="images/founder2.jpg" class="leader-img" alt="Md Hoque, Founder and CTO" loading="lazy"/>
                    <p class="leader-name">Md Hoque</p>
                    <p class="leader-role">Founder/CTO</p>
                </div>

                <div class="col-md-4">
                    <img src="images/founder3.jpg" class="leader-img" alt="Kelvin Peterson, Founder and Lead Engineer" loading="lazy"/>
                    <p class="leader-name">Kelvin Peterson</p>
                    <p class="leader-role">Founder/Lead Engineer</p>
                </div>
            </div>

        </div>
    </section>

    <section>

        <div class="row">
            <div class="col-md-6 mx-auto">

                <br />
                <div class="row">
                    <div class="col-md-8 mx-auto">
                        <p class="feedback-heading">Let Us Know Your Experience</p>
                    </div>

                </div>
                <br /><br />

                <div class="card section-card-blue">
                    <div class="card-body">


                        <div>
                        <div class="row">
                            <div class="col-md-12 mx-auto">
                                <asp:Label AssociatedControlID="TextBox2" runat="server">Full Name</asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            </div>

                            <div class="row">
                            <div class="col-md-12 mx-auto">
                                <asp:Label AssociatedControlID="TextBox1" runat="server">Email Address</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Email Address"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                                </div>

                            <div class="row">
                            <div class="col-md-12 mx-auto">
                                <asp:Label AssociatedControlID="TextBox3" runat="server">Your message</asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Your message"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                                </div>


                            <div class="row">
                            <div class="col-md-8 mx-auto">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-primary" runat="server" Text="Submit" OnClick="Button1_Click1" />
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                        </div>

                </div>


            </div>

        </div>

        <br />
                <p> <i class="fa-solid fa-house-user"></i> <a href="homePage.aspx"><i>Back to Home Page</i></a></p>
        <br />
    </section>


</asp:Content>
