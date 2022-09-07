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
  
  <body style="overflow: hidden; background-color: #1f1c3b;">
  <%@ include file='HeaderFaculty.jsp' %>
    <div id="up-navbar" style="margin-bottom: 60.5px"></div>

    <div class="container-fluid body-content" style="  height: 100%;">
      <div class="row">
       
          <div
            class="col-sm-2 side-nav-content side-nav-layout"
            id="side-navbar"
            style="overflow-y: hidden; position:inherit"
          >
              <%@ include file='NavMenuFaculty.jsp' %>

          </div>
      
        <div
          class="col-sm-8"
          style="background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
          backdrop-filter:blur(10px);
          -webkit-backdrop-filter: blur(10px);  height: 92vh;  overflow-y:auto; "
          align="center"
        >
            <div align="left" style="margin-top:15px; padding-left: 40px; ">
                <c:url var="classLink" value="viewclassroom">
                    <c:param name="roomId" value="${classroom.roomId}"/>
                </c:url>

                <a href="${classLink}"
                   onMouseOver="this.style.color='#fe9783';"
                   onMouseOut="this.style.color='#6495ed'">
                    <i class="fa fa-angle-double-left fa-2x"></i>
                </a>
            </div>



        <div align="" style="margin-left: 0px; margin-top:100px; margin-bottom: 20px; 
        background-color: #303030; height: 450px; width: 760px; 
                 padding-top: 10px; padding-left: 10px; 
                padding-right: 10px; padding-bottom: 20px; border: 1px solid #808080 ;
                 box-shadow: 0 15px 35px 0 rgba(0,0,0,0.37); border-radius: 15px;">
               
                        <br />

                    <form:form action="editclassroom" modelAttribute="classroom" method="POST" id="form">
                        <table style="margin-top: -20px;">
                          <h4  align="center" style="width:100%;  color: #b0acac; font-family:Verdana, Geneva, Tahoma, sans-serif; padding-bottom:60px;">Edit Classroom Information</h4></span>


                            



                            <tr>
                            
                                            <td width="50%" style="margin-left: 20px; background-color: #303030;">

                                                <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 0px;">
                                                    Faculty ID:
                                                </h6>

                        <form:input path="facultyId" type="text" name="facultyId" value="" class="form-control" id="text-box-normal" style="width:300px" readonly="true"/>
                        <form:errors path="facultyId"/>
                                            </td>

                                            <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                                <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                    Room ID:
                                                </h6>

                        <form:input path="roomId" type="text" name="roomId" value="" class="form-control" id="text-box-normal" style="width:300px" readonly="true"/>
                        <form:errors path="roomId"/>
                                            </td>
                                        </tr>


                                        <tr>

                                            <td width="50%" style="margin-left: 20px; background-color: #303030;">
                                                <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                    Course Name:
                                                </h6>

                        <form:input path="courseName" type="text" name="courseName" value="" class="form-control" id="text-box-normal" style="width:300px"/>
                        <form:errors path="courseName"/>
                                            </td>


                                            <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                                <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                    Course Section:
                                                </h6>

                        <form:input path="courseSection" type="text" name="courseSection" value="" class="form-control" id="text-box-normal" style="width:300px" />
                        <form:errors path="courseSection"/>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td width="50%" style="background-color: #303030;">

                                            </td>
                                            <td width="50%" style="padding-top:50px; padding-left:60px; background-color: #303030;">
                                                <div >
                                                    <!--<input type="submit" class="btn btn-success" id="button-glow" />-->

                                                    <a href="javascript:$('form').submit();" id="buttonGlow" style=" filter: hue-rotate(180deg);margin-right: -15px;cursor: pointer;">Save Changes</a>
                        
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


        <!-- <div
            class="col-sm-2 side-nav-content side-nav-layout"
            id="side-navbar"
            style="overflow-y: hidden; background-color: #1f1c3b;">
        <div class="row>">
          <a href="/View/Faculty/ViewClassRoomTable.html" class="list-group-item" id="right-layout">
            <span class="row-no-gutters">
              <span class="col-sm-offset-1"> View ClassRoom </span>
            </span>
          </a>
          <a href="/View/Faculty/AddClassroom.html" class="list-group-item" id="right-layout-default">
            <span class="row-no-gutters">
              
              <span class="col-sm-offset-1"> Add ClassRoom </span>
            </span>
          </a>

         
          
        </div>
        </div> -->

      </div>
    </div>

    
  </body>
</html>
