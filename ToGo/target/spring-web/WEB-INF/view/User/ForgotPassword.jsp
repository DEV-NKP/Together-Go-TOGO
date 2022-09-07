<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
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
    padding-top: 20px ;*/">
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


            
            
            
                <td width="53%" align="center" style="background-color: transparent; padding-top:10px;" >
                    <div align="center" style=" background-color: #3f2b66; margin-top:10px;  margin-bottom: 20px;
                     width:440px; height: 580px; padding-right: 10px; border:2px solid #808080 ; border-radius: 15px;">
                     <br><br><br><br>
                     <br>
                        
                        <img src="../Image/forgot.png" width="88%"/>
                        <br>
        
                    </div>
                </td>
                <td width="47%" align="center" style="background-color: transparent;">
                    <div align="center" style="margin-left: -40px;   background-color:#303030; height: 580px; width: 450px;
                     border-radius: 15px; padding-top: 20px;
                    padding-left: 20px; padding-right: 20px; padding-bottom: 10px; border: 1px solid #808080 ">
    
    
    
    
    
                    <h2 align="left" style="width:300px; color: #b0acac;font-size: 36px;font-family:Verdana, Geneva, Tahoma, sans-serif;padding-bottom:10px;">Forgot <br> Password?</h2>
                    <br>
                        <span class="msg-require text-danger">
                            ${message}
                        </span>

                        <form:form action="" modelAttribute="forgotPasswordVM" method="POST" id="form">
                        <h6 style="font-weight: lighter; color: #c9c9c9;  margin-left:-230px;">Email:  </h6>

                        <form:input path="email" type="text" name="email" value="" class="form-control" id="text-box-normal" style="width:300px" />
                        <form:errors path="email"/>

                            <br>
                        <a href="javascript:$('form').submit();" id="buttonGlow" class="emailsuccess" style=" filter: hue-rotate(180deg); cursor:pointer; ">Send Code</a>

                        <br>  <br>
                            <!--    <font style="margin-top: 0px; margin-bottom: 10px; line-height: 4; ">
                            Didn't get it?
    
                          <a onclick="" onMouseOver="this.style.color='#1bbdd6'"
                            onMouseOut="this.style.color='#fe9783'"
                            style=" color: #fe9783; padding-bottom: 0px; text-decoration: none;  ">Resend</a>
                            <br />
                        </font>
                            -->
                        <div style="padding-top:5px;"> </div>
                        <!--<input type="submit" class="btn btn-success" id="button-glow" />-->

                    <div class="userInput">

                        <form:input path="code" type="text" name="code" value="" class="form-control" id="text-box-normal" style="width:300px" />
                        <form:errors path="code"/>
                     <!--   <input type="text" class="code-verify" id="text-box-normal" style="width:40px; padding: 25px;margin:5px; text-transform:uppercase" maxlength="1"  onkeyup="clickEvent(this,'sec')">
                        <input type="text" class="code-verify" id="text-box-normal" style="width:40px; padding: 25px;margin:5px; text-transform:uppercase" maxlength="1"  onkeyup="clickEvent(this,'third')">
                        <input type="text" class="code-verify" id="text-box-normal" style="width:40px; padding: 25px; margin:5px;text-transform:uppercase" maxlength="1" onkeyup="clickEvent(this,'fourth')">
                        <input type="text" class="code-verify" id="text-box-normal" style="width:40px; padding: 25px; margin:5px;text-transform:uppercase" maxlength="1"  onkeyup="clickEvent(this,'fifth')">
                        <input type="text" class="code-verify" id="text-box-normal" style="width:40px; padding: 25px; margin:5px;text-transform:uppercase" maxlength="1" onkeyup="redirecPage()">
                        -->
                       <br>
                        <a href="javascript:$('form').submit();" id="buttonGlow" class="emailsuccess" style=" filter: hue-rotate(180deg); cursor:pointer; ">Verify</a>

                    </div>
                        </form:form>
                    <span style="color: #fe9783; margin-left:0; text-align:center;" class="msg-require verify-valid"> 
                    </span>
                    <div style="background-color: #1b1d1f; width: 350px; height: 75px; margin-top: 30px; border-left: 4px solid #fe9783; padding:10px; ">
                        <span style="color: #808080; font-family: 'Times New Roman'; font-size: 17px; font-weight: lighter; text-align: justify; justify-content: center; text-align: center;">
                            A 6 digit OTP was send to your mail. Please check your inbox
                            and enter the OTP to verify.
                        </span>
    
                    </div>
    
    
                    </div>
    
                </td>

        </tr>



    </table>
</div>
</body>
</html>