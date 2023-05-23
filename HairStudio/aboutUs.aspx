<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutUs.aspx.cs" Inherits="HairStudio.aboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section style="background-color:antiquewhite">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <p style="font-size:50px;color:midnightblue;text-align:center">HAIR STUDIO</p>
                <p style="font-size:20px;font-style:italic;text-align:center">Founded in 2017, Mangomint started with the belief that great software should be so intuitive and easy to use that it effectively disappears.</p>
            </div>
        </div>
    </section>

    <section>
        <div class="row">

            <div class="col-md-6">
                <p style="color:cadetblue;margin-left:15px;margin-top:10px">OUR MISSION</p>
                <p style="font-size:30px;margin-left:15px;color:midnightblue"><b>Creating salon & spa tools, not obstacles.</b></p>
                <p style="font-style:italic;margin-left:15px;font-size:20px">Most tools available today add too much friction to everyday tasks like engaging with clients, managing appointments, or even getting paid. They are often poorly designed, not well integrated, and needlessly complicated.
                  We believe that people often think of salon and spa technology as an inconvenience. Instead of making things easier, it gets in the way of what they actually want to get done.
                 Our mission is to build a future where software is so naturally integrated into the day-to-day of salons and spas, it effectively disappears.</p>

            </div>

            <div class="col-md-6">
                <img width="500px" height="400px" src="images/banner.jpg" style="border-radius:10%;margin-top:20px;margin-bottom:20px;margin-right:10px"/>
            </div>

        </div>
    </section>


    <section>
        <div class="row">

            <div class="col-md-6">
                <img width="500px" height="400px" src="images/banner2.jpg" style="border-radius: 10%; margin-top: 20px; margin-bottom: 20px; margin-left: 10px" />
            </div>

            <div class="col-md-6">
                <p style="color:cadetblue;margin-left:15px;margin-top:10px">OUR VALUES</p>
                <p style="font-size:30px;margin-left:15px;color:midnightblue"><b>Taking trust, excellence, and design a step further.</b></p>
                <p style="font-style:italic;margin-left:15px;font-size:20px">Nothing means more to us than building trust. We strive to be open and honest about our product, practices, and values.
T                hat means embodying excellence through thoughtful software design, comprehensive customer support, and data privacy.
                 These pillars inform every decision we make so that our customers and their clients can focus on their time together instead of the software connecting them.</p>

            </div>

        </div>
    </section>


    <section style="background-color:antiquewhite">
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">
                    <p style="font-size:40px;text-align:center;font-style:italic">Our leadership team</p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <img src="images/founder1.jpg" width="300px" height="300px" style="border-radius:15%"/>
                    <p style="font-size:20px">Daniel Lang</p>
                    <p style="font-size:15px">Founder/CEO</p>
                </div>

                <div class="col-md-4">
                    <img src="images/founder2.jpg"  width="300px" height="300px" style="border-radius:15%"/>
                    <p style="font-size: 20px">Daniel Lang</p>
                    <p style=" font-size: 15px">Founder/CTO</p>
                </div>

                <div class="col-md-4">
                    <img src="images/founder3.jpg"  width="300px" height="300px" style="border-radius:15%"/>
                    <p style="font-size: 20px">Daniel Lang</p>
                    <p style="font-size: 15px">Founder/Lead Engineer</p>
                </div>
            </div>

        </div>
    </section>

    <section>

        <div class="row">
            <div class="col-md-6 mx-auto">

                <br />


                <div class="card"  style="background-color:#e6f2ff">
                    <div class="card-body">


                        <form>

                            <center>
                            <p style="text-align:center;font-size:30px;font-style:italic;color:#00004d">Send Your Opinion</p>
                            </center>
                            <!-- Name input -->
                            <div class="form-outline mb-4">
                                <label class="form-label" for="form4Example1">Name</label>
                                <input type="text" id="form4Example1" class="form-control" placeholder="Full Name"/>
                                
                            </div>

                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <label class="form-label" for="form4Example2">Email address</label>
                                <input type="email" id="form4Example2" class="form-control"  placeholder="Email Adress"/>
                                
                            </div>

                            <!-- Message input -->
                            <div class="form-outline mb-4">
                                <label class="form-label" for="form4Example3">Message</label>
                                <textarea class="form-control" id="form4Example3" rows="4"  placeholder="Your Message"></textarea>
                                
                            </div>

                            <!-- Submit button -->
                            <button type="submit" class="btn btn-primary btn-block mb-4">
                                Send
                            </button>
                        </form>

                        <br />

                    </div>
                </div>

                
                <p> <i class="fa-solid fa-house-user"></i> <a href="homePage.aspx"><i>Back to Home Page</i></a></p>
            </div>

        </div>
    </section>


</asp:Content>
