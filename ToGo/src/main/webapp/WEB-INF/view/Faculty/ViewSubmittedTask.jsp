<%@ page import="java.util.List" %>
<%@ page import="com.model.SUBMIT_TASK" %>
<%@ page import="com.model.viewmodel.SubmitTaskLinkVM" %>
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
          >  <%@ include file='NavMenuFaculty.jsp' %>
          </div>
      
        
          <div
          class="col-sm-8"
          style="background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
          backdrop-filter:blur(10px);
          -webkit-backdrop-filter: blur(10px);  height: 92vh;  overflow-y:auto; "
          align="center"
        >
  
        <div align="left" style="margin-top:20px; padding-left: 40px; ">
            <a href="${pageContext.request.contextPath}/faculty/viewtask"
        onMouseOver="this.style.color='#fe9783';"
        onMouseOut="this.style.color='#6495ed'">
            <i class="fa fa-angle-double-left fa-2x"></i>
        </a>
        </div>
  
          <div width="100%" align="center" style="font-family: 'Times New Roman'; font-size: 20px; color: #e2344d ">
  
              <img src="${pageContext.request.contextPath}/Image/task.png" title="Profile" class="img-circle hover-profile"width="20%" height="20%" />
              <br /><br />
             
                  <!-- <label style="color: #d29e8e">Classroom Details</label> -->
              
              <br />

              <h6 style="color:#888888; padding-top: 20px">Total: ${msg} Submissions</h6>

              <hr style="width:50%" />
              <br />
              <div style="text-align: left; padding-left: 10%; font-family: 'Times New Roman'; font-size: 20px; color: #d29e8e">
  
                  <span style="border-image: linear-gradient(135deg, #d3836b, #7e8383); border-image-slice: 1; border-bottom: solid; padding-left: 0px; padding-right: 20px; padding-bottom:5px;">
                      Task Details:
                  </span>
                  <br />
  
                  <br />
  
  
  
              <div style="text-align: left; padding-left: 10%; font-family: 'Times New Roman'; font-size: 20px; color: #25aa98">
  
                  <strong>Room ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </strong><span style="color:#d1c7ed; font-size: 18px;">${task.roomId}</span>
                  <br />
                  <strong>Task Title &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </strong><span style="color:#d1c7ed; font-size: 18px;">${task.taskTitle}</span>
                  <br />
                  <strong>Task Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong> <span style="color: #d1c7ed;font-size: 18px; ">${task.taskDetails}</span>
                  <br />
                  <strong>Starting Time &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong> <span style="color: #d1c7ed;font-size: 18px; ">${task.startTime}</span>
                  <br />
                  <strong>Closing Time &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong> <span style="color: #d1c7ed;font-size: 18px; ">${task.endTime}</span>
                  <br />
                  <span style="color: #d1c7ed;font-size: 18px; display: none;" class="endTime">${task.postTime}</span>
                  <strong>Time Remaining &nbsp;&nbsp;&nbsp;:</strong>

                          <span id="days">0</span><small>Days</small>

                          <span id="hours">0</span><small>Hours</small>

                          <span id="minutes">0</span><small>Minutes</small>

                          <span id="seconds">0</span><small>Seconds</small>
                  <c:choose>
                      <c:when test="${task.status=='WAITING'}">
                         <small > left to Start</small>
                      </c:when>
                      <c:otherwise>

                      </c:otherwise>
                  </c:choose>


                  <br />
                  
              </div>
              </div>
            </div>
              <br />
  
              <table class="user_table" width="95%">
                <thead>
                  <tr>
                      <th>Submitted Name</th>
                    <th>Submitted ID</th>
                      <th>Submitted Time</th>
                      <th>Submitted Task</th>
                  </tr>
                </thead>
                <tbody class="table-body">
                <c:forEach var="submitTask" items="${submitTasks}">

                    <c:url var="viewLink" value="viewsubmission">
                        <c:param name="taskId" value="${submitTask.taskId}"/>
                        <c:param name="studentId" value="${submitTask.studentId}"/>
                    </c:url>

                    <tr>
                        <td style="word-break:break-all;"> ${submitTask.studentName}</td>
                        <td style="word-break:break-all;"> ${submitTask.studentId}</td>
                        <td style="word-break:break-all;"> ${submitTask.submittedTime}</td>
                        <td >

                            <c:choose>
                                <c:when test="${submitTask.link==null}">
                                </c:when>
                                <c:otherwise>
                                    <c:set var="links" value="${submitTask.link}"/>
                                    <%List<String> links= (List<String>) pageContext.getAttribute("links");%>
                                    <a onclick="redirectPage('<%=links%>')" style="white-space: nowrap;text-decoration: none;width:150px; margin-right:0px; margin-bottom: 5px; cursor: pointer;"class="button">Check Link</a>

                                </c:otherwise>
                            </c:choose>

                            <a href="${viewLink}" style="white-space: nowrap;text-decoration: none; width:150px;  cursor: pointer;"class="button">View Submission</a>

                        </td>


                    </tr>
                </c:forEach>
                </tbody>
              </table>              


  
          <!-- </div> -->
  
  
  
  
      </div>






        <!--<div
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
              <a href="${pageContext.request.contextPath}/faculty/viewrequests" class="list-group-item" id="right-layout">
                <span class="row-no-gutters">
                  <span class="col-sm-offset-1"> View Request </span>
                </span>
              </a>
              <a href="${pageContext.request.contextPath}/faculty/addtask" class="list-group-item" id="right-layout">
                <span class="row-no-gutters">
                  <span class="col-sm-offset-1"> Add Task </span>
                </span>
              </a>
              <a href="${pageContext.request.contextPath}/faculty/viewtask" class="list-group-item" id="right-layout-default">
                <span class="row-no-gutters">
                  <span class="col-sm-offset-1"> View Task </span>
                </span>
              </a>
              
            </div>
        </div>-->

      </div>
    </div>
  <script>


      /*counter*/

      const days = document.getElementById('days');
      const hours = document.getElementById('hours');
      const minutes = document.getElementById('minutes');
      const seconds = document.getElementById('seconds');

      // var endTime = "2022-08-17 12:00";
      var endTime = document.querySelector('.endTime').textContent.toString();

      if(endTime=="N/A")
      {
          days.innerHTML = 0;
          hours.innerHTML = 0;
          minutes.innerHTML = 0;
          seconds.innerHTML = 0;
      }
      else{


      var dateTimeArray = endTime.split(" ");
      var dateArray=dateTimeArray[0].split("-");
      var timeArray=dateTimeArray[1].split(":");


      const leftTime = new Date(dateArray[1]+' '+dateArray[2]+' '+dateArray[0]+' '+timeArray[0]+':'+timeArray[1]+':00');

      function updateCountdown() {
          const currentTime = new Date();
          const diff = leftTime - currentTime;
if(diff<0)
{
    days.innerHTML = 0;
    hours.innerHTML = 0;
    minutes.innerHTML = 0;
    seconds.innerHTML = 0;
}
else{
    const d = Math.floor(diff / 1000 / 60 / 60 / 24);
    const h = Math.floor(diff / 1000 / 60 / 60) % 24;
    const m = Math.floor(diff / 1000 / 60) % 60;
    const s = Math.floor(diff / 1000) % 60;

    days.innerHTML = d;
    hours.innerHTML = h < 10 ? '0' + h : h;
    minutes.innerHTML = m < 10 ? '0' + m : m;
    seconds.innerHTML = s < 10 ? '0' + s : s;
}

      }

      setInterval(updateCountdown, 1000);
      }


      function redirectPage(links)
      {
          console.log(links)
          let newArray = links.split(', ');
          for(var i = 0; i < newArray. length ; i++){
              newArray[i]= newArray[i].toString().replace('[', '');
              newArray[i]= newArray[i].toString().replace(']', '');
              console. log(newArray[i].toString());
              window.open(newArray[i].toString(),"_blank");
          }


      }



  </script>
    
  </body>
</html>
