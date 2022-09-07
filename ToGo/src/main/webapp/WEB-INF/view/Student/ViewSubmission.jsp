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
          <a href="${pageContext.request.contextPath}/student/viewtasktable?taskId=<%=request.getParameter("taskId")%>"
      onMouseOver="this.style.color='#fe9783';"
      onMouseOut="this.style.color='#6495ed'">
          <i class="fa fa-angle-double-left fa-2x"></i>
      </a>
      </div>

      <div align="center" style="margin-left: 0px; margin-top:5%; margin-bottom: 20px;
      background-color: #303030; height: 650px; width: 760px;
      padding-top: 10px;
               padding-bottom: 20px; border: 1px solid #808080 ;
               box-shadow: 0 15px 35px 0 rgba(0,0,0,0.37); border-radius: 15px;">
             
                      <br />

                <form:form modelAttribute="task" method="POST" id="form">
                      
                        <table >
                        <h4  align="center" style="width:300px;  color: #b0acac; font-family:Verdana, Geneva, Tahoma, sans-serif;padding-bottom:10px;">Task View</h4></span>
                        
                        
                        <p>Date : <span id="current_date"></span></p>
                        <p>Time : <span id="current_time"></span></p>
                            <div
                                    id="countdown"
                                    class="countdown"
                                    style="display: flex; text-align: center;align-items: center;
justify-content: center;"
                            >
                                <div
                                        class="time"
                                        style="
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          margin: 15px;
        "
                                >
                                    <h2 id="days"></h2>
                                    <small>Days</small>
                                </div>

                                <div
                                        class="time"
                                        style="
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          margin: 15px;
        "
                                >
                                    <h2 id="hours"></h2>
                                    <small>Hours</small>
                                </div>

                                <div
                                        class="time"
                                        style="
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          margin: 15px;
        "
                                >
                                    <h2 id="minutes"></h2>
                                    <small>Minutes</small>
                                </div>

                                <div
                                        class="time"
                                        style="
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          margin: 15px;
        "
                                >
                                    <h2 id="seconds"></h2>
                                    <small>Seconds</small>
                                </div>
                            </div>

                          <tr style="padding-top: 10px;">
                          
                                       <td width="50%" style="margin-left: 0px;  background-color: #303030;">





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

                                              <form:input path="taskTitle" type="text" name="taskTitle" value="" class="form-control" id="text-box-normal" style="width:300px" readonly="true"/>
                                              <form:errors path="taskTitle"/>
                                          </td>
                                      </tr>


                                      <tr style="padding-top: 10px;">

                                          <td colspan="2" style="margin-left: 0px; background-color: #303030;">
                                              <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                  Task Details:
                                              </h6>

                                              <form:textarea path="taskDetails" type="text" name="taskDetails" value="" class="form-control" id="text-box-normal" style="width:630px" readonly="true"/>
                                              <form:errors path="taskDetails"/>
                                          </td>



                                      </tr>
                                      
                                      
                                      <tr style="padding-top: 10px;">
                                          <td width="50%" style="margin-left: 0px; background-color: #303030;">
                                              <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                  Starting Time:
                                              </h6>

                                              <form:input path="startTime" type="text" name="startTime" value="" class="form-control" id="text-box-normal" style="width:300px" readonly="true"/>
                                              <form:errors path="startTime"/>
                                          </td>

                                        <td width="50%" style="padding-left: 20px; background-color: #303030;">
                                            <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                Closing Time:
                                            </h6>

                                            <form:input path="endTime" type="text" name="endTime" value="" class="form-control endTime" id="text-box-normal" style="width:300px" readonly="true"/>
                                            <form:errors path="endTime"/>
                                        </td>


                                        <td width="50%" style="margin-left: 0px; background-color: #303030; display: none;">
                                            <h6 style="font-weight: lighter; color: #c9c9c9; margin-left: 0px;">
                                                Task Id:
                                            </h6>

                                            <form:input path="taskId"  name="taskId" value="" class="form-control" id="text-box-normal" style="width:300px" readonly="true"/>
                                            <form:errors path="taskId"/>
                                        </td>
                                    </tr>










                                          <tr style="padding-top: 10px;">
                                            <td align="center" colspan="2" width="50%" style="margin-left: 0px; background-color: #303030;">
                                              <h6 style="font-weight: lighter; padding-top: 0px; color: #c9c9c9; margin-left: 0px;">
                                                  Submission File/Link:
                                              </h6>
                    <form:textarea path="task" type="text" name="task" value="" class="form-control" id="text-box-normal" style="margin-left: 0px; min-width: 630px; min-height: 60px; max-height:60px;" readonly="true"/>
                    <form:errors path="task"/>

                    <!--   <textarea rows="5" cols="100" class="form-control" id="text-area-normal" style="margin-left: -20px; min-width: 500px; min-height: 60px; max-width: 500px; max-height:60px;"></textarea>



                                              <input style="margin-left: 0px;" type="password" name="PASSWORD" value="" class="form-control" id="text-box-normal" readonly/>
                                              <font style="margin-left: 20px; color: #fe9783">
                                              </font> -->
                                          </td>








                                      </tr>



                                  
                          </tr>
                      </table>

                      <br />
                      <br />
                       </form:form>


          </div>

        </div>


        <div class="col-sm-2 side-nav-content side-nav-layout"
            id="side-navbar"
            style="overflow-y: hidden; background-color: #1f1c3b;">
        <div class="row>">
         
          
        </div>
        </div>

      </div>
    </div>

    
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


        /*counter*/

        const days = document.getElementById('days');
        const hours = document.getElementById('hours');
        const minutes = document.getElementById('minutes');
        const seconds = document.getElementById('seconds');

        // var endTime = "2022-08-17 12:00";
        var endTime = document.querySelector('.endTime').value;
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






  </script>
  



</html>
