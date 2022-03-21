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
                    <h4 class="page-title">Branch Edition Form</h4> </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <button class="right-side-toggle waves-effect waves-light btn-info btn-circle pull-right m-l-20"><i class="ti-settings text-white"></i></button>
                    <ol class="breadcrumb">
                        <li><a href="#">Admin</a></li>
                        <li><a href="#">Users</a></li>
                        <li class="active">Edit Users</li>
                    </ol>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- .row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title m-b-0">Users</h3>
                        <p class="text-muted m-b-30"> Edition Form </p>
                        <form:form action="${pageContext.request.contextPath}/rcsTeam/users/edit" method="post" commandName="users" data-toggle="validator">
                            <form:hidden path="userId" value="${users.userId}" />
                            <form:hidden path="created" value="${users.created}" />
                            <form:hidden path="password" value="${users.password}" />
                            <form:hidden path="restPassword" value="${users.restPassword}" />
                            <form:hidden path="status" value="${users.status}" />
                            <input type="hidden" id="currentstatus" value="" name="currentstatus" style="color: #0b0b0b">
                            <input type="hidden" id="afterStatus" value="" name="afterStatus" style="color: #0b0b0b">
                            <input type="hidden" id="currentusertype" value="" name="currentusertype" style="color: #0b0b0b">
                            <input type="hidden" id="tusertype" value="" name="tusertype" style="color: #0b0b0b">
                            <input type="hidden" id="currentbranch" value="" name="currentbranch" style="color: #0b0b0b">
                            <input type="hidden" id="tbranch" value="" name="tbranch" style="color: #0b0b0b">

                            <div class="form-group">
                                <label for="inputUserName" class="control-label">Username</label>
                                <form:input type="text" class="form-control" path="name" name="userName" id="inputUserName" placeholder="User Name" data-error="Enter user name" required="required"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputUserId" class="control-label">UserId</label>
                                <%--<c:url value="/admin/getUserName" var="getUserName"/>--%>
                                <form:input type="text" class="form-control" path="userName" name="name" id="inputUserId" onfocusout="doAjaxName('${getUserName}',$(this).val())" placeholder="User Id" data-error="Enter user Id" required="required"/>
                                <div id="reason" style="color: red"></div>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">Email</label>
                                <%--<c:url value="/admin/getUserEmail" var="getUserEmail"/>--%>
                                <form:input type="email" class="form-control" path="email" name="email" id="inputEmail" onfocusout="doAjaxEmail('${getUserEmail}',$(this).val())" placeholder="Email" data-error="Bruh, that email address is invalid" required="required"/>
                                <div class="help-block with-errors"></div>
                                <div id="reasonc" style="color: red"></div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label for="crole">User Type *</label>
                                        <form:select path="userTypes.userTypeId" class="form-control" items="${AllUserTypes}" itemValue="userTypeId" itemLabel="usertype" id="crole" required="required" data-placeholder="Select usertype" name="crole" data-error="Select user type">
                                            <option value="" disabled selected>Choose user role...</option>
                                            <c:forEach items="${AllUserTypes}" var="usert">
                                                <option value="${usert.userTypeId}">${usert.usertype}</option>
                                            </c:forEach>
                                        </form:select>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div id="branch" class="form-group col-sm-6">
                                        <label for="brid">Branches *</label>
                                        <form:select path="branches.branchId" class="form-control" items="${AllBranchesForUsers}" itemValue="branchId" itemLabel="branchName" id="brid" name="brid" required="required" data-placeholder="Select branch" data-error="Select branch">
                                            <option value="" disabled selected>Choose branch...</option>
                                            <c:forEach items="${AllBranchesForUsers}" var="branch">
                                                <option value="${branch.branchId}">${branch.branchName}</option>
                                            </c:forEach>
                                        </form:select>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-sm-12">
                                        <div class="radio">
                                            <form:radiobutton path="status" name="status" id="active" required="required" value="1" data-error="Select status"/>
                                            <label for="active"> Active </label>
                                        </div>
                                        <div class="radio">
                                            <form:radiobutton path="status" name="status" id="inactive" required="required" value="0" data-error="Select status"/>
                                            <label for="inactive"> In-Active </label>
                                        </div>
                                    </div>
                                    <div class="help-block with-errors"></div>
                                </div>

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

<script type="text/javascript">

    var active = "Active";
    var inactive = "In Active";

    $(window).on('load',function(){
        var yes = document.getElementById('crole').value;

        if(yes == "4"){

            $("#branch").show();

        }else if(yes == "1" || yes == "2"){
            $("#branch").hide();

        }

        var usertypeSelected = $('#crole :selected').text();
        document.getElementById("currentusertype").value = usertypeSelected;

        var branchSelected = $('#brid :selected').text();
        document.getElementById("currentbranch").value = branchSelected;

        var currentstatus = $('input[name=status]:radio:checked').val();

        if(currentstatus == false)
        {
            $("#currentstatus").val(inactive)
        }
        else if(currentstatus == true)
        {
            $("#currentstatus").val(active)
        }
    });

    $(document).ready(function()
    {

        $("select#crole").change(function(){
            var selectedUsertype = $(this).children("option:selected").text();
            document.getElementById("tusertype").value = selectedUsertype;
        });

        $("select#brid").change(function(){
            var selectedBranch = $(this).children("option:selected").text();
            document.getElementById("tbranch").value = selectedBranch;
            //alert(selectedBranch)
        });

        $(function() {
            $("input:radio[name='status']").click(function() {

                var afterStatus = $(this).val();

                if(afterStatus == false)
                {
                    $("#afterStatus").val("In Aactive")
                    //alert($("#afterStatus").val());
                }
                else if(afterStatus == true)
                {
                    $("#afterStatus").val("Active")
                    //alert($("#afterStatus").val());
                }
            });
        });

        $("#crole").change(function () {
            if ($('#crole option:selected').val() == "4"){
             $('#branch').show();
             }
             else {
             $('#branch').hide();
             }
        });
    });

</script>
</body>

