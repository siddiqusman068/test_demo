<%--
  Created by IntelliJ IDEA.
  User: Haider Iqbal
  Date: 11/5/2020
  Time: 10:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/resourceslighttheme/plugins/images/favicon.png"/>"/>
    <title>Ample Admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/resourceslighttheme/bootstrap/dist/css/bootstrap.min.css"/>"/>
    <!-- animation CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/resourceslighttheme/css/animate.css"/>"/>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/resourceslighttheme/css/customcoretheme.css"/>"/>
    <!-- color CSS -->
    <link id="theme"  rel="stylesheet" href="<c:url value="/resources/resourceslighttheme/css/colors/blue.css"/>"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <!--<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>-->
    <![endif]-->
</head>
<style type="text/css">
    /* do not group these rules */
    *::-webkit-input-placeholder {
        color: white;
    }
    *:-moz-placeholder {
        /* FF 4-18 */
        color: white;
        opacity: 1;
    }
    *::-moz-placeholder {
        /* FF 19+ */
        color: white;
        opacity: 1;
    }
    *:-ms-input-placeholder {
        /* IE 10+ */
        color: white;
    }
    *::-ms-input-placeholder {
        /* Microsoft Edge */
        color: white;
    }
    *::placeholder {
        /* modern browser */
        color: white;
    }

    /*html{
        overflow-x: hidden;
        overflow-y: hidden;
    }*/

    @media screen and (max-width: 1920px) {
        .white-box{
            transform: translate(0px, 140px);
        }
    }

    @media screen and (max-width: 1024px) {
        html{
            background-color: #0c0c0c;opacity: 0.78;
        }

        .white-box{
            transform: translate(0px, 40px);
        }
    }

    @media screen and (max-width: 768px) {
        html{
            background-color: #0c0c0c;opacity: 0.78;
        }

        .white-box{
            transform: translate(0px, 40px);
        }
    }

    @media screen and (max-width: 540px) {
        html{
            background-color: #0c0c0c;opacity: 0.78;
        }

        .white-box{
            transform: translate(0px, 40px);
            position: fixed;
            margin: auto;
            right: 0;
            left: 0;
        }
    }

    @media screen and (max-width: 480px) {
        html{
            background-color: #0c0c0c;opacity: 0.78;
        }

        .white-box{
            transform: translate(0px, 40px);
            position: fixed;
            margin: auto;
            right: 0;
            left: 0;
        }
    }

    @media screen and (max-width: 375px) {
        html{
            background-color: #0c0c0c;opacity: 0.78;
        }

        .white-box{
            transform: translate(0px, 40px);
            position: fixed;
            margin: auto;
            right: 0;
            left: 0;
        }
    }

    @media screen and (max-width: 360px) {
        html{
            background-color: #0c0c0c;opacity: 0.78;
        }

        .white-box{
            transform: translate(0px, 40px);
            position: fixed;
            margin: auto;
            right: 0;
            left: 0;
        }
    }


    @media screen and (max-width: 320px) {
        html{
            background-color: #0c0c0c;opacity: 0.78;
        }

        .white-box{
            transform: translate(0px, 40px);
            position: fixed;
            margin: auto;
            right: 0;
            left: 0;
        }
    }

</style>
<body>
<!-- Preloader -->
<div class="preloader">
    <div class="cssload-speeding-wheel"></div>
</div>
<section id="wrapper" class="login-register">
    <div class="login-box login-sidebar" style="background-color: #0c0c0c;opacity: 0.78;">
        <div class="white-box" style="background-color: #0c0c0c;opacity: 0.78;/*transform: translate(0px, 120px);*/">
            <form class="form-horizontal form-material" id="loginform" method="post" action="<c:url value="/j_spring_security_check" />">
                <a href="javascript:void(0)" class="text-center db"><img style="width: 188px;height: 94px;" class="mainlogo" src="<c:url value="/resources/resourceslighttheme/plugins/images/admin-logo-dark.png"/>" alt="Home" /><br/><img class="logotext" style="width: 250px;height: 120px" src="<c:url value="/resources/resourceslighttheme/plugins/images/admin-text-dark-01.png"/>" alt="Home" /></a>
                <c:if test="${not empty msg}">
                    <div class="msg"style="color: rgba(43, 134, 34, 0.87);">${msg}</div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="error" style="color: #ff0000;">${error}</div>
                </c:if>
                <div class="form-group m-t-40">
                    <div class="col-xs-12">
                        <input class="form-control" type="text" name="username" style="color: white" required="required" placeholder="Username">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-12">
                        <input class="form-control" type="password" name="password" style="color: white" required="required" placeholder="Password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <div class="checkbox checkbox-primary pull-left p-t-0">
                            <%--<input id="checkbox-signup" type="checkbox">
                            <label for="checkbox-signup"> Remember me </label>--%>
                        </div>
                        <%--<a href="javascript:void(0)" style="color: white" id="to-recover" class="pull-right"><i style="color: white" class="fa fa-lock m-r-5"></i> Forgot pwd?</a>--%>
                    </div>
                </div>
                <div class="form-group text-center m-t-20">
                    <div class="col-xs-12">
                        <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" style="background-color: #2c6fe3;" type="submit">Log In</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 m-t-10 text-center">
                        <div class="social"><%--<a href="javascript:void(0)" class="btn  btn-facebook" data-toggle="tooltip"  title="Login with Facebook"> <i aria-hidden="true" class="fa fa-facebook"></i> </a> <a href="javascript:void(0)" class="btn btn-googleplus" data-toggle="tooltip"  title="Login with Google"> <i aria-hidden="true" class="fa fa-google-plus"></i></a>--%></div>
                    </div>
                </div>
                <div class="form-group m-b-0">
                    <div class="col-sm-12 text-center">
                        <%--<p>Don't have an account? <a href="register2.html" class="text-primary m-l-5"><b>Sign Up</b></a></p>--%>
                    </div>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
            <%--<form class="form-horizontal" id="recoverform" action="index.html">
                <div class="form-group ">
                    <div class="col-xs-12">
                        <h3>Recover Password</h3>
                        <p class="text-muted">Enter your Email and instructions will be sent to you! </p>
                    </div>
                </div>
                <div class="form-group ">
                    <div class="col-xs-12">
                        <input class="form-control" type="text" required="" placeholder="Email">
                    </div>
                </div>
                <div class="form-group text-center m-t-20">
                    <div class="col-xs-12">
                        <button class="btn btn-primary btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Reset</button>
                    </div>
                </div>
            </form>--%>
        </div>
    </div>
</section>

<!-- jQuery -->
<script src="<c:url value="/resources/resourceslighttheme/plugins/bower_components/jquery/dist/jquery.min.js"/>"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/resources/resourceslighttheme/bootstrap/dist/js/bootstrap.min.js"/>"></script>
<!-- Menu Plugin JavaScript -->
<script src="<c:url value="/resources/resourceslighttheme/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"/>"></script>

<!--slimscroll JavaScript -->
<script src="<c:url value="/resources/resourceslighttheme/js/jquery.slimscroll.js"/>"></script>
<!--Wave Effects -->
<script src="<c:url value="/resources/resourceslighttheme/js/waves.js"/>"></script>
<!-- Custom Theme JavaScript -->
<script src="<c:url value="/resources/resourceslighttheme/js/custom.min.js"/>"></script>
<!--Style Switcher -->
<script src="<c:url value="/resources/resourceslighttheme/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"/>"></script>
</body>
</html>