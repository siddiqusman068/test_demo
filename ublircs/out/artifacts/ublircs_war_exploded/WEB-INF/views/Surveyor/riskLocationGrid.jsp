<%--
  Created by IntelliJ IDEA.
  User: Haider Iqbal
  Date: 1/2/2021
  Time: 12:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="date" class="java.util.Date" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/resourcesdarktheme/plugins/images/favicon.png"/>"/>
<title>RMS (Risk Management Services)</title>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/bootstrap/dist/css/darkthemebootstrap.min.css"/>"/>
<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/datatables/jquery.dataTables.min.css"/>"/>
<link href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
<!-- animation CSS -->
<link rel="stylesheet" href="<c:url value="/resources/resourcesdarkthemebootstrap/css/animate.css"/>"/>
<!-- Menu CSS -->
<link rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"/>"/>
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
                    <h4 class="page-title">Risk Locations Grid</h4> </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <%--<button class="right-side-toggle waves-effect waves-light btn-info btn-circle pull-right m-l-20"><i class="ti-settings text-white"></i></button>--%>
                    <ol class="breadcrumb">
                        <li><a href="#">Surveyors</a></li>
                        <li><a href="#">Risk Location</a></li>
                        <li class="active">Risk Location Grid</li>
                    </ol>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- /row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title m-b-0">Risk Data Table</h3>
                        <%--<p class="text-muted m-b-30">Images Data table </p>--%>
                        <br>
                        <div class="table-responsive">
                            <table id="myTable" class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Name of Insured</th>
                                    <th>Risk Location</th>
                                    <th>Date of issue</th>
                                    <th>Sum Insured</th>
                                    <th>Branch</th>
                                    <th>Date Of Inspection</th>
                                    <th>Inspected By</th>
                                    <th>Risk Score</th>
                                    <th>Risk Rank</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${allBranchWise}" var="ra" varStatus="counter">
                                    <tr>
                                        <td>
                                                ${ra.insuredName}
                                        </td>
                                        <td>
                                                ${ra.riskLocations.riskLocation}
                                        </td>
                                        <td>
                                                ${ra.created}
                                        </td>
                                        <td>
                                                ${ra.sumInsured}
                                        </td>
                                        <td>
                                                ${ra.branches.branchName}
                                        </td>
                                        <td>
                                                ${ra.visitDate}
                                        </td>
                                        <td>
                                                ${ra.inspectedBy}
                                        </td>

                                        <td>
                                                ${ra.totalRiskFactors}
                                        </td>

                                        <td>
                                            <c:if test="${ra.ranks.equals('Green #3FAE57')}">
                                                <strong style="color:#3FAE57">(Green)</strong>
                                            </c:if>
                                            <c:if test="${ra.ranks.equals('Light Gree #9BCD5Cn')}">
                                                <strong style="color:#9BCD5C">(Light Green)</strong>
                                            </c:if>
                                            <c:if test="${ra.ranks.equals('Amber #FBD772')}">
                                                <strong style="color:#FBD772">(Amber)</strong>
                                            </c:if>
                                            <c:if test="${ra.ranks.equals('Orange #F9BE34')}">
                                                <strong style="color:#F9BE34">(Orange)</strong>
                                            </c:if>
                                            <c:if test="${ra.ranks.equals('Red #F10B1D')}">
                                                <strong style="color:#F10B1D;">(Red)</strong>
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${ra.status.equals('Assigned For Inspection')}">
                                                <a class="btn btn-block btn-warnig btn-rounded" href="<spring:url value="/surveyor/addForm/${ra.raFormId}"/>">Assigned For Inspection</a>
                                            </c:if>
                                            <c:if test="${ra.status.equals('Inspection In Progress')}">
                                                <a class="btn btn-block btn-danger btn-rounded">Inspection In Progress</a>
                                            </c:if>
                                            <c:if test="${ra.status.equals('Waiting for Evaluation')}">
                                                <a class="btn btn-block btn-info btn-rounded">Waiting for Evaluation</a>
                                            </c:if>
                                            <c:if test="${ra.status.equals('Evaluation Complete')}">
                                                <a class="btn btn-block btn-success btn-rounded">Evaluation Complete</a>
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${ra.status.equals('Evaluation Complete')}">
                                                <button style="vertical-align: middle" class="btn btn-primary btn-circle btn-lg" title="Summary" onclick="location.href='http://localhost:8080/ublircs/surveyor/briefSummary/${ra.raFormId}'"><i class="fa  fa-files-o"></i></button>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
            <!-- /.row -->
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
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/datatables/jquery.dataTables.min.js"/>"></script>

<!-- start - This is for export functionality only -->
<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
<!-- end - This is for export functionality only -->
<script>
    $(document).ready(function() {
        $('#myTable').DataTable();
    })
</script>

<!--Style Switcher -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"/>"></script>

</body>
