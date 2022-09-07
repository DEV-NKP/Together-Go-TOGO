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

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
              id="side-navbar"
              style="overflow-y: hidden; position:inherit"
            >
                <%@ include file='NavMenuAdmin.jsp' %>

            </div>
        
          <div
            class="col-sm-8"
            style="background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
            backdrop-filter:blur(10px);
            -webkit-backdrop-filter: blur(10px);  height: 92vh;  overflow-y:auto; "
            align="center"
          >
          <div align="left" style="margin-top:20px; padding-left: 40px; ">
            <a href="${pageContext.request.contextPath}/admin/showfaculty"
        onMouseOver="this.style.color='#fe9783';"
        onMouseOut="this.style.color='#6495ed'">
            <i class="fa fa-angle-double-left fa-2x"></i>
        </a>
        </div>
    
            <div width="100%" align="center" style="font-family: 'Times New Roman'; font-size: 20px; color: #e2344d ">
    
                <img src="../Image/Togo.png" title="Profile" class="img-circle hover-profile" width="15%" height="15%" />
                <br /><br />

                <label style="color: #d29e8e">${user.lastName}, ${user.firstName}</label>
                
                <br />
    
                <hr style="width:50%" />
    
                <br />
                <div style="text-align: left; padding-left: 10%; font-family: 'Times New Roman'; font-size: 20px; color: #d29e8e">
    
                    <span style="border-image: linear-gradient(135deg, #d3836b, #7e8383); border-image-slice: 1; border-bottom: solid; padding-left: 0px; padding-right: 20px; padding-bottom:5px;">
                        User Details
                    </span>
                    <br />
    
                    <br />
    
    
    
                <div style="text-align: left; padding-left: 10%; font-family: 'Times New Roman'; font-size: 20px; color: #25aa98">
    
                    <strong>First Name : </strong><span style="color:#bedafb; font-size: 18px;"> ${user.firstName}</span>
                    <br />
                    <strong>Last Name &nbsp;&nbsp;: </strong><span style="color:#bedafb; font-size: 18px;"> ${user.lastName}</span>
                    <br />
                    <strong>Faculty ID &nbsp; : </strong><span style="color:#bedafb; font-size: 18px;"> ${user.facultyId}</span>
                    <br />
                    <strong>Designation :</strong> <span style="color: #bedafb;font-size: 18px; "> ${user.designation}</span>
                    <br />
                    <strong>Email &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong> <span style="color: #bedafb;font-size: 18px; "> ${user.email}</span>
                    <br />
                    
                </div>
                </div>

                <br />
    
                <br />
                <br />
                <span>
                        <c:url var="editLink" value="editprofilefaculty">
                            <c:param name="facultyId" value="${user.facultyId}"/>
                        </c:url>
                      <c:url var="deleteLink" value="deleteprofilefaculty">
                          <c:param name="facultyId" value="${user.facultyId}"/>
                      </c:url>
                  <a href="${editLink}" class="button" >Edit Profile</a>
                  &nbsp;&nbsp;
                  <a href="${deleteLink}"  class="button">Remove Faculty</a>
                   
                  

                </span>
               
                <br />
                <br />
    
            </div>
    
    
    
    
        </div>
    
    
       
    
    
        </div>  
        </div>
</body>
</html>