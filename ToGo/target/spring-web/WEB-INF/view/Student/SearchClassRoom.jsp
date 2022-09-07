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

      <meta charset="UTF-8">

      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TOGO</title>
      <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/Image/Togo.png">

  </head>
  
  <body style="overflow: hidden;background-color: #1f1c3b;">
  <%@ include file='HeaderStudent.jsp' %>

    <div id="up-navbar" style="margin-bottom: 60.5px"></div>

    <div class="container-fluid body-content" style="  height: 100%;">
      <div class="row">
       
          <div
            class="col-sm-2 side-nav-content side-nav-layout"
            id="sideNavbar"
            style="overflow-y: hidden; position:inherit"
          > <%@ include file='NavMenuStudent.jsp' %></div>
      
        <div
          class="col-sm-8"
          style="background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
          backdrop-filter:blur(10px);
          -webkit-backdrop-filter: blur(10px);  height: 92vh;  overflow-y:auto; "
          align="center"
        >
        <div align="center">
            <br />
            <h4>ClassRoom Details</h4>
            <h6 style="color:#888888; padding-top: 20px">Total: ${msg} Classrooms Found</h6>

            <hr style="height: 2px; background-color: #fa6e6d; border: none;" />
            <form:form action="searchclassroom" modelAttribute="class" method="POST" id="form">

                <table style="background-color: transparent">
                    <tr>
                        <td>
                            <form:input path="text" name="text" placeholder="Search here" value="" class="form-control" id="text-box-normal" style="width:300px" />
                            <form:errors path="text"/>
                        </td>
                        <td style="padding-left: 20px;">
                            <div  class="button" style="width:40px; height:40px; padding-left: 8px; padding-top: 8px;">
                            <a href="javascript:$('form').submit();"  onMouseHover="this.style.color='#fe9783';"
                            onMouseDown="this.style.color='white';">
                                <i class="fa fa-search"></i>
                            </a>
                            </div>
                        </td>
                    </tr>
                </table>


            </form:form>
            <br />
            <br />



        </div>


       
        <table class="user_table" width="95%">
          <thead>
              <tr>
                  <th>Faculty ID</th>
                  <th>Room ID</th>
                  <th>Course Name</th>
                  <th>Course Section</th>
                  <th align="center">Action</th>
              </tr>
          </thead>
          <tbody class="table-body">


          <c:forEach var="classdetail" items="${classrooms}">
              <c:url var="joinlink" value="joinclassroom">
                  <c:param name="roomId" value="${classdetail.roomId}"/>
              </c:url>

              <tr>
                  <td style="word-break:break-all;"> ${classdetail.facultyId}</td>
                  <td style="word-break:break-all;"> ${classdetail.roomId}</td>
                  <td style="word-break:break-all;"> ${classdetail.courseName}</td>
                  <td style="word-break:break-all;"> ${classdetail.courseSection}</td>
                  <td align="center" >
                      <c:choose>
                          <c:when test="${classdetail.status=='PENDING'}">
                              ${classdetail.status}
                          </c:when>
                          <c:otherwise>
                              <a href="${joinlink}"  style="white-space: nowrap;text-decoration: none;width:120px; cursor: pointer;"class="button">Join Request</a>

                          </c:otherwise>
                      </c:choose>

                  </td>
              </tr>
          </c:forEach>

          </tbody>
        </table>
        </div>

        <div class="col-sm-2 side-nav-content side-nav-layout"
        id="side-navbar"
        style="overflow-y: hidden; background-color: #1f1c3b;">
    <div class="row>">
      <a href="${pageContext.request.contextPath}/student/viewclassroomtable" class="list-group-item" id="right-layout">
        <span class="row-no-gutters">
          <span class="col-sm-offset-1"> View ClassRoom </span>
        </span>
      </a>
      <a href="${pageContext.request.contextPath}/student/searchclassroom" class="list-group-item" id="right-layout-default">
        <span class="row-no-gutters">
          
          <span class="col-sm-offset-1"> Search ClassRoom </span>
        </span>
      </a>

     
      
    </div>
    </div>

       

      </div>
    </div>

    
  </body>
</html>
