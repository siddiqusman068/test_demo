<%--
  Created by IntelliJ IDEA.
  User: Haider Iqbal
  Date: 11/6/2020
  Time: 12:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- ============================================================== -->
<!-- Topbar header - style you can find in pages.scss -->
<!-- ============================================================== -->
<nav class="navbar navbar-default navbar-static-top m-b-0">
    <div class="navbar-header">
        <div class="top-left-part">
            <!-- Logo -->
            <a class="logo" href="#">
                <!-- Logo icon image, you can use font-icon also --><b>
                <!--This is dark logo icon--><img style="width:40px;height:25px;" src="<c:url value="/resources/resourcesdarktheme/plugins/images/admin-logo-dark.png"/>" alt="home" class="dark-logo" /><!--This is light logo icon--><img src="../plugins/images/admin-logo-dark.png" alt="home" class="light-logo" />
            </b>
                <!-- Logo text image you can use text also --><span class="hidden-xs">
                        <!--This is dark logo text--><img style="width:80px;height:30px;" src="<c:url value="/resources/resourcesdarktheme/plugins/images/admin-text-dark.png"/>" alt="home" class="dark-logo" /><!--This is light logo text--><img src="<c:url value="/resources/plugins/images/admin-text-dark.png"/>" alt="home" class="light-logo" />
                     </span>
            </a>
        </div>
        <!-- /Logo -->
        <!-- Search input and Toggle icon -->
        <ul class="nav navbar-top-links navbar-left">
            <li><a href="javascript:void(0)" class="open-close waves-effect waves-light visible-xs"><i class="ti-close ti-menu"></i></a></li>
        </ul>
        <ul class="nav navbar-top-links navbar-right pull-right">
            <li class="dropdown">
                <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#"> <img src="<c:url value="/resources/resourcesdarktheme/plugins/images/users/varun.png"/>" alt="user-img" width="36" class="img-circle"><b class="hidden-xs">${pageContext.request.userPrincipal.name}</b><span class="caret"></span> </a>
                <ul class="dropdown-menu dropdown-user animated flipInY">
                    <li>
                        <div class="dw-user-box">
                            <div class="u-img"><%--<img src="<c:url value="/resources/resourcesdarktheme/plugins/images/users/varun.png"/>" alt="user" />--%></div>
                            <div class="u-text">
                                <a href="<c:url value="/j_spring_security_logout" />">
                                    <i class="fa fa-power-off"></i> Logout
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
    </div>
    <!-- /.navbar-header -->
    <!-- /.navbar-top-links -->
    <!-- /.navbar-static-side -->
</nav>
<!-- End Top Navigation -->
<!-- ============================================================== -->
<!-- Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav slimscrollsidebar">
        <div class="sidebar-head">
            <h3><span class="fa-fw open-close"><i class="ti-menu hidden-xs"></i><i class="ti-close visible-xs"></i></span> <span class="hide-menu">Navigation</span></h3> </div>
        <ul class="nav" id="side-menu">
        <%--    <li class="user-pro">
                <a href="#" class="waves-effect"><img src="<c:url value="/resources/resourcesdarktheme/plugins/images/users/varun.png"/>" alt="user-img" class="img-circle"> <span class="hide-menu"> Steve Gection<span class="fa arrow"></span></span>
                </a>
                <ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                    <a style="text-align: center" href="<c:url value="/j_spring_security_logout" />">
                        <i class="fa fa-power-off"></i> Logout
                    </a>
                </ul>
            </li>--%>
<c:choose>
    <c:when test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">

       <%-- <li> <a href="forms.html" class="waves-effect active"><i class="mdi mdi-clipboard-text fa-fw"></i> <span class="hide-menu">Forms<span class="fa arrow"></span></span></a>
            <ul class="nav nav-second-level">
                    &lt;%&ndash;<li> <a href="#" class="waves-effect"><i class="mdi mdi-content-copy fa-fw"></i> <span class="hide-menu">RAF Froms List<span class="fa arrow"></span><span class="label label-rouded label-warning pull-right">30</span></span></a> </li>&ndash;%&gt;

                <li><a href="<spring:url value="/branchUser/riskLocationGrid"/>" class="waves-effect"><i data-icon="&#xe026;" class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">RAF Froms List<span class="fa arrow"></span></span></a></li>
                <li> <a href="#" class="waves-effect"><i class="mdi mdi-content-copy fa-fw"></i> <span class="hide-menu">Add RAF Froms<span class="fa arrow"></span></span></a> </li>
                &lt;%&ndash;<li> <a href="index3.html"><i class=" fa-fw">3</i><span class="hide-menu">Grid 3</span></a> </li>&ndash;%&gt;
            </ul>
        </li>--%>
    </c:when>
<c:when test="${pageContext.request.isUserInRole('ROLE_BRANCH_USER')}">

            <li> <a href="#" class="waves-effect active"><i class="mdi mdi-clipboard-text fa-fw"></i> <span class="hide-menu">Forms<span class="fa arrow"></span></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="<spring:url value="/branchUser/riskLocations"/>" class="waves-effect"><i data-icon="&#xe026;" class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">RAF Forms List<span class="fa arrow"></span></span></a></li>
                    <li><a href="<spring:url value="/branchUser/addForm"/>" class="waves-effect"><i class="mdi mdi-content-copy fa-fw"></i> <span class="hide-menu">Add RAF Forms</span></a> </li>
                </ul>
            </li>
</c:when>
    <c:when test="${pageContext.request.isUserInRole('ROLE_RMS_TEAM')}">

        <li> <a href="#" class="waves-effect"><i class="mdi mdi-clipboard-text fa-fw"></i> <span class="hide-menu">Forms<span class="fa arrow"></span></span></a>
            <ul class="nav nav-second-level">
                <li><a href="<spring:url value="/rcsTeam/riskLocations"/>" class="waves-effect"><i data-icon="&#xe026;" class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">RAF Forms List</span></a></li>
                <li><a href="<spring:url value="/rcsTeam/addTeamForm"/>" class="waves-effect"><i class="mdi mdi-content-copy fa-fw"></i> <span class="hide-menu">Add RAF Forms</span></a> </li>
                <li><a href="<spring:url value="/rcsTeam/AssignedRisk"/>" class="waves-effect"><i data-icon="&#xe026;" class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">Assigned RAF Forms</span></a></li>
            </ul>
        </li>

        <li> <a href="#" class="waves-effect"><i class="fa  fa-users fa-fw"></i> <span class="hide-menu">Users<span class="fa arrow"></span></span></a>
            <ul class="nav nav-second-level">
                <li><a href="<spring:url value="/rcsTeam/users/add"/>" class="waves-effect"><i data-icon="&#xe026;" class="fa  fa-user fa-fw"></i> <span class="hide-menu">Add User</span></a></li>
                <li><a href="<spring:url value="/rcsTeam/users"/>" class="waves-effect"><i class="fa fa-list-alt fa-fw"></i> <span class="hide-menu">Users Grid</span></a> </li>
            </ul>
        </li>

        <li> <a href="#" class="waves-effect"><i class="fa  fa-building fa-fw"></i> <span class="hide-menu">Branches<span class="fa arrow"></span></span></a>
            <ul class="nav nav-second-level">
                <li><a href="<spring:url value="/rcsTeam/branches/add"/>" class="waves-effect"><i data-icon="&#xe026;" class="fa  fa-building-o fa-fw"></i> <span class="hide-menu">Add Branch</span></a></li>
                <li><a href="<spring:url value="/rcsTeam/branches"/>" class="waves-effect"><i class="fa fa-list-alt fa-fw"></i> <span class="hide-menu">Branches Grid</span></a> </li>
            </ul>
        </li>

        <li> <a href="#" class="waves-effect"><i class="icon-people"></i> <span class="hide-menu">Surveyors<span class="fa arrow"></span></span></a>
            <ul class="nav nav-second-level">
                <li><a href="<spring:url value="/rcsTeam/surveyors/add"/>" class="waves-effect"><i data-icon="&#xe026;" class="fa  fa-user fa-fw"></i> <span class="hide-menu">Add Surveyor</span></a></li>
                <li><a href="<spring:url value="/rcsTeam/surveyors"/>" class="waves-effect"><i class="ti-view-list-alt"></i> <span class="hide-menu">Surveyor Grid</span></a> </li>
            </ul>
        </li>
    </c:when>
    <c:when test="${pageContext.request.isUserInRole('ROLE_RMS_HEAD')}">

        <li> <a href="#" class="waves-effect"><i class="mdi mdi-clipboard-text fa-fw"></i> <span class="hide-menu">Forms<span class="fa arrow"></span></span></a>
            <ul class="nav nav-second-level">
                <li><a href="<spring:url value="/rcsHead/riskLocations"/>" class="waves-effect"><i data-icon="&#xe026;" class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">RAF Froms List</span></a></li>
            </ul>
        </li>

        <%--<li> <a href="#" class="waves-effect active"><i class="mdi mdi-clipboard-text fa-fw"></i> <span class="hide-menu">Forms<span class="fa arrow"></span></span></a>
            <ul class="nav nav-second-level">
                <li><a href="<spring:url value="/rcsHead/riskLocations"/>" class="waves-effect"><i data-icon="&#xe026;" class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">RAF Froms List<span class="fa arrow"></span></span></a></li>
            </ul>
        </li>
        <li> <a href="#" class="waves-effect"><i class="fa  fa-users"></i> <span class="hide-menu">Users<span class="fa arrow"></span></span></a>
            <ul class="nav nav-second-level">
                <li><a href="<spring:url value="/rcsHead/users/add"/>" class="waves-effect"><i data-icon="&#xe026;" class="fa  fa-user"></i> <span class="hide-menu">Add User<span class="fa arrow"></span></span></a></li>
                <li><a href="<spring:url value="/rcsHead/users"/>" class="waves-effect"><i class="fa fa-list-alt"></i> <span class="hide-menu">Users Grid<span class="fa arrow"></span></span></a> </li>
            </ul>
        </li>--%>
    </c:when>
    <c:otherwise>
        <li> <a href="#" class="waves-effect active"><i class="mdi mdi-clipboard-text fa-fw"></i> <span class="hide-menu">Forms<span class="fa arrow"></span></span></a>
            <ul class="nav nav-second-level">
                <li><a href="<spring:url value="/surveyor/riskLocations"/>" class="waves-effect"><i data-icon="&#xe026;" class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">RAF Froms List</a></li>
            </ul>
        </li>

    </c:otherwise>

</c:choose>

            <li><a href="<c:url value="/j_spring_security_logout" />" class="waves-effect"><i class="mdi mdi-logout fa-fw"></i> <span class="hide-menu">Log out</span></a></li>

        </ul>
    </div>
</div>
<!-- ============================================================== -->
<!-- End Left Sidebar -->
<!-- ============================================================== -->

<script type="text/javascript">
    (function() {
        [].slice.call(document.querySelectorAll('.sttabs')).forEach(function(el) {
            new CBPFWTabs(el);
        });
    })();
</script>