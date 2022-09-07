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
            href="${pageContext.request.contextPath}/css/TableDesign.css">



      <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TOGO</title>
      <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/Image/Togo.png">

  </head>
  
  <body style="overflow: hidden; background-color:#1f1c3b ;">
  <%@ include file='HeaderStudent.jsp' %>
    <div id="up-navbar" style="margin-bottom: 60.5px"></div>

    <div class="container-fluid body-content" style="  height: 100%;">
      <div class="row">
       
          <div
            class="col-sm-2 side-nav-content side-nav-layout"
            id="sideNavbar"
            style="overflow-y: hidden; position:inherit"
          >  <%@ include file='NavMenuStudent.jsp' %>

          </div>
      
        <div
        class="col-sm-8"
        style="background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
        backdrop-filter:blur(10px);
        -webkit-backdrop-filter: blur(10px);  height: 92vh;  overflow-y:auto; "
        align="center"
      >

      <div align="left" style="margin-top:20px; padding-left: 40px; ">
        <a href="${pageContext.request.contextPath}/student/viewclassroomtable"
    onMouseOver="this.style.color='#fe9783';"
    onMouseOut="this.style.color='#6495ed'">
        <i class="fa fa-angle-double-left fa-2x"></i>
    </a>
    </div>

        <div width="100%" align="center" style="font-family: 'Times New Roman'; font-size: 20px; color: #e2344d ">

            <img src="${pageContext.request.contextPath}/Image/classroom.png" title="Profile" class="img-circle hover-profile" width="20%" height="20%" />
            <br /><br />
           
                <!-- <label style="color: #d29e8e">Classroom Details</label> -->
            
            <br />

            <hr style="width:50%" />
            <br />
            <div style="text-align: left; padding-left: 10%; font-family: 'Times New Roman'; font-size: 20px; color: #d29e8e">

                <span style="border-image: linear-gradient(135deg, #d3836b, #7e8383); border-image-slice: 1; border-bottom: solid; padding-left: 0px; padding-right: 20px; padding-bottom:5px;">
                    Classroom Details:
                </span>
                <br />

                <br />



            <div style="text-align: left; padding-left: 10%; font-family: 'Times New Roman'; font-size: 20px; color: #25aa98">

                <strong>Room ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </strong><span style="color:#d1c7ed; font-size: 18px;"> ${user.roomId}</span>
                <br />
                <strong>Faculty ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </strong><span style="color:#d1c7ed; font-size: 18px;"> ${user.facultyId}</span>
                <br />
                <strong>Course Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong> <span style="color: #d1c7ed;font-size: 18px; "> ${user.courseName}</span>
                <br />
                <strong>Course Section  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong> <span style="color: #d1c7ed;font-size: 18px; "> ${user.courseSection}</span>
                <br />
                
            </div>
            </div>

            <br />

            <br />
            <br />
            <!-- <span>
                <a href="/View/Faculty/EditClassroom.html" id="button" >Edit Classroom</a>
                &nbsp;&nbsp;
                <a href="#" onclick="" id="button">Remove Classroom</a>
                 
                  <c:url var="deletelink" value="deleteclassroom">
                  <c:param name="roomId" value="${user.roomId}"/>
              </c:url>


              </span> -->
            <span>
                    <a href="${deletelink}" class="button" >Leave Classroom</a>
            </span>
             

        </div>




    </div>

        
    <div class="col-sm-2 side-nav-content side-nav-layout"
    id="side-navbar"
    style="overflow-y: hidden; background-color: #1f1c3b;">
<div class="row>">
  <a href="${pageContext.request.contextPath}/student/viewclassroom" class="list-group-item" id="right-layout-default">
    <span class="row-no-gutters">
      
      <span class="col-sm-offset-1"> ClassRoom Info</span>
    </span>
  </a>

  <a href="${pageContext.request.contextPath}/student/viewtasktable" class="list-group-item" id="right-layout">
    <span class="row-no-gutters">
      <span class="col-sm-offset-1"> View Task </span>
    </span>
  </a>
  
</div>
</div>

      </div>
    </div>

    
  </body>
</html>
