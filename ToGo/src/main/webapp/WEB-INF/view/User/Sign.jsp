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

    <div id="gradient"  style="
    padding-top: 10vh;
    /* width: 100%;height: 100vh;
    background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
   backdrop-filter:blur(10px);
   -webkit-backdrop-filter: blur(10px);
   padding-top: 2%*/">
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


    <table border="0" width="40%" align="center" style="background-color: transparent;" >
        <tr>
            <td width="30%" align="center" style="background-color: transparent;" >
            <div align="center" style=" background-color: #342558; margin-top:10px; margin-bottom: 20px;
             width:400px; height: 680px; padding-right: 30px; border:2px solid #808080 ; border-radius: 15px;">
             <br><br><br><br>
             <br>
                <h3 style="font-family:Arial, Helvetica, sans-serif; font-size: 40px; ">Get Registered!</h3>
                <br>
                <h6 style="color:#afaeae ;  font-family:Arial, Helvetica, sans-serif;">To keep connected with us <br>log in with your personal info </h6>
                <br>
                <img src="${pageContext.request.contextPath}/Image/log.png" width="70%"/>

            </div>
            </td>
            <td width="70%" align="center" >
            <div align="center" style="margin-left: -40px; margin-top:10px; margin-bottom: 20px; background-color: #303030;
             height: 680px; width: 760px;
                 padding-top: 10px; padding-left: 10px; 
                padding-right: 10px; padding-bottom: 20px; border: 2px solid #808080 ; border-radius: 15px;">
               
                        <br />

                <%--@elvariable id="STUDENTS" type=""--%>
                <form:form action="signup" modelAttribute="students" method="POST">
                        <table style="margin-top: -20px;">
                            <tr style="padding-top: 10px;">
                                <td >

                                </td>

                                <td width="100%" align="" style="background-color: #303030; padding-top:10px;">
                                    <table width="660px" >
                                        <tr>
                                            <td colspan="2" width="70%" align="center" style="background-color: #303030; padding-left:0px; padding-top:10px; padding-bottom:15px;">
                                              
                                          <img src="${pageContext.request.contextPath}/Image/white.png" id="output" align="center" width="150" height="150" class="img-circle" />
                                          <br>
                                         <!-- <label for="file" id="buttonGlow" style="cursor: pointer; font-size:12px">Select Image</label>
                                          <input type="file" asp-for="picture" accept="image/*" name="picture" id="file" onchange="loadFile(event)"
                                                 style="display: none; padding-top: 0px;">-->
                                               <br>
                                                <span class="msg-require text-danger">
                                                        ${message}
                                                </span>
                                            </td>
                                            
                                        </tr>

                                        <tr style="padding-top: 10px;">

                                            <td width="50%" style="margin-left: 10px; background-color: #303030;">

                                                <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 10px;">
                                                    First Name:
                                                </h6>

                                                <form:input path="firstName" name="firstName" value="" class="form-control" id="text-box-normal" style="width:320px"/>
                                                <form:errors path="firstName"/>
                                            </td>

                                            <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                                <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 10px;">
                                                    Last Name:
                                                </h6>

                                                <form:input path="lastName" name="lastName" value="" class="form-control" id="text-box-normal"  style="width:320px"/>
                                                <form:errors path="lastName"/>
                                            </td>
                                        </tr>


                                        <tr style="padding-top: 10px;">

                                            <td width="50%" style="margin-left: 0px; background-color: #303030;">
                                                <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 10px;">
                                                    Student ID:
                                                </h6>

                                                <form:input path="studentID"  name="studentID" value="" class="form-control" id="text-box-normal"  style="width:320px"/>
                                                <form:errors path="studentID"/>
                                            </td>


                                            <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                                <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 10px;">
                                                    Gender:
                                                </h6>

                                                <form:radiobutton path="gender"  name="gender" id="male" value="MALE"/> Male


                                                <form:radiobutton path="gender"  name="gender" id="female" value="FEMALE"/> Female


                                                <form:radiobutton path="gender"  name="gender" id="other" value="OTHER"/> Other
                                             <br>
                                                <form:errors path="gender"/>

                                            </td>
                                        </tr>




                                        <tr style="padding-top: 10px;">
                                            <td width="50%" style="padding-left: 0px; background-color: #303030;">

                                                <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 10px;">
                                                    Email:
                                                </h6>

                                                <form:input path="email"  name="email" value="" class="form-control" id="text-box-normal"  style="width:320px"/>
                                                <form:errors path="email"/>
                                            </td>

                                            <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                                <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 10px;">
                                                    Password:
                                                </h6>

                                                <form:password path="password" name="password" value="" class="form-control" id="text-box-normal" style="width:320px"/>
                                                <form:errors path="password"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="50%" style="background-color: #303030;">

                                            </td>
                                            <td width="50%" style="padding-top:50px; padding-left:130px; background-color: #303030;">
                                                <div >
                                                    <!--<input type="submit" class="btn btn-success" id="button-glow" />-->

                                                    <a href="javascript:$('form').submit();"  id="buttonGlow"

                                                       style=" filter: hue-rotate(180deg); cursor: pointer;">Sign Up</a>
                        
                                                </div><br />
                                                
                                            </td>
                                        </tr>


                                    </table>

                                </td>
                            </tr>
                        </table>




                        <br />
                        <br />


                        


                         </form:form>


            </div>


            </td>


        </tr>

    </table>
</div>
</body>
<script>
    var loadFile = function (event) {
        var image = document.getElementById('output');
        image.src = URL.createObjectURL(event.target.files[0]);
    }
</script>
</html>