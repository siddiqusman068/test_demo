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
                    <h4 class="page-title">Validation Forms Page</h4> </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <button class="right-side-toggle waves-effect waves-light btn-info btn-circle pull-right m-l-20"><i class="ti-settings text-white"></i></button>
                    <ol class="breadcrumb">
                        <li><a href="#">Dashboard</a></li>
                        <li><a href="#">Forms</a></li>
                        <li class="active">Validation Forms Page</li>
                    </ol>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- .row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title m-b-0">Form Validation</h3>
                        <p class="text-muted m-b-30"> Bootstrap Form Validation</p>
                        <form:form action="${pageContext.request.contextPath}/rcsHead/users/add" method="post" commandName="users" >
                            <div class="form-group">
                                <label for="inputUserName" class="control-label">Username</label>
                                <form:input type="text" class="form-control" path="name" name="userName" id="inputUserName" placeholder="User Name" data-error="Enter user name" required="required"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputUserId" class="control-label">UserId</label>
                                <c:url value="/rcsHead/getUserName" var="getUserName"/>
                                <form:input type="text" class="form-control" path="userName" name="name" id="inputUserId" placeholder="User Id" data-error="Enter user Id" required="required"/>
                                <div id="reason" style="color: red"></div>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">Email</label>
                                <c:url value="/rcsHead/getUserEmail" var="getUserEmail"/>
                                <form:input type="email" class="form-control" path="email" name="email" id="inputEmail"  placeholder="Email" data-error="Bruh, that email address is invalid" required="required"/>
                                <div class="help-block with-errors"></div>
                                <div id="reasonc" style="color: red"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword" class="control-label">Password</label>
                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <form:input type="password" data-toggle="validator" data-minlength="6" class="form-control" path="password" name="password" id="inputPassword" placeholder="Password" required="required"/>
                                        <span class="help-block">Minimum of 6 characters</span>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <input type="password" class="form-control" id="inputPasswordConfirm" data-match="#inputPassword" data-match-error="Whoops, these don't match" placeholder="Confirm" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label for="crole">User Type *</label>
                                        <form:select path="userTypes.userTypeId" class="form-control" id="crole" required="required" data-placeholder="Select usertype" name="crole" data-error="Select user type">
                                            <option value="" disabled selected>Choose user role...</option>
                                            <c:forEach items="${AllTypes}" var="usert">
                                                <option value="${usert.userTypeId}">${usert.usertype}</option>
                                            </c:forEach>
                                        </form:select>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div id="branch" class="form-group col-sm-6">
                                        <label for="brid">Branches *</label>
                                        <form:select path="branches.branchId" class="form-control"  id="brid" name="brid" required="required" data-placeholder="Select branch" data-error="Select branch">
                                            <option value="" disabled selected>Choose branch...</option>
                                            <c:forEach items="${AllBranches}" var="branch">
                                                <option value="${branch.branchId}">${branch.branchName}</option>
                                            </c:forEach>
                                        </form:select>
                                        <div class="help-block with-errors"></div>
                                    </div>
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

            <!-- ============================================================== -->
            <!-- .right-sidebar -->
<%--            <div class="right-sidebar">
                <div class="slimscrollright">
                    <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span> </div>
                    <div class="r-panel-body">
                        <ul id="themecolors" class="m-t-20">
                            <li><b>With Light sidebar</b></li>
                            <li><a href="javascript:void(0)" data-theme="default" class="default-theme">1</a></li>
                            <li><a href="javascript:void(0)" data-theme="green" class="green-theme">2</a></li>
                            <li><a href="javascript:void(0)" data-theme="gray" class="yellow-theme">3</a></li>
                            <li><a href="javascript:void(0)" data-theme="blue" class="blue-theme">4</a></li>
                            <li><a href="javascript:void(0)" data-theme="purple" class="purple-theme">5</a></li>
                            <li><a href="javascript:void(0)" data-theme="megna" class="megna-theme">6</a></li>
                            <li><b>With Dark sidebar</b></li>
                            <br/>
                            <li><a href="javascript:void(0)" data-theme="default-dark" class="default-dark-theme">7</a></li>
                            <li><a href="javascript:void(0)" data-theme="green-dark" class="green-dark-theme">8</a></li>
                            <li><a href="javascript:void(0)" data-theme="gray-dark" class="yellow-dark-theme">9</a></li>
                            <li><a href="javascript:void(0)" data-theme="blue-dark" class="blue-dark-theme working">10</a></li>
                            <li><a href="javascript:void(0)" data-theme="purple-dark" class="purple-dark-theme">11</a></li>
                            <li><a href="javascript:void(0)" data-theme="megna-dark" class="megna-dark-theme">12</a></li>
                        </ul>
                    </div>
                </div>
            </div>--%>
            <!-- ============================================================== -->
            <!-- End Right sidebar -->
            <!-- ============================================================== -->
        </div>
        <!-- /.container-fluid -->
        <footer class="footer text-center"> 2017 &copy; Ample Admin brought to you by themedesigner.in </footer>
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

    $(document).ready(function() {
        $('#branch').hide();

        $('#crole').change(function () {
            if ($('#crole option:selected').val() == 2){
                $('#branch').show();
            }
            else {
                $('#branch').hide();
            }
        });
    });

    function doAjaxName(lookUrl,username) {
        //alert(cnicNtn);
        $.ajax({
            url: lookUrl,
            data: ({username : username}),
            success: function(data) {
                //content = data;
                //$('#reason').append(content);
                $('#reason').html(data);
                if(data !== ''){
                    $("#userName").val("");
                }
            }
        });
    }

    function doAjaxEmail(lookUrl,email) {
        //alert(cnicNtn);
        $.ajax({
            url: lookUrl,
            data: ({email : email}),
            success: function(data) {
                //content = data;
                //$('#reason').append(content);
                $('#reasonc').html(data);
                if(data !== ''){
                    $("#email").val("");
                }
            }
        });
    }

    $(document).ready(function() {
        $('#branch').hide();

        $('#crole').change(function () {
            if ($('#crole option:selected').val() == 2){
                $('#branch').show();
            }
            else {
                $('#branch').hide();
            }
        });
    });

</script>
</body>
