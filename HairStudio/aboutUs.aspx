<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutUs.aspx.cs" Inherits="HairStudio.aboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section style="background-color:aquamarine">

        <div class="row">
            <div class="col-md-6 mx-auto">


                <div class="card">
                    <div class="card-body">


                        <form>

                            <center>
                            <p style="text-align:center;font-size:30px;font-style:italic;color:aqua">Send Your Opinion</p>
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
