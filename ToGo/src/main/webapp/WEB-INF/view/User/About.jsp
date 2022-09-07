<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/fontawesome/css/all.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/fontawesome/css/font-awesome.min.css">

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/bootstrap.min.css">

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/AboutStyle.css">
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/background-gradient.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TOGO</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/Image/Togo.png">

</head>

<body style="overflow: hidden; background-color: #1f1c3b;">
<%@ include file='HeaderHome.jsp' %>
<div id="up-navbar" style="margin-bottom: 60.5px"></div>
<!--layer1 start-->
<div align="center" id="gradient" style="height:100vh; width: 100%; /* background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
      backdrop-filter:blur(10px);
      -webkit-backdrop-filter: blur(10px);
      padding-top: 10px ; margin-top: -10px; */">

    <div class="design">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
<div style="width: 100%; height: 100%; overflow: scroll">
    <br>

    <h3>What is <span style="color: #10898c">ToGo?</span></h3>
    <hr class="new" style="width: 85%">

    <table style="width: 60%; background-color: transparent;">
        <tr>
            <td>
                <div style="background: rgba(255, 255, 255, 0.2);
border-radius: 16px;
box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
backdrop-filter: blur(5px);
-webkit-backdrop-filter: blur(5px);
border: 1px solid rgba(255, 255, 255, 0.3);
">

                    <p style="color: #b7b7b7; text-align: justify; padding-left: 30px; padding-right: 30px; padding-top: 20px;">
                        <span style="color: #66dad9; font-size: 20px"><b>TOGO</b></span> is a platform for the
                        students and faculty to maintain a mutual communications between them.
                        ToGo helps to make the task submission very easy for both faculty and student. Student needs to
                        be signed up in the system to get the system features.
                        For the faculty registration, admin will handle the registration and will give an individual id
                        to every faculty.
                    </p>

                    <br>
                    <h4 align="center"><span style="color: #ec8ecf;"><b>Admin</b></span></h4>
                    <hr align="center" class="new2" width="20%">
                    <p style="padding-left: 30px; padding-right: 30px; padding-bottom: 20px;">
                    <ul style="color: #b7b7b7; font-size: 16px">
                        <li>Admin needs the administrator id and password to login.</li>
                        <li>Admin can add faculty in the system.</li>
                        <li>Available faculty's profile can be viewed by the admin.</li>
                        <li>If the faculty designation is changed, admin can change the profile of the faculty from edit option.</li>
                        <li>Moreover, admin has the power to remove any faculty from the system. In that case, every data associated with that faculty id will be automatically deleted.</li>
                    </ul>
                    </p>



                    <br>



                    <h4 align="center"><span style="color: #ec8ecf;"><b>Faculty</b></span></h4>
                    <hr align="center" class="new2" width="20%">
                    <p style="padding-left: 30px; padding-right: 30px; padding-bottom: 20px;">
                    <ul style="color: #b7b7b7; font-size: 16px">
                        <li>Faculty can create a classroom, modify it and also can delete the classroom.</li>
                        <li>Assign task for that classroom. Task can be re-assigned with some changes as well.</li>
                        <li>He/she can accept the join request came from the students.</li>
                        <li>Faculty can see the link of the task or the text submission of a student.</li>
                    </ul>
                    </p>

                    <br>

                    <h4 align="center"><span style="color: #ec8ecf;"><b>Student</b></span></h4>
                    <hr align="center" class="new2" width="20%">
                    <p style="padding-left: 30px; padding-right: 30px; padding-bottom: 20px;">
                    <ul style="color: #b7b7b7; font-size: 16px">
                        <li>After registration, student can view the classrooms and He/she can apply to join a classroom.</li>
                        <li>A student can search a classroom by the name of the classroom.</li>
                        <li>If the join request is accepted by the faculty, he/she can see the task assigned with the classroom.</li>
                        <li>He/she can submit the task link or text of a running task.</li>
                        <li>If any student wants to make a re-submission of any task, the task status needs to be in Running stat.</li>
                    </ul>
                    </p>

                </div>
            </td>


            <td>

            </td>
        </tr>
    </table>

    <br>
    <br>
    <br>


    <h3>Meet the Team <span style="color: #2d9d9c;"><b>TORTOISE</b></span></h3>
    <hr class="new" style="width: 85%">

    <br>
    <div class="container" align="center">

        <div class="serv-content">
            <div class="card">
                <div class="our-team">
                    <div class="pic">
                        <img
                                src="${pageContext.request.contextPath}/Image/niloy.png"
                                style="max-height: 130px;max-width: 130px;"
                        />
                    </div>
                    <div class="team-content">
                        <h4>Niloy Kanti Paul</h4>
                        <span class="post"> Student </span>
                        <span class="post"> niloykantipaul@gmail.com </span>
                        <span class="post"> American International University-Bangladesh </span>
                    </div>
                    <ul class="social">
                        <li><a href="https://www.facebook.com/niloypaul.nkp/" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="https://www.linkedin.com/in/niloy-kanti-paul-5543181ab/" target="_blank"><i class="fab fa-linkedin"></i></a></li>
                        <li><a href="https://discord.gg/hbVGqaKv6F" target="_blank"><i class="fab fa-discord"></i></a></li>
                        <li><a href="https://github.com/DEV-NKP" target="_blank"><i class="fab fa-github"></i></a></li>
                    </ul>
                </div>
            </div>

            <div class="card">
                <div class="our-team">
                    <div class="pic">
                        <img
                                src="${pageContext.request.contextPath}/Image/dipa.png"
                                style="max-height: 130px;max-width: 130px;"
                        />
                    </div>
                    <div class="team-content">
                        <h4>Dipanwita Saha</h4>
                        <span class="post"> Student </span>
                        <span class="post"> dipanwitasaha7009@gmail.com </span>
                        <span class="post"> American International University-Bangladesh </span>
                    </div>
                    <ul class="social">
                        <li><a href="https://www.facebook.com/Ankita.Ahona" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="https://www.linkedin.com/in/dipanwita-saha-a772aa215/" target="_blank"><i class="fab fa-linkedin"></i></a></li>
                        <li><a href="https://discord.gg/hbVGqaKv6F" target="_blank"><i class="fab fa-discord"></i></a></li>
                        <li><a href="https://github.com/Dipanwita-Saha" target="_blank"><i class="fab fa-github"></i></a></li>
                    </ul>
                </div>
            </div>

            <div class="card">
                <div class="our-team">
                    <div class="pic">
                        <img
                                src="${pageContext.request.contextPath}/Image/kaushik.png"
                                style="max-height: 130px;max-width: 130px;"
                        />
                    </div>
                    <div class="team-content">
                        <h4>Kaushik Biswas</h4>
                        <span class="post"> Student </span>
                        <span class="post"> biswaskaushik.2020@gmail.com </span>
                        <span class="post"> American International University-Bangladesh </span>
                    </div>
                    <ul class="social">
                        <li><a href="https://www.facebook.com/profile.php?id=100076509485838" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="https://www.linkedin.com/in/kaushik-biswas-2b6554243/" target="_blank"><i class="fab fa-linkedin"></i></a></li>
                        <li><a href="https://discord.gg/hbVGqaKv6F" target="_blank"><i class="fab fa-discord"></i></a></li>
                        <li><a href="https://github.com/Kaushik-Biswas" target="_blank"><i class="fab fa-github"></i></a></li>
                    </ul>
                </div>
            </div>

        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
    </div>
</div>
</body>
</html>