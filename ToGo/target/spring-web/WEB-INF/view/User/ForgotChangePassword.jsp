<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
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
    
    <div align="center" id="gradient"style="/* width: 100%;height: 100vh;background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
    backdrop-filter:blur(10px);
    -webkit-backdrop-filter: blur(10px); 
    padding-top: 40px ;*/
 padding-top: 15vh ;
">
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

        <div border="0" align="center" style=" width:550px;background-color: #3e355f; margin-top:20px;border-radius: 10px;padding:10px;">
              
                       <div align="center" style="margin: 20px; background-color: #2e2d3e; height: 500px; width: 450px; border-radius: 10px; padding-top: 10px; padding-left: 30px; padding-right: 30px; padding-bottom: 10px; border: 1px solid #808080 ">
       
       
       
                           <h4 style="width:300px; color: #d2d0d0; border-bottom:1px solid white; padding-top:30px;padding-bottom:15px;">Change Password</h4>

                           <br />
                           <span class="msg-require text-danger">
                               ${message}
                           </span>

                           <form:form action="" modelAttribute="forgotPasswordVM" method="POST" id="form">
                               <h6 style="font-weight: lighter; padding-top: 10px; color: #c9c9c9; margin-left: -275px;">
                                   New Password
                               </h6>

                           <form:password path="password"  name="password" value="" class="form-control" id="text-box-normal" />
                           <form:errors path="password"/>
       
                               <h6 style="font-weight: lighter; padding-top: 5px; color: #c9c9c9; margin-left: -220px;">
                                  Retype New Password
                               </h6>

                               <form:password path="newPassword"  name="newPassword" value="" class="form-control" id="text-box-normal" />
                               <form:errors path="newPassword"/>
                               <br>
                               <a href="javascript:$('form').submit();" id="buttonGlow" class="emailsuccess" style=" filter: hue-rotate(180deg); cursor:pointer; ">Change Password</a>

                           </form:form>
                           <br> <br>

                       </div>
                   
           </div>
     
           
</div>
</body>
</html>