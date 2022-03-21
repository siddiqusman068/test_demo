<%--
  Created by IntelliJ IDEA.
  User: Haider Iqbal
  Date: 12/29/2020
  Time: 3:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="date" class="java.util.Date" />
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/resourcesdarktheme/plugins/images/favicon.png"/>"/>
    <title>RMS (Risk Management Services)</title>
    <!-- Bootstrap Core CSS -->
    <link  rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/bootstrap/dist/css/bootstrap.min.css"/>"/>
    <!-- animation CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/css/animate.css"/>"/>
    <!-- Menu CSS -->
    <link  rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"/>"/>
    <!-- animation CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/css/animate.css"/>"/>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/css/style.css"/>"/>
    <!-- color CSS -->
    <link id="theme" rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/css/colors/blue-dark.css"/>"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="fix-header">
<!-- ============================================================== -->
<!-- Preloader -->
<!-- ============================================================== -->
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
    </svg>
</div>
<!-- ============================================================== -->
<!-- Wrapper -->
<!-- ============================================================== -->
<div id="wrapper">

    <%-- Navigation and Top Header --%>
    <%@ include file="/WEB-INF/views/template/navigation.jsp" %>

    <!-- ============================================================== -->
    <!-- Page Content -->
    <!-- ============================================================== -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Surveyors Edit Form</h4> </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="#">RMS Team</a></li>
                        <li><a href="#">Surveyors</a></li>
                        <li class="active">Edit Surveyor</li>
                    </ol>
                </div>
            </div>

            <!-- .row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title m-b-0">Surveyors</h3>
                        <p class="text-muted m-b-30">Edit Form</p>
                        <form:form action="${pageContext.request.contextPath}/rcsTeam/surveyors/edit" method="post" commandName="surveyors" data-toggle="validator">
                            <form:hidden path="surveyorId" value="${surveyors.surveyorId}" />
                            <form:hidden path="created" value="${surveyors.created}" />
                            <form:hidden path="password" value="${surveyors.password}" />
                            <form:hidden path="restPassword" value="${surveyors.restPassword}" />
                            <form:hidden path="authority" value="${surveyors.authority}" />
                            <form:hidden path="status" value="${surveyors.status}" />
                            <div class="form-group">
                                <label for="inputUserName" class="control-label">Surveyor name</label>
                                <form:input type="text" class="form-control" path="surveyorName" name="userName" id="inputUserName" placeholder="User Name" data-error="Enter user name" required="required"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputUserId" class="control-label">Surveyor Id</label>
                                <%--<c:url value="/rcsTeam/getSurveyorName" var="getSurveyorName"/>--%>
                                <form:input type="text" class="form-control" path="userName" name="name" id="inputUserId" onfocusout="doAjaxName('${getSurveyorName}',$(this).val())" placeholder="User Id" data-error="Enter user Id" required="required"/>
                                <div id="reason" style="color: red"></div>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">Email</label>
                                <%--<c:url value="/rcsTeam/getSurveyorEmail" var="getSurveyorEmail"/>--%>
                                <form:input type="email" class="form-control" path="email" name="email" id="inputEmail" onfocusout="doAjaxEmail('${getSurveyorEmail}',$(this).val())" placeholder="Email" data-error="Bruh, that email address is invalid" required="required"/>
                                <div class="help-block with-errors"></div>
                                <div id="reasonc" style="color: red"></div>
                            </div>
                            <div class="form-group">
                                <label for="mobileContact" class="control-label">Cellular No#</label>
                                <form:input type="text" class="form-control" path="mobileContact" name="mobileContact" id="mobileContact" placeholder="Email" data-error="Enter mobile no." required="required"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label for="surveyorCode" class="control-label">Surveyor Code</label>
                                <form:input type="text" class="form-control" path="surveyorCode" name="surveyorCode" id="surveyorCode" placeholder="Email" data-error="Enter surveyor code." required="required"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <!-- .row -->
        </div>
        <!-- /.container-fluid -->
        <footer class="footer text-center"> <fmt:formatDate value="${date}" pattern="yyyy" /> &copy; UBLI RCS brought to you by UBL Insureres IT Dept. </footer>
    </div>
    <!-- /#page-wrapper -->
</div>

<!-- /#wrapper -->
<!-- jQuery -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/jquery/dist/jquery.min.js"/>"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/resources/resourcesdarktheme/bootstrap/dist/js/bootstrap.min.js"/>"></script>
<!-- Menu Plugin JavaScript -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"/>"></script>
<!--slimscroll JavaScript -->
<script src="<c:url value="/resources/resourcesdarktheme/js/jquery.slimscroll.js"/>"></script>
<!--Wave Effects -->
<script src="<c:url value="/resources/resourcesdarktheme/js/waves.js"/>"></script>
<!-- Custom Theme JavaScript -->
<script src="<c:url value="/resources/resourcesdarktheme/js/custom.min.js"/>"></script>
<script src="<c:url value="/resources/resourcesdarktheme/js/validator.js"/>"></script>
<!--Style Switcher -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"/>"></script>
</body>
