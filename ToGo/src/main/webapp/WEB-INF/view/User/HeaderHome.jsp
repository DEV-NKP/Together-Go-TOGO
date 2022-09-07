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
      <div class="container-fluid" style="background-color: #1f1c3b; ">
        <div class="navbar-header" style="padding-left: 20%; padding-top: 5px">
          <a href="${pageContext.request.contextPath}/home/togo" class="navbar-left" style="text-decoration: none">
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
        <div style="padding-right: 15%; ">
        <ul class="nav navbar-nav navbar-right">

                  
            <li><a href="${pageContext.request.contextPath}/home/login"
                   onMouseOver="this.style.color='#e88773';"
                   onMouseOut="this.style.color='#ffa089'"
                   style="color:#ffa089; margin-top: 5px;margin-left: 10px;margin-right: 20px; ">LOG IN</a>
            </li>

            <li><a href="${pageContext.request.contextPath}/home/signup"

                   onMouseOver="this.style.color='#e88773';"
                   onMouseOut="this.style.color='#ffa089'"
              style="color:#ffa089; font-size: 14px; margin-top: 8px;margin-left: 10px;margin-right: 20px; padding-top:10px; padding-bottom: 10px; padding-left: 15px; padding-right: 15px; background-color:#3c3c3c; border-radius: 10px;">SIGN UP</a>
            </li>
        </ul>
      </div>
      </div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

