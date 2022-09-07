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

      <%@ include file='HeaderAdmin.jsp' %>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TOGO</title>
      <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/Image/Togo.png">

  </head>
  
  <body style="overflow: hidden; background-color:#1f1c3b ;">
    <div id="up-navbar" style="margin-bottom: 60.5px"></div>

    <div class="container-fluid body-content" style="height: 100%;">
      <div class="row">
       
          <div
            class="col-sm-2 side-nav-content side-nav-layout"
            id="sideNavbar"
            style="overflow-y: hidden; position:inherit"
          >      <%@ include file='NavMenuAdmin.jsp' %>

          </div>
      
        <div
          class="col-sm-8"
          style="background: linear-gradient(135deg,  rgba(66, 44, 111, 0.7),rgba(48, 29, 70, 0.479));
          backdrop-filter:blur(10px);
          -webkit-backdrop-filter: blur(10px); height: 92vh;  overflow-y:auto; "
          align="center"

        >
        
        <br />
        <h4>Faculty Details</h4>
            <h6 style="color:#888888; padding-top: 20px">Total: ${msg} Faculties</h6>
        <hr style="height: 2px; background-color: #fa6e6d; border: none;" />
         <br>
        <table class="user_table" width="95%">
          <thead>
              <tr>
                  <th>Name</th>
                  <th>ID</th>
                  <th>Email</th>
                  <th>Designation</th>
                  <th>Action</th>
              </tr>
          </thead>
          <tbody class="table-body">

<c:forEach var="faculty" items="${facultys}">

    <c:url var="viewlink" value="facultyprofile">
        <c:param name="facultyId" value="${faculty.facultyId}"/>
    </c:url>


              <tr>
    <td style="word-break:break-all;"> ${faculty.firstName}  ${faculty.lastName}</td>
    <td style="word-break:break-all;"> ${faculty.facultyId}</td>
    <td style="word-break:break-all;"> ${faculty.email}</td>
    <td style="word-break:break-all;"> ${faculty.designation}</td>
                  <td >
                  <a href="${viewlink}" style="white-space: nowrap;
text-decoration: none; width:150px;  cursor: pointer;"class="button" >View Faculty</a></td>
              </tr>
</c:forEach>
          </tbody>
      </table>

        </div>


        <div class="col-sm-2 side-nav-content side-nav-layout"
            id="side-navbar"
            style="overflow-y: hidden; background-color: #1f1c3b;">
        <div class="row>">
          

          <a href="${pageContext.request.contextPath}/admin/showfaculty" class="list-group-item" id="right-layout-default">
            <span class="row-no-gutters">
              <span class="col-sm-offset-1"> Show Faculty </span>
            </span>
          </a>
          <a href="${pageContext.request.contextPath}/admin/addfaculty" class="list-group-item" id="right-layout">
            <span class="row-no-gutters">
              
              <span class="col-sm-offset-1"> Add Faculty </span>
            </span>
          </a>
         
        </div>
        </div>

      </div>
    </div>

    
  </body>
</html>
