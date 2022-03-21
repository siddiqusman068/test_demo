<%--
  Created by IntelliJ IDEA.
  User: Haider Iqbal
  Date: 1/2/2021
  Time: 11:47 AM
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
<section id="wrapper" class="login-register" style="background: url('http://localhost:8080/ublircs/resources/resourcesdarktheme/plugins/images/greydark.jpg') center center/cover no-repeat!important;height: 100%;position: fixed;}">
    <div class="login-box">
        <div class="white-box">
            <form class="form-horizontal form-material" method="get" id="loginform" action="<c:url value="/login/restPasswordChange"/>">

                <div class="form-group">
                    <div class="col-xs-12 text-center">
                        <div class="user-thumb text-center"> <img alt="thumbnail" class="img-circle" width="100" src="/ublircs/resources/resourceslighttheme/plugins/images/admin-logo-dark.png" alt="Home">
                            <h3>Reset Password</h3>
                        </div>
                    </div>
                </div>
                <div class="form-group ">
                    <div class="col-xs-12">
                        <input class="form-control" type="password" name="password" required="" placeholder="password">
                    </div>
                </div>
                <div class="form-group text-center">
                    <div class="col-xs-12">
                        <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Reset Password</button>
                    </div>
                </div>
            </form>
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
