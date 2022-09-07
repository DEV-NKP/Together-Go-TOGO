<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<!-- xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org"-->
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>


    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/TextBox.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/ButtonGlow.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/background-gradient.css">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TOGO</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/Image/Togo.png">

</head>

<body style="overflow: hidden;background-color: #1f1c3b;">
<%@ include file='HeaderHome.jsp' %>

    <div id="up-navbar" style="margin-bottom: 60.5px"></div>

    <div align="center"id="gradient"style="/* width: 100%;height: 100vh;background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
    backdrop-filter:blur(10px);
    -webkit-backdrop-filter: blur(10px);
    padding-top: 5% ;*/">
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

    <table border="0" align="center" width="890px" style="height: 75vh; background-color: transparent;">
        <tr>


            <td width="52%" align="center" style="background-color: transparent;">
                <div align="center" style="margin-left: 40px; margin-right: -40px;  background-color:#303030; height: 580px; width: 480px;
                 border-radius: 15px; padding-top: 20px;
                padding-left: 0px; padding-right: 20px; padding-bottom: 10px; border: 1px solid #808080 ">



                    <h3  style="width:200px;  color: #b0acac; font-family:Verdana, Geneva, Tahoma, sans-serif; padding-bottom:5px;">LOG IN </h3>
                    <br>

                    <span class="msg-require text-danger">
                        ${message}
                    </span>

                    <br />










                    <form:form action="" modelAttribute="user" method="post" id="form">
                        <h6 style=" color: #c9c9c9; margin-left:-210px;">User ID:  </h6>

                    <form:input path="username" type="text" name="username" value="" class="form-control" id="text-box-normal" style="width:300px"/>
                        <form:errors path="username"/>
                        <h6 style="font-weight: lighter; padding-top: 10px; color: #c9c9c9; margin-left: -200px;">
                            Password:
                        </h6>

                    <form:input path="password" type="password" name="password" value="" class="form-control" id="text-box-normal" style="width:300px"/>
                        <form:errors path="password"/>
                        <br>
                        <a href="${pageContext.request.contextPath}/home/forgotpassword" onMouseOver="this.style.color='#4169e1'"
                           onMouseOut="this.style.color='#fe9783'"
                           style="margin-left: 170px; color: #fe9783; text-decoration: none; margin-top: 10px; line-height: 4; ">Forget Password</a>
                        <br />
                        <div style="margin-top: -40px; margin-left: -160px; color: #b0acac ">
                            <input type="checkbox" name="REMEMBER" class="" value="REMEMBER" /> Remember Me
                        </div>

                        <br /><br />

                        <div style="padding-top:5px;"> </div>
                        <a href="javascript:$('form').submit();"  id="buttonGlow"

                               style=" filter: hue-rotate(180deg); cursor: pointer;">Log in
                    </a>


                    </form:form>
                    <br><br>

                    <font id="word-mid-line"> OR </font><br /><br />
                    <font> No account created?  &nbsp; </font> <a href="${pageContext.request.contextPath}/home/signup"
                                                                  onMouseOver="this.style.color='#4169e1'"
                                                                  onMouseOut="this.style.color='#fe9783'"
                                                                  style="color: #fe9783; text-decoration: none;">Sign Up</a>

                </div>

            </td>


                <td width="48%" align="center" style="background-color: transparent; padding-top:8px;" >
                    <div align="center" style=" background-color: #3f2b66; margin-top:10px; margin-bottom: 20px;
                     width:440px; height: 580px; padding-left: 10px; border:2px solid #808080 ; border-radius: 15px;">
                     <br><br><br><br>

                        <h3 style="font-family:Arial, Helvetica, sans-serif; font-size: 40px; text-shadow:0 10px 32px 0 rgba(0,0,0,0.37); ">Welcome Back!</h3>
                        <br>
                        <h6 style="color:#afaeae ; font-family:Arial, Helvetica, sans-serif;">Log in to access your account </h6>

                        <br><br>
                        <img src="../Image/lock.png" width="70%"/>

                    </div>
                </td>

        </tr>



    </table>
</div>
</body>
</html>