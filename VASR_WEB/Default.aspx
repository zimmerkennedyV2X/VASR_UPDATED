<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VASR_WEB._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="welcome-container">
        <div class="welcome-page">
            <div class="jumbotron"><%--<<<<<  Adding Shadowing  <<<<<--%>
                <div class="jumbotron-title">
                    <h1>Welcome!</h1>
                    <p class="lead">IMD/SSD Vehicle Assets System of Records </p>
                </div>
        
                <div class="row jumbotron-content">
                    <div class="col-md-6">
                        <h5 class="jumbotron-content-headers"><strong>Project Name:</strong></h5>
                        <h5>IMD/SSD VASR</h5>
                        <h5 class="jumbotron-content-headers"><strong>Management: </strong></h5>
                        <h5>John Kalafice, IMD Director  
                        </h5>
                        <h5>Chris Adams, ASD Manager
                        </h5>
                        <h5>Consywalo Manning-Thomas, Operations Manager 
                        </h5>
                    </div>

                    <div class="col-md-6" style="text-align: center;">
                        <h5 class="jumbotron-content-headers"><strong>Project Description:</strong></h5>
                        <h5 style="line-height: 25px">This system facilitates vehicle operators in efficiently logging their vehicle usage records. The system also provides IMD management comprehensive oversight in maintaining the fleet of company vehicles.
                        </h5>
                    </div>

                    <div class="col-md-6" style="text-align:right">
                        <h5 class="jumbotron-content-headers"><strong>Project Team:</strong></h5>
                        <h5>Consywalo Manning-Thomas, Operations Manager</h5>
                        <h5>Montrell Story, Senior Software Developer</h5>
                        <h5>Zimmer Kennedy, Junior Software Developer</h5>
                        <h5>Abdinasir Abdirahim, Software Developer</h5>
                        <h5>JaQuan Mobley, Junior Software Developer </h5>
                        <h5>Shah Nawaz, Software Developer</h5>
                        <h5>Stuart Ratliff, IT Architect</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%--    >>>>>  Splash Screen  >>>>>--%>

<%--   <div class="splash-screen">
       <img id="V2X-image" src="../img/V2X_Color.png" alt="V2X Logo" />
   </div>

    <style>
        .splash-screen{
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, .677);
            z-index: 9999;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .splash-screen img{
            max-width: 25%;
            max-height: 25%;
        }
    </style>

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function (event) {
            // Hide the image after 5 seconds
            setTimeout(function () {
                var myImage = document.getElementById('V2X-image');
                if (myImage) {
                    myImage.style.display = 'none';
                }
            }, 5000);

            // Add class to 'app-content' after 5 seconds
            setTimeout(function () {
                var appContent = document.getElementById('app-content');
                if (appContent) {
                    appContent.classList.add('visible-content');
                }
            }, 5000);
        });
    </script>--%>


        <%-->>>>>  Styling (JaQuan)  >>>>>--%>

    <style>
        .welcome-container{
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .welcome-page{
            width: fit-content;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .jumbotron{
            width: 66%;
            display:flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding-top: 0;
            align-items: center;
            box-shadow: 0 0 10px 2px #000000;
            background-color: rgba(0, 1, 1, .819);
            color: rgba(59,141,65,.819)
        }
        .jumbotron-title{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 15px 0 0 0;
        }
        .jumbotron-content{
            display: flex;
            justify-content: center;
        }
        .jumbotron-content-headers{
            text-shadow: 2px 2px 8px rgba(59,141,65,.819);
        }

        @media screen and (max-width: 1368px){
            .pulse-home {
                animation: pulse 3s infinite;
            }
        }

        @media screen and (max-width: 533px){
            .jumbotron-content{
                display: none;
            }
        }
    </style>

</asp:Content>
