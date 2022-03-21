<%--
  Created by IntelliJ IDEA.
  User: Haider Iqbal
  Date: 12/28/2020
  Time: 7:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<link rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/dropify/dist/css/dropify.min.css"/>"/>
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


    <%-- DataTable For Images/Docs --%>
    <%--<div id="table-datatables">
        <h6 class="header"><strong>Client Documents</strong></h6>
        <div class="row">

            <div class="col s12">
                <table id="data-table" class="striped centered display" cellspacing="0" >
                    <thead style="width: 100%">
                    <tr>
                        <th>Document Name</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <c:forEach items="${clientsDocumentsList}" var="doc" varStatus="counter">
                        <tr>
                            <td>${doc.name}</td>
                            <td>${doc.description}</td>
                            <td>
                                <div class="row">
                                    <a title="Download" class="btn waves-effect waves-light blue darken-2" href="<c:url value="/branchUser/clients/download/${doc.clients.clientsId}/${doc.clientsDocId}" />"/>Download</a>
                                    <a title="Remove" class="btn waves-effect waves-light materialize-red" href="<c:url value="/branchUser/clients/delete/${doc.clients.clientsId}/${doc.clientsDocId}" />"/>Delete</a>
                                </div>
                            </td>
                        </tr>

                    </c:forEach>

                </table>
            </div>
        </div>
    </div>--%>

    <!-- ============================================================== -->
    <!-- Page Content -->
    <!-- ============================================================== -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Supporting Docs Gird</h4> </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <%--<button class="right-side-toggle waves-effect waves-light btn-info btn-circle pull-right m-l-20"><i class="ti-settings text-white"></i></button>--%>
                    <ol class="breadcrumb">
                        <li><a href="#">Branch User</a></li>
                        <li><a href="#">Docs</a></li>
                        <li class="active">Docs Upload Page</li>
                    </ol>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- /row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title m-b-0">Docs Data Table</h3>
                        <%--<p class="text-muted m-b-30">Images Data table </p>--%>
                        <br>
                        <div class="table-responsive">
                            <table id="myTable" class="table table-striped">
                                <thead style="width: 100%">
                                <tr>
                                    <th>Document Name</th>
                                    <th>Description</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <c:forEach items="${locationReportsList}" var="doc" varStatus="counter">
                                    <tr>
                                        <td style="vertical-align: middle">${doc.name}</td>
                                        <td style="vertical-align: middle">${doc.description}</td>
                                        <td>
                                            <div class="btn-group-vertical row">
                                                <a title="Download" class="btn btn-block btn-success btn-rounded" href="<c:url value="/rcsHead/download/${doc.raForm.raFormId}/${doc.locReportId}" />"/><i class="mdi mdi-cloud-download"></i>Download</a>
                                                <br>
                                                <a title="Remove" class="btn btn-block btn-danger btn-rounded" href="<c:url value="/rcsHead/delete/${doc.raForm.raFormId}/${doc.locReportId}" />"/><i class="mdi mdi-delete-empty"></i>Remove</a>
                                            </div>

                                        </td>
                                    </tr>

                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->

            <!-- .row -->

            <div class="row">
                <div class="col-sm-12 ol-md-12 col-xs-12">
                    <form:form method="post" cssClass="form-horizontal" id="validation-form" enctype="multipart/form-data" modelAttribute="fileBucket" >
                    <div class="white-box">
                        <h3 class="box-title">Doc Upload</h3>
                        <%--<label for="input-file-now">Your so fresh input file — Default version</label>--%>
                        <form:input path="file" type="file" id="input-file-now" class="dropify" accept='image/*' data-height="500"/>

                        <br>
                        <div class="row">
                            <div class="col-md-12">
                                <label class="control-label">Description</label>
                                <form:input path="description" type="text" class="form-control" id="description" name="description" placeholder="Doc description"/>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-2 col-sm-4 col-xs-12 pull-right">
                                <button type="submit" class="btn btn-block btn-outline btn-rounded btn-info"><i class="mdi mdi-cloud-upload"></i>&nbsp;Upload</button>
                            </div>
                        </div>
                    </div>
                    </form:form>
                    <div class="row">
                        <div class="col-lg-2 col-sm-4 col-xs-12 pull-right">
                            <button href="<c:url value="../../clients/summary?id=${clients.clientsId}"/>" class="btn btn-block btn-outline btn-rounded btn-info"><i class="mdi mdi-image-album"></i>To Snap Inspection</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->

            <!-- ============================================================== -->
            <!-- .right-sidebar -->
            <div class="right-sidebar">
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
            </div>
            <!-- ============================================================== -->
            <!-- End Right sidebar -->
            <!-- ============================================================== -->
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
<script src="<c:url value="/resources/resourcesdarktheme/js/jasny-bootstrap.js"/>"></script>
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/datatables/jquery.dataTables.min.js"/>"></script>
<!-- jQuery file upload -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/dropify/dist/js/dropify.min.js"/>"></script>
<script>
    $(document).ready(function() {
        // Basic
        $('.dropify').dropify();
        // Translated
        $('.dropify-fr').dropify({
            messages: {
                default: 'Glissez-déposez un fichier ici ou cliquez',
                replace: 'Glissez-déposez un fichier ou cliquez pour remplacer',
                remove: 'Supprimer',
                error: 'Désolé, le fichier trop volumineux'
            }
        });
        // Used events
        var drEvent = $('#input-file-events').dropify();
        drEvent.on('dropify.beforeClear', function(event, element) {
            return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
        });
        drEvent.on('dropify.afterClear', function(event, element) {
            alert('File deleted');
        });
        drEvent.on('dropify.errors', function(event, element) {
            console.log('Has Errors');
        });
        var drDestroy = $('#input-file-to-destroy').dropify();
        drDestroy = drDestroy.data('dropify')
        $('#toggleDropify').on('click', function(e) {
            e.preventDefault();
            if (drDestroy.isDropified()) {
                drDestroy.destroy();
            } else {
                drDestroy.init();
            }
        })
    });
</script>
<!--Style Switcher -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"/>"></script>
</body>
