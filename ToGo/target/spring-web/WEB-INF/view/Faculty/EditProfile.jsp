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
          href="${pageContext.request.contextPath}/css/RightNavLayout.css">

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/TextBox.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/ButtonGlow.css">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TOGO</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/Image/Togo.png">

</head>

<body style="overflow: hidden; background-color:#1f1c3b ;">
<%@ include file='HeaderFaculty.jsp' %>
    <div id="up-navbar" style="margin-bottom: 60.5px"></div>
    <div class="container-fluid body-content" style="  height: 100%;">
     <div class="row">
         
            <div
              class="col-sm-2 side-nav-content side-nav-layout"
              id="sideNavbar"
              style="overflow-y: hidden; position:inherit"
            ><%@ include file='NavMenuFaculty.jsp' %>

            </div>
        
          <div
            class="col-sm-8"
            style=" background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
            backdrop-filter:blur(10px);
            -webkit-backdrop-filter: blur(10px); height: 92vh;  overflow-y:auto;"
            align="center"
          >
    
          <div align="left" style="margin-top:15px; padding-left: 40px; ">
            <a href="${pageContext.request.contextPath}/faculty/profile"
        onMouseOver="this.style.color='#fe9783';"
        onMouseOut="this.style.color='#6495ed'">
            <i class="fa fa-angle-double-left fa-2x"></i>
        </a>
        </div>

        <div align="center" style="background-color: #303030; height: 620px; width: 760px; 
          padding-top: 10px; padding-left: 10px; margin-top: 5px;
         padding-right: 10px; padding-bottom: 20px; border: 0px solid #808080 ;
          border-radius: 15px; box-shadow: 0 15px 35px 0 rgba(0,0,0,0.37);">
        
             <br />

            <form:form action="editprofile" modelAttribute="faculty" method="POST" id="form">
                 <table style="margin-top: -20px;">
                     <tr>
                         <td >

                         </td>

                         <td width="100%" align="" style="background-color: #303030; padding-top:20px;">
                             <table width="660px" >
                                 <tr>
                                     <td colspan="2" width="80%" align="center" style="background-color: #303030; padding-left:10px; padding-top:10px; padding-bottom:20px;">
                                       
                                   <img src="${pageContext.request.contextPath}/Image/white.png" id="output" width="150" height="150" class="img-circle" />
                                   <br>
                                 <!--  <label for="file" id="buttonGlow" style="cursor: pointer; font-size:12px">Select Image</label>
                                   <input type="file" asp-for="PROFILE_PICTURE" accept="image/*" name="PROFILE_PICTURE" id="file" 
                                          style="display: none;">
                                     -->
                                         
                                     </td>
                                 </tr>

                                 <tr >

                                     <td width="50%" style="margin-left: 20px; background-color: #303030;">

                                         <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 0px;">
                                             First Name:
                                         </h6>

                                         <form:input path="firstName" type="text" name="firstName" value="" class="form-control" id="text-box-normal" style="width:300px"/>
                                         <form:errors path="firstName"/>
                                     </td>

                                     <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                         <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                             Last Name:
                                         </h6>

                                         <form:input path="lastName" type="text" name="lastname" value="" class="form-control" id="text-box-normal" style="width:300px"/>
                                         <form:errors path="lastName"/>
                                     </td>
                                 </tr>


                                 <tr>
                                     <td width="50%" style="padding-left: 0px; background-color: #303030;">

                                         <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 0px;">
                                             Faculty ID:
                                         </h6>

                                         <form:input path="facultyID"  name="facultyID" value="" class="form-control" id="text-box-normal" style="width:300px" readonly="true"/>
                                         <form:errors path="facultyID"/>
                                     </td>

                                     <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                        <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 0px;">
                                            Email:
                                        </h6>

                                         <form:input path="email" type="text" name="email" value="" class="form-control" id="text-box-normal" style="width:300px" readonly="true"/>
                                         <form:errors path="email"/>
                                     </td>
                                 </tr>
                                 <tr>
                                    <td width="50%" style="padding-left: 0px; background-color: #303030;">

                                        <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 0px;">
                                            Designation:
                                        </h6>

                                        <form:input path="designation" type="text" name="designation" value="" class="form-control" id="text-box-normal" style="width:300px" readonly="true"/>
                                        <form:errors path="designation"/>
                                    </td>

                                    <td width="50%" style="background-color: #303030;">
                                       
                                    </td>
                                </tr>
                                 <tr>
                                     <td width="50%" style="background-color: #303030;">

                                     </td>
                                     <td width="50%" style="padding-top:30px; padding-left:60px; background-color: #303030;">
                                         <div  >
                                             <!--<input type="submit" class="btn btn-success" id="button-glow" />-->
                 
                                             <a href="javascript:$('form').submit();" id="buttonGlow" style=" filter: hue-rotate(180deg);margin-right: -15px;cursor: pointer;">Save Changes</a>
                 
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

    
    
        </div>
    
    
        <div
            class="col-sm-2 side-nav-content side-nav-layout "
            id="side-navbar"
            style="overflow: hidden; background-color: #1f1c3b;">
        
           
           
    
        </div>
    
    
        </div>  
        </div>
</body>
</html>