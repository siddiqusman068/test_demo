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
<%@ include file="/WEB-INF/views/template/usersHeader.jsp" %>
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
                    <h4 class="page-title">User Creation Form</h4> </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <button class="right-side-toggle waves-effect waves-light btn-info btn-circle pull-right m-l-20"><i class="ti-settings text-white"></i></button>
                    <ol class="breadcrumb">
                        <li><a href="#">RCS Team</a></li>
                        <li><a href="#">Users</a></li>
                        <li class="active">Add users</li>
                    </ol>
                </div>
            </div>

            <!-- .row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title m-b-0">Users</h3>
                        <p class="text-muted m-b-30">Creation Form</p>
                        <form:form action="${pageContext.request.contextPath}/rcsTeam/users/add" method="post" commandName="users" data-toggle="validator">
                            <div class="form-group">
                                <label for="inputUserName" class="control-label">Username</label>
                                <form:input type="text" class="form-control" path="name" name="userName" id="inputUserName" placeholder="User Name" data-error="Enter user name" required="required"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputUserId" class="control-label">UserId</label>
                                <c:url value="/rcsTeam/getUserName" var="getUserName"/>
                                <form:input type="text" class="form-control" path="userName" name="name" id="inputUserId" onfocusout="doAjaxName('${getUserName}',$(this).val())" placeholder="User Id" data-error="Enter user Id" required="required"/>
                                <div id="reason" style="color: red"></div>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">Email</label>
                                <c:url value="/rcsTeam/getUserEmail" var="getUserEmail"/>
                                <form:input type="email" class="form-control" path="email" name="email" id="inputEmail" onfocusout="doAjaxEmail('${getUserEmail}',$(this).val())" placeholder="Email" data-error="Bruh, that email address is invalid" required="required"/>
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
                                            <c:forEach items="${AllUserTypes}" var="usert">
                                                <option value="${usert.userTypeId}">${usert.usertype}</option>
                                            </c:forEach>
                                        </form:select>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div id="branch" class="form-group col-sm-6">
                                        <label for="brid">Branches *</label>
                                        <form:select path="branches.branchId" class="form-control"  id="brid" name="brid" required="required" data-placeholder="Select branch" data-error="Select branch">
                                            <option value="" disabled selected>Choose branch...</option>
                                            <c:forEach items="${AllBranchesForUsers}" var="branch">
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
        </div>
        <!-- /.container-fluid -->
        <footer class="footer text-center"> <fmt:formatDate value="${date}" pattern="yyyy" /> &copy; UBLI RCS brought to you by UBL Insureres IT Dept. </footer>
    </div>
    <!-- /#page-wrapper -->
</div>

<!-- /#wrapper -->
<%@ include file="/WEB-INF/views/template/usersFooter.jsp" %>

<script type="text/javascript">

    $(document).ready(function() {
        $('#branch').hide();

        $('#crole').change(function () {
            if ($('#crole option:selected').val() == 4){
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
            if ($('#crole option:selected').val() == 4){
                $('#branch').show();
            }
            else {
                $('#branch').hide();
            }
        });
    });

</script>
</body>
