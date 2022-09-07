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
<div
  class="container-fluid body-content"
  style="background-color: #1f1c3b; min-height: 100vh; overflow: hidden"
>
  <div class="row">
    <div class="side-nav-content side-nav-layout" style="overflow: hidden">
      <br /><br />
      <a
        href="${pageContext.request.contextPath}/faculty/profile"
        class="list-group-item"
        id="down-layout"
      >
        <span class="row-no-gutters">
          <span class="col-sm-1">
            <i class="fa fa-user fa-lg"></i>
          </span>
          <span class="col-sm-offset-1"> Profile </span>
        </span>
      </a>
      <br />

      <a
        href="${pageContext.request.contextPath}/faculty/viewclassroomtable"
        class="list-group-item"
        id="down-layout"
      >
        <span class="row-no-gutters">
          <span class="col-sm-1">
            <i class="fa fa-chalkboard-user fa-lg"></i>
          </span>
          <span class="col-sm-offset-1"> Classroom </span>
        </span>
      </a>
      <br />

      <div style="position: fixed; bottom: 0px">
        <div class="footer" style="padding: 10px">
          <div style="display: flex; align-items: center">
            <span>
              <img
                src="${pageContext.request.contextPath}/Image/Togo.png"
                alt="idea x logo"
                class="img-rounded"
                width="35px"
                height="35px"
              />
            </span>

            <b>ToGo</b>
          </div>
          <div>
            <span class="text-center" style="font-size: 15px">
              &copy; Copyright @2022
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
