<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/TextShade.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/fontawesome/css/all.css">
    <link type="text/css"
        rel="stylesheet"
        href="${pageContext.request.contextPath}/fontawesome/css/fontawesome.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/TextType.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/popupMessage.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/TextFill.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/TextBox.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/ButtonGlow.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/background-gradient.css">

    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/Image/Togo.png">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TOGO</title>
</head>

<body style="overflow: hidden;">
<%@ include file='HeaderHome.jsp' %>
   <div id="up-navbar" style="margin-bottom: 60.5px"></div>
      <!--layer1 start-->
      <div  align="center" id="gradient" style="height:100vh; width: 100%; /* background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
      backdrop-filter:blur(10px);
      -webkit-backdrop-filter: blur(10px); 
      padding-top: 10px ; margin-top: -10px; */">

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

          <div class="popup"  style="height: 100px; width: 250px;position: fixed;right: 40px; bottom: 30px; ">
              <a href="about" style="height: 60px; width: 60px; border-radius: 50%;position: fixed; right: 40px; bottom: 30px;
              background:linear-gradient(180deg, #1b4240, #071418);
              border: 1px solid black;
              cursor: pointer;
               box-shadow: 0 0 20px #2e7681;">
                 <img src="${pageContext.request.contextPath}/Image/stakeholder.png" style="height: 40px; width: 40px; position: fixed; right: 49px; bottom: 43px;">
              </a>
              <span class="popuptext" id="myPopup">Want to know more about us?<br>Click Here!</span>
      </div>

        <table width="70%" height="100%" border="0" style="margin-top:-60px; background-color: transparent; ">
            <tr>
                <td>
                    <table width="95%" border="0" align="center" cellpadding="25px" style="background-color: transparent; ">
                        <tr>
                            <td width="60%" style="background-color: transparent;">
                                <!-- <h1><font style="color: #6e6e6e; " face="Times New Roman" size="8">IDEA-X</font></h1>-->
                                <h2 data-loading-text="TOGO" id="title">TOGO</h2>
                                <font style="color:#d18181;padding-top: 10px; font-family: Arial, Helvetica, sans-serif;" size="5">Together We Go...</font></pre>

                                <p style="color: #808080; font-family: 'Times New Roman'; width: 90%; font-size: 17px; font-weight: lighter; text-align: justify;">
                                    TOGO is a online based task purpose application
                                    catered towards students and teachers mainly.
                                    Through this platform teachers can give tasks,
                                     students can submit tasks from classrooms in a short time.
                                    So, let's
                                    experience with<span style="color: #2d9d9c; font-size: 20px"><b><i> TOGO</i></b></span>.
                                </p>

                                <!--<hr />-->
                            </td>

                            <td align="right" width="40%">
                                <img src="${pageContext.request.contextPath}/Image/team.PNG"
                                     alt="/Image/team.PNG"
                                     height="500px"
                                     width="500px"
                                     style="padding-top: 70px; margin-left:80px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    <!-- layer1 end-->

    <hr>

    
</div>
<script>

    const popup = document.getElementById("myPopup");
    var count = 0;
    function countdown() {
        if (count == 0)
        {
            popup.classList.toggle("show");

            count++;
        }
        else if(count == 4)
        {


            popup.classList.toggle("show");
           count=0;
        }

       else{
            count++;
        }

    }
    setInterval(countdown, 3000);


</script>
</body>
</html>