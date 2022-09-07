<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>

<link type="text/css"
      rel="stylesheet"
      href="${pageContext.request.contextPath}/fontawesome/css/all.css">

<link type="text/css"
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/bootstrap_cyborg.css">
<link type="text/css"
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/dashboard_page.css">

    <div class="nav navbar-inverse navbar-fixed-top">
      <div class="container-fluid" style="background-color: #1f1c3b">
        <div class="navbar-header" style="padding-left: 5%; padding-top: 5px">
          <a href="#" class="navbar-left" style="text-decoration: none">
            <img
              src="${pageContext.request.contextPath}/Image/Togo.png"
              alt="Togo logo"
              class="img-rounded"
              width="50px"
              height="50px"
            />
            <b class="text-muted"
              ><strong
                style="
                  font-family: 'Helvetica';
                  font-size: 18px;
                  color: #f4c2c2;
                "
                >ToGo</strong
              ></b
            >
          </a>
        </div>

        <ul class="nav navbar-nav navbar-right">
          <li>
            <a href="${pageContext.request.contextPath}/faculty/profile" >
              Welcome&nbsp; <b style="padding-right: 20px">${sessionScope.uname}</b>

              <img
                src="${pageContext.request.contextPath}/Image/white.png"
                title="Profile"
                class="img-circle hover-profile"
                width="30px"
                height="30px"
              />
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/faculty/logout" style="margin-top: 5px; margin-right:15px;">
            
              <i class="fa fa-sign-out fa-lg"></i>
            
        </a>
          </li>
        </ul>
      </div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

