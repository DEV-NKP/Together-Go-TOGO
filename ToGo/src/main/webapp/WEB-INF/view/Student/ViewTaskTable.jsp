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

  <body style="overflow: hidden; background-color: #1f1c3b">
  <%@ include file='HeaderStudent.jsp' %>
    <div id="up-navbar" style="margin-bottom: 60.5px"></div>

    <div class="container-fluid body-content" style="height: 100%">
      <div class="row">
        <div
          class="col-sm-2 side-nav-content side-nav-layout"
          id="sideNavbar"
          style="overflow-y: hidden; position: inherit"
        >
          <%@ include file='NavMenuStudent.jsp' %>

        </div>

        <div
          class="col-sm-8"
          style="
            background: linear-gradient(
              135deg,
              rgba(66, 44, 111, 0.7),
              rgba(48, 29, 70, 0.479)
            );
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            height: 92vh;
            overflow-y: auto;
          "
          align="center"
        >

        <div align="left" style="margin-top:20px; padding-left: 40px; ">
          <a href="${pageContext.request.contextPath}/student/viewclassroomtable"
      onMouseOver="this.style.color='#fe9783';"
      onMouseOut="this.style.color='#6495ed'">
          <i class="fa fa-angle-double-left fa-2x"></i>
      </a>
      </div>

          
          <h4>Tasks Detail</h4>
          <h6 style="color:#888888; padding-top: 20px">Total: ${msg} Task Found</h6>

          <hr style="height: 2px; background-color: #fa6e6d; border: none" />
          <br />
          <table class="user_table" width="95%">
            <thead>
              <tr>
                <th>Task Title</th>
                <th>Task Details</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Task Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody class="table-body">
            <c:forEach var="task" items="${tasks}">

              <c:url var="viewlink" value="viewtask">
                <c:param name="taskId" value="${task.taskId}"/>
              </c:url>
              <c:url var="viewsubLink" value="viewsubmission">
                <c:param name="taskId" value="${task.taskId}"/>
              </c:url>
              <c:url var="editLink" value="edittask">
                <c:param name="taskId" value="${task.taskId}"/>
              </c:url>



              <tr>
                <td style="word-break:break-all;"> ${task.taskTitle}</td>
                <td style="word-break:break-all;"> ${task.taskDetails}</td>
                <td style="word-break:break-all;"> ${task.startTime}</td>
                <td style="word-break:break-all;"> ${task.endTime}</td>
                <td style="word-break:break-all;"> ${task.status}</td>
                <td >
                <c:choose>
                  <c:when test="${task.status=='SUBMITTED'}">
                    <a href="${editLink}"  style="white-space: nowrap;text-decoration: none;width:150px;  cursor: pointer;"class="button">Re-Submit Task</a>
                  </c:when>
                  <c:otherwise>
                  <c:choose>
                        <c:when test="${task.status=='RUNNING'}">
                  <a href="${viewlink}" style="white-space: nowrap;text-decoration: none; width:150px;  cursor: pointer;"class="button">Submit Task</a>
                        </c:when>
                       <c:otherwise>

                         <c:choose>
                           <c:when test="${task.status=='WAITING'}">
                             <a style="white-space: nowrap;text-decoration: none; pointer-events: none;width:150px;  cursor: pointer;"class="button">Waiting to Start</a>
                           </c:when>
                           <c:otherwise>
                             <a href="${viewsubLink}" style="white-space: nowrap;text-decoration: none;width:150px; cursor: pointer;"class="button">View Submission</a>
                           </c:otherwise>
                         </c:choose>
                    </c:otherwise>
                    </c:choose>

                  </c:otherwise>
                </c:choose>

                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>

        <div
          class="col-sm-2 side-nav-content side-nav-layout"
          id="side-navbar"
          style="overflow-y: hidden; background-color: #1f1c3b"
        >
          <div class="row>">
            <a
              href="${pageContext.request.contextPath}/student/viewclassroom"
              class="list-group-item"
              id="right-layout"
            >
              <span class="row-no-gutters">
                <span class="col-sm-offset-1"> ClassRoom Info</span>
              </span>
            </a>

            <a
              href="${pageContext.request.contextPath}/student/viewtasktable"
              class="list-group-item"
              id="right-layout-default"
            >
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
