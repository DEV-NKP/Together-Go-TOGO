
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

    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TOGO</title>
      <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/Image/Togo.png">

  </head>
  
  <body style="overflow: hidden;background-color: #1f1c3b;">
  <%@ include file='HeaderAdmin.jsp' %>
    <div id="up-navbar" style="margin-bottom: 60.5px"></div>

    <div class="container-fluid body-content" style="  height: 100%;">
      <div class="row">
       
          <div
            class="col-sm-2 side-nav-content side-nav-layout"
            id="sideNavbar"
            style="overflow-y: hidden; position:inherit"
          >
              <%@ include file='NavMenuAdmin.jsp' %>

          </div>
      
        <div
          class="col-sm-8"
          style="background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
          backdrop-filter:blur(10px);
          -webkit-backdrop-filter: blur(10px);  height: 92vh;  overflow-y:auto; height: 92vh;  overflow-y:auto; "
          align="center"
        >

            <div align="" style="margin-left: 0px; margin-top:50px; margin-bottom: 20px;
        background-color: #303030; height: 620px; width: 760px;
                 padding-top: 10px; padding-left: 10px;
                padding-right: 10px; padding-bottom: 20px; border: 1px solid #808080 ;
                 box-shadow: 0 15px 35px 0 rgba(0,0,0,0.37); border-radius: 15px;">
                        <br />

                        <%--@elvariable id="FACULTYS" type=""--%>
                        <form:form action="addfaculty" modelAttribute="facultyInfoVM" method="POST" id="form">
                        <table style="margin-top: -20px;">
                          <h4  align="left" style="width:200px;  color: #b0acac; font-family:Verdana, Geneva, Tahoma, sans-serif;padding-left: -100px; ">Faculty Details</h4>
                          <br>  <span class="msg-require text-danger">
                                    ${message}
                            </span><br><br>
                            <tr>

                                            <td width="50%" style="margin-left: 0px; background-color: #303030;">

                                                <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 0px;">
                                                    First Name:
                                                </h6>

                                                <form:input path="firstName" name="firstName" value="" class="form-control" id="text-box-normal" style="width:300px"/>
                                                 <form:errors path="firstName"/>

                                            </td>

                                            <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                                <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                    Last Name:
                                                </h6>

                                                <form:input path="lastName" name="lastName" value="" class="form-control" id="text-box-normal" style="width:300px"/>
                                                <form:errors path="lastName"/>

                                            </td>
                                        </tr>


                                        <tr>

                                            <td width="50%" style="margin-left: 0px; background-color: #303030;">
                                                <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                    Faculty ID:
                                                </h6>

                                                <form:input path="facultyID" name="facultyId" value="" class="form-control" id="text-box-normal" style="width:300px"/>
                                                <form:errors path="facultyID"/>

                                            </td>


                                            <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                                <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                    Gender:
                                                </h6>

                                                <form:radiobutton path="gender"  name="gender" id="male" value="MALE"/> Male


                                                <form:radiobutton path="gender"  name="gender" id="female" value="FEMALE"/> Female


                                                <form:radiobutton path="gender"  name="gender" id="other" value="OTHER"/> Other
                                                <br>
                                                <form:errors path="gender"/>
                                            </td>
                                        </tr>




                                        <tr>
                                            <td width="50%" style="padding-left: 0px; background-color: #303030;">

                                                <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 0px;">
                                                    Email:
                                                </h6>

                                                <form:input path="email"  name="email" value="" class="form-control" id="text-box-normal" style="width:300px"/>
                                                <form:errors path="email"/>
                                            </td>

                                            <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                                <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                    Password:
                                                </h6>

                                                <form:password path="password"  name="password" value="" class="form-control" id="text-box-normal" style="width:300px"/>
                                                <form:errors path="password"/>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td width="50%" style="padding-left: 0px; background-color: #303030;">

                                              <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 0px;">
                                                  Designation:
                                              </h6>

                                              <form:input path="designation"  name="designation" value="" class="form-control" id="text-box-normal" style="width:300px"/>
                                              <form:errors path="designation"/>
                                          </td>

                                          <td width="50%" style="margin-left: 0px; background-color: #303030;">
                                              
                                          </td>
                                      </tr>
                                        <tr>
                                            <td width="50%" style="background-color: #303030;">

                                            </td>
                                            <td width="50%" style="padding-top:50px; padding-left:110px; background-color: #303030;">
                                                <div >
                                                    <!--<input type="submit" class="btn btn-success" id="button-glow" />-->
                        
                                                    <a href="javascript:$('form').submit();" id="buttonGlow" style=" filter: hue-rotate(180deg); cursor: pointer;">Submit</a>
                        
                                                </div><br />
                                                
                                            </td>
                                        </tr>


                                    
                            </tr>
                        </table>

                        <br />
                        <br />
                        </form:form>
            </div>
            </div>
          



        <div
            class="col-sm-2 side-nav-content side-nav-layout"
            id="side-navbar"
            style="overflow-y: hidden; background-color: #1f1c3b;">
        <div class="row>">
         

          <a href="${pageContext.request.contextPath}/admin/showfaculty" class="list-group-item" id="right-layout">
            <span class="row-no-gutters">
              <span class="col-sm-offset-1"> Show Faculty </span>
            </span>
          </a>
          <a href="${pageContext.request.contextPath}/admin/addfaculty" class="list-group-item" id="right-layout-default">
            <span class="row-no-gutters">
              
              <span class="col-sm-offset-1"> Add Faculty </span>
            </span>
          </a>
          
        </div>
        </div>

      </div>
    </div>

    
  </body>
</html>
