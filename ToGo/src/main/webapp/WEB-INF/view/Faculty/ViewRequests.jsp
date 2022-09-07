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
      <link type="text/css"
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/TableDesign.css">


      <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TOGO</title>
      <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/Image/Togo.png">

  </head>
  
  <body style="overflow: hidden;background-color: #1f1c3b;">
  <%@ include file='HeaderFaculty.jsp' %>
    <div id="up-navbar" style="margin-bottom: 60.5px"></div>

    <div class="container-fluid body-content" style="  height: 100%;">
      <div class="row">
       
          <div
            class="col-sm-2 side-nav-content side-nav-layout"
            id="sideNavbar"
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
         
        <div align="left" style="margin-top:20px; padding-left: 40px; ">
          <a href="${pageContext.request.contextPath}/faculty/viewclassroomtable"
      onMouseOver="this.style.color='#fe9783';"
      onMouseOut="this.style.color='#6495ed'">
          <i class="fa fa-angle-double-left fa-2x"></i>
      </a>
      </div>
        <h4>View Requested Students</h4>
            <h6 style="color:#888888; padding-top: 20px">Total: ${msg} Student Requests</h6>
        <hr style="height: 2px; background-color: #fa6e6d; border: none;" />
         <br>

         <div style="overflow-x: auto;">
        <table class="user_table" width="95%">
          <thead>
              <tr>

                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Student ID</th>
                  <th>Email</th>
                  <th>Action</th>
                  <th>Action</th>
              </tr>
          </thead>
          <tbody class="table-body">
              

              <c:forEach var="student" items="${students}">

                  <c:url var="acceptLink" value="acceptstudent">
                      <c:param name="studentId" value="${student.studentId}"/>
                  </c:url>
                  <c:url var="declineLink" value="declinestudent">
                      <c:param name="studentId" value="${student.studentId}"/>
                  </c:url>

                  <tr>
                      <td style="word-break:break-all;"> ${student.firstName}</td>
                      <td style="word-break:break-all;"> ${student.lastName}</td>
                      <td style="word-break:break-all;"> ${student.studentId}</td>
                      <td style="word-break:break-all;"> ${student.email}</td>
                      <td >
                          <a href="${acceptLink}"  style="white-space: nowrap;text-decoration: none;width:120px;  cursor: pointer;"class="button" >Accept Student</a>
                      </td>
                      <td >
                          <a href="${declineLink}" style="white-space: nowrap;text-decoration: none;width:120px;  cursor: pointer;"class="button" >Decline Student</a>
                      </td>
              </tr>
              </c:forEach>
          </tbody>
      </table>
    </div>

        </div>


        <div
            class="col-sm-2 side-nav-content side-nav-layout"
            id="side-navbar"
            style="overflow-y: hidden; background-color: #1f1c3b;">
            <div class="row>">
              <a href="${pageContext.request.contextPath}/faculty/viewclassroom" class="list-group-item" id="right-layout">
                <span class="row-no-gutters">
                  
                  <span class="col-sm-offset-1"> ClassRoom Info </span>
                </span>
              </a>
    
              <a href="${pageContext.request.contextPath}/faculty/viewstudents" class="list-group-item" id="right-layout">
                <span class="row-no-gutters">
                  <span class="col-sm-offset-1"> View Students </span>
                </span>
              </a>
              <a href="${pageContext.request.contextPath}/faculty/viewrequests" class="list-group-item" id="right-layout-default">
                <span class="row-no-gutters">
                  <span class="col-sm-offset-1"> View Request </span>
                </span>
              </a>
              <a href="${pageContext.request.contextPath}/faculty/addtask" class="list-group-item" id="right-layout">
                <span class="row-no-gutters">
                  <span class="col-sm-offset-1"> Add Task </span>
                </span>
              </a>
              <a href="${pageContext.request.contextPath}/faculty/viewtask" class="list-group-item" id="right-layout">
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
