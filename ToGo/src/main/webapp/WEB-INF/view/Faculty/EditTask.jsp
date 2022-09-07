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
            href="${pageContext.request.contextPath}/css/flatpickr.min.css">

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
          <a href="${pageContext.request.contextPath}/faculty/viewtask"
      onMouseOver="this.style.color='#fe9783';"
      onMouseOut="this.style.color='#6495ed'">
          <i class="fa fa-angle-double-left fa-2x"></i>
      </a>
      </div>

    <div align="center" style="margin-left: 0px; margin-top:5%; margin-bottom: 20px;
      background-color: #303030; height: 600px; width: 760px;
      padding-top: 10px;
               padding-bottom: 20px; border: 1px solid #808080 ;
               box-shadow: 0 15px 35px 0 rgba(0,0,0,0.37); border-radius: 15px;">
             
                      <br />

                    <form:form action="edittask" modelAttribute="task" method="POST" id="form">
                      
                        <table >
                        <h4  align="center" style="width:300px;  color: #b0acac; font-family:Verdana, Geneva, Tahoma, sans-serif;padding-bottom:10px;">Add Task</h4></span>
                        
                        
                        <p>Date : <span id="current_date"></span></p>
                        <p>Time : <span id="current_time"></span></p>
                        <br>

                          <tr>
                              <td width="50%" style="margin-left: 20px; background-color: #303030; display: none">





                                  <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 0px;">
                                      Room Id:
                                  </h6>

                                  <form:input path="taskId" type="text" name="roomId" value="" class="form-control" id="text-box-normal" style="width:300px" readonly="true"/>
                                  <form:errors path="taskId"/>
                              </td>
                              <td width="50%" style="margin-left: 20px; background-color: #303030;">





                                              <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 0px;">
                                                  Room Id:
                                              </h6>

                        <form:input path="roomId" type="text" name="roomId" value="" class="form-control" id="text-box-normal" style="width:300px" readonly="true"/>
                        <form:errors path="roomId"/>
                                          </td>                                          


                                          <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                              <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                  Task Title:
                                              </h6>

                        <form:input path="taskTitle" type="text" name="taskTitles" value="" class="form-control" id="text-box-normal"/>
                        <form:errors path="taskTitle"/>
                                          </td>
                                      </tr>


                                      <tr>

                                          <td colspan="2" width="200px" style="margin-left: 20px; background-color: #303030;">
                                              <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                  Task Details:
                                              </h6>
                        <form:textarea path="taskDetails" type="text" name="taskDetails" value="" class="form-control" id="text-box-normal"/>
                        <form:errors path="taskDetails"/>
                        <%--
                        <textarea rows="5" cols="100" class="form-control" id="text-area-normal" style="margin-left: -20px; min-width: 500px; min-height: 60px; max-width: 500px; max-height:60px;"></textarea>
                                              --%>
                                              


                                              <!-- <input style="margin-left: -20px;" type="text" name="TASK_DETAILS" value="" class="form-control email_box" id="text-box-normal" />
                                              <font style="margin-left: -80px; color: #fe9783">
                                              </font> -->
                                          </td>
                                          

                                          
                                      </tr>
                                      
                                      
                                      <tr>


                                        <td width="50%" style="margin-left: 0px; background-color: #303030;">
                                          <h6 style="font-weight: lighter; padding-top: 10px; color: #c9c9c9; margin-left: 0px;">
                                              Starting Time:
                                          </h6>



                        <form:input path="startTime" type="datetime-local" name="startTime" value="" class="form-control" id="text-box-normal"/>
                        <form:errors path="startTime"/>
                                      </td>



                                        <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                            <h6 style="font-weight: lighter; padding-top: 10px; color: #c9c9c9; margin-left: 0px;">
                                                Closing Time:
                                            </h6>

                        <form:input path="endTime" type="datetime-local" name="endTime" value="" class="form-control" id="text-box-normal"/>
                        <form:errors path="endTime"/>
                                        </td>


                                  
                                    </tr>



<!-- 

                                          <tr>
                                            <td align="center" colspan="2" width="50%" style="margin-left: 0px; background-color: #303030;">
                                              <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                  Submission File/Link:
                                              </h6>

                                              <input style="margin-left: 0px;" type="password" name="PASSWORD" value="" class="form-control" id="text-box-normal" readonly/>
                                              <font style="margin-left: 20px; color: #fe9783">
                                              </font>
                                          </td>
                                      </tr> -->



                                      <tr>
                                          
                                          <td align="center" colspan="2" width="100%" style="padding-top:70px; padding-left: 0px; background-color: #303030;">
                                              <div >
                                                  <!--<input type="submit" class="btn btn-success" id="button-glow" />-->
                      
                                                  <a href="javascript:$('form').submit();" id="buttonGlow" style=" filter: hue-rotate(180deg); cursor: pointer;">Update Task</a>
                      
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
                <a href="${pageContext.request.contextPath}/faculty/addtask" class="list-group-item" id="right-layout-default">
                <span class="row-no-gutters">
                  <span class="col-sm-offset-1"> Add Task </span>
                </span>
                </a>
                <a href="${pageContext.request.contextPath}/faculty/viewtask" class="list-group-item" id="right-layout">
                <span class="row-no-gutters">
                  <span class="col-sm-offset-1"> View Task </span>
                </span>
                </a>



            </div>-->
        </div>

      </div>
    </div>

  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

  <script>

      config={

          enableTime: true,
          dateFormat: "Y-m-d H:i",

      }

      flatpickr("input[type=datetime-local]", config);
  </script>

  </body>

  <script>
    date = new Date(); 
    year = date.getFullYear(); 
    month = date.getMonth() + 1; 
    day = date.getDate(); 
    document.getElementById("current_date").innerHTML = month +"/" + day + "/" + year;


    // d=new Date();
    // time = d.getTime();
    // document.getElementById("current_time").innerHTML = time;

    d = new Date().toLocaleTimeString(undefined, {
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit'
})
document.getElementById("current_time").innerHTML = d;

  </script>;
</html>
