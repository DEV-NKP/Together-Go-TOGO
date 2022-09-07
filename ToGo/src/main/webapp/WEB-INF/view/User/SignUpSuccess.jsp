<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/background-gradient.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/ButtonGlow.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TOGO</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/Image/Togo.png">

</head>

<body style="overflow: hidden;background-color: #1f1c3b;">
<%@ include file='HeaderHome.jsp' %>
<div id="up-navbar" style="margin-bottom: 60.5px"></div>


<div align="center" id="gradient"style="padding-top: 10vh;/* width: 100%;height: 100vh;
    background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
   backdrop-filter:blur(10px);
   -webkit-backdrop-filter: blur(10px);
   padding-top: 3%*/">
    <div class="design">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>

    <div align="center" style="background-image: linear-gradient(#562f78,#43307c); margin-top: 20px;  background-color: #303030; height: 620px; width: 450px; border-radius: 10px; padding-top: 20px; padding-left: 10px; padding-right: 10px; padding-bottom: 20px; border: 1px solid #808080 ">
        <img src="${pageContext.request.contextPath}/Image/success1.png" class="img-circle hover-profile"width="50%"/>

        <hr style="border:1px solid #cf6565;" />

        <font style="font-size:30px; margin-left: 0px; color: #ffdf92">
            Congratulations!!!
        </font><br />
        <br />
        <br />

        <font style="font-size: 20px; margin-left: 0px; color: white">
            You have successfully signed up into the system!!!
        </font>

        <br />
        <br />
        <font style="font-size: 16px; margin-left: 0px; color: #888888">
            Explore new things and learn more by logging in into the system        </font>

        <br />
        <br />
        <br />
        <a href="${pageContext.request.contextPath}/home/login" id="buttonGlow" >Log In Now</a>
        <br>

        <div
                id="countdown" class="countdown" style="display: flex; text-align: center;align-items: center;justify-content: center;"
        >
            <div style="
          display: flex;
          align-items: center;
          justify-content: center;
          margin: 15px;">
               <p> <h6> Redirecting in </h6>&nbsp;<h6 id="count"></h6>&nbsp; <h6> seconds...</h6></p>
            </div>

        </div>


    </div>
</div>

</body>
</html>
<script>
    var timeleft = 5;
    function countdown() {
        if (timeleft <= 0)
        {
            document.location.href ="${pageContext.request.contextPath}/home/togo";

        } else {
            document.getElementById("count").innerHTML = timeleft ;
        }
        timeleft -= 1;

    }
    setInterval(countdown, 1000);

</script>
