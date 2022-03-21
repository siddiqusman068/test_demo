<%--
  Created by IntelliJ IDEA.
  User: Haider Iqbal
  Date: 11/6/2020
  Time: 12:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="date" class="java.util.Date" />
<%@ include file="/WEB-INF/views/template/header.jsp" %>

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

                        <h3 class="box-title m-b-0">RISK ASSESSMENT FORM</h3>
                        <%--<p class="text-muted m-b-30 font-13"> This is the Validation wizard with validation.</p>--%>
                        <!-- .row -->
                        <form id="validation" class="form-horizontal" method="get" action="<c:url value="/surveyor/addForm/getSurveyorsRAForm"/>">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="panel-group wiz-aco" id="accordion" role="tablist"
                                         aria-multiselectable="true">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="headingOne">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                       href="#collapseOne" aria-expanded="true"
                                                       aria-controls="collapseOne">
                                                        <i style="font-size: 20px;" class="fa fa-bitcoin"></i></span>&nbsp;Risk Cost
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                                                 aria-labelledby="headingOne">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label"><h4>Risk Cost?</h4></label>
                                                                <div class="radio-list">
                                                                    <c:if test="${raForms.riskCost.equals('Below 500 million')}">
                                                                        <strong>
                                                                            Industrial/General Risks (Below 500m)
                                                                        </strong>
                                                                    </c:if>
                                                                    <c:if test="${raForms.riskCost.equals('Above 500 million')}">
                                                                        <strong>
                                                                            Industrial/General Risks (Above 500m)
                                                                        </strong>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="headingTwo">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion"
                                                       href="#collapseTwo" aria-expanded="false"
                                                       aria-controls="collapseTwo">
                                                        <i style="font-size: 20px;" class="fa fa-cogs"></i></span>&nbsp;Industrial/General Risks
                                                        <c:if test="${raForms.riskCost.equals('Below 500 million')}">
                                                            <div style="display: inline">
                                                                (Below 500m)
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${raForms.riskCost.equals('Above 500 million')}">
                                                            <div style="display: inline;">
                                                                (Above 500m)
                                                            </div>
                                                        </c:if>
                                                    </a>
                                                </h4></div>
                                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                                                 aria-labelledby="headingTwo">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Risk Code:</label>&nbsp;<strong style="color: white">${raForms.riskLocations.riskCode}</strong>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">City:</label>&nbsp;<strong style="color: white">${raForms.riskLocations.city}</strong>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Policy No:</label>&nbsp;<strong style="color: white">${raForms.policyNo}</strong>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Name Of Branch:</label>&nbsp;<strong style="color: white">${raForms.branches.branchName}</strong>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Insured/Proposer:</label>&nbsp;<strong style="color: white">${raForms.insuredName}</strong>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Date of Visit:</label>&nbsp;<strong style="color: white">${raForms.visitDate}</strong>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Risk Location:</label>&nbsp;<strong style="color: white">${raForms.riskLocations.riskLocation}</strong>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Head Office Address:</label>&nbsp;<strong style="color: white">${raForms.headOfficeAddress}</strong>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Person Met/Designation:</label>&nbsp;<strong style="color: white">${raForms.personMet}</strong>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Inspected By:</label>&nbsp;<strong style="color: white">${raForms.inspectedBy}</strong>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Nature Of Business/Occupation:</label>&nbsp;<strong style="color: white">${raForms.natureOfBusinessOccupation}</strong>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Loss History (Date):</label>&nbsp;<strong style="color: white">${raForms.lossHistoryDate}</strong>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Loss History (Amount):</label>&nbsp;<strong style="color: white">${raForms.lossHistoryAmount}</strong>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Subject Matter?</label>&nbsp;<strong style="color: white">${raForms.subjectMatter}</strong>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Sum Isured:</label>&nbsp;<strong style="color: white">${raForms.sumInsured}</strong>
                                                        </div>
                                                    </div>
                                                    <hr><hr>
                                                    <h3><strong>General Information:</strong></h3>
                                                    <hr><hr>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Is the premises owned or rented?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="premisesOwnedRented" id="owned" value="Owned">
                                                                <label for="owned"> Owned </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="premisesOwnedRented" id="rented" value="Rented">
                                                                <label for="rented"> Rented </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Does the premises has multiple tenancy?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="multipleTenancy" id="yes" value="Yes">
                                                                <label for="yes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="multipleTenancy" id="no" value="No">
                                                                <label for="no"> No </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Surrondings of the premises?</label>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="premisesSurrounding" id="front" value="Front">
                                                                <label for="front">Front</label>
                                                            </div>
                                                            <div id="frontSurrondings"><br>
                                                                <textarea class="form-control" id="frontDetails" name="frontSurrondingsDetails" placeholder="Front Surrondings Details"></textarea><hr>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="premisesSurrounding" id="back" value="Back">
                                                                <label for="back">Back</label>
                                                            </div>
                                                            <div id="backSurrondings"><br>
                                                                <textarea class="form-control" id="backDetails" name="backSurrondingsDetails" placeholder="Back Surrondings Details"></textarea><hr>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="premisesSurrounding" id="left" value="Left">
                                                                <label for="left">Left</label>
                                                            </div>
                                                            <div id="leftSurrondings"><br>
                                                                <textarea class="form-control" id="leftDetails" name="leftSurrondingsDetails" placeholder="Left Surrondings Details"></textarea><hr>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="premisesSurrounding" id="right" value="Right">
                                                                <label for="right">Right</label>
                                                            </div>
                                                            <div id="rightSurrondings"><br>
                                                                <textarea class="form-control" id="rightDetails" name="rightSurrondingsDetails" placeholder="Right Surrondings Details"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Year Built</label>
                                                            <input type="text" class="form-control" id="yearBuilt" name="yearBuilt" placeholder="YYYY">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="col-md-6">
                                                                <label class="control-label">No. Of Floors</label>
                                                                <input type="text" class="form-control" id="noOfFloors" name="noOfFloors" placeholder="No. of floors">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Covered Area</label>
                                                            <input type="text" class="form-control" id="coveredArea" name="coveredArea" placeholder="Covered area">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <label class="control-label">Roof?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="roofType" id="concrete" value="Concrete Cement">
                                                                <label for="concrete"> Concrete Cement </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="roofType" id="asbestos" value="Asbestos Sheet">
                                                                <label for="asbestos"> Asbestos Sheet </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="roofType" id="tin" value="Tin Sheets">
                                                                <label for="tin"> Tin Sheets </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="roofType" id="pre-cast" value="Pre-Cast">
                                                                <label for="pre-cast"> Pre-Cast </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="roofType" id="slab" value="Concrete Slab">
                                                                <label for="slab"> Concrete Slab </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label class="control-label">Plinth Level?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="plinthLevel" id="above" value="Above">
                                                                <label for="above"> Above </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="plinthLevel" id="below" value="Below">
                                                                <label for="below">Below</label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="plinthLevel" id="same" value="Same">
                                                                <label for="same"> Same </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="plinthLevel" id="roadLevel" value="Road Level">
                                                                <label for="roadLevel"> Road Level </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label class="control-label">Floor Condition?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="floorCondition" id="satisfactory" value="Satisfactory">
                                                                <label for="satisfactory"> Satisfactory </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="floorCondition" id="improvements" value="Need Improvement">
                                                                <label for="improvements">Need Improvement</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label class="control-label">Electricity Wiring?</label>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="electricWiring" id="conduit" value="Conduit">
                                                                <label for="conduit"> Conduit </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="electricWiring" id="concealed" value="Concealed">
                                                                <label for="concealed"> Concealed </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="electricWiring" id="open" value="Open">
                                                                <label for="open"> Open </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="electricWiring" id="loose" value="Loose in some areas">
                                                                <label for="loose"> Loose in some areas </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="electricWiring" id="needImprove" value="Needs Improvement">
                                                                <label for="needImprove"> Needs Improvement </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="electricWiring" id="notApplicable" value="Not Applicablee">
                                                                <label for="notApplicablee"> N/A </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <label class="control-label">House keeping?</label>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="houseKeeping" id="satisfy" value="Satisfactory">
                                                                <label for="satisfy"> Satisfactory </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="houseKeeping" id="need" value="Needs Improvement">
                                                                <label for="need"> Needs Improvement </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="houseKeeping" id="notApplicables" value="Not Applicable">
                                                                <label for="notApplicables"> N/A </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label class="control-label">Cigarette Smoking?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="cigaretteSmoking" id="smoke" value="Smoking">
                                                                <label for="smoke"> Smoking </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="cigaretteSmoking" id="nonSmoke" value="Non-Smoking">
                                                                <label for="nonSmoke">Non-Smoking</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label class="control-label">Storage Arrangements?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="storageArrangements" id="arrangesatisfactory" value="Satisfactory">
                                                                <label for="arrangesatisfactory"> Satisfactory </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="storageArrangements" id="arrangeimprovements" value="Need Improvement">
                                                                <label for="arrangeimprovements">Need Improvement</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label class="control-label">Raw Material Stored?</label>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="rawMaterialStored" id="godown" value="Separate Godown">
                                                                <label for="godown"> Separate Godown </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="rawMaterialStored" id="processArea" value="Process Area">
                                                                <label for="processArea"> Process Area </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="rawMaterialStored" id="openStorage" value="Open">
                                                                <label for="openStorage"> Open </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="rawMaterialStored" id="notApplicabless" value="Not Applicable">
                                                                <label for="notApplicabless"> N/A </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Stored?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="storedIn" id="storedgodown" value="Separate Godown">
                                                                <label for="storedgodown"> Separate Godown </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="storedIn" id="storedprocessArea" value="Process Area">
                                                                <label for="storedprocessArea"> Process Area </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="storedIn" id="storedopenStorage" value="Open">
                                                                <label for="storedopenStorage"> Open </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Any type of cyliders(Gas/Kerosene)?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="typeCylinders" id="typeYes" value="Yes">
                                                                <label for="typeYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="typeCylinders" id="typeNo" value="No">
                                                                <label for="typeNo"> No </label>
                                                            </div>
                                                            <div style="display:none " id="typeofCylinders">
                                                                <input type="text" class="form-control" id="noofCylinders" name="noofCylinders" placeholder="No. of cylinders">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Is hazardous material stored separately?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="hazardousMaterialStored" id="hazardousYes" value="Yes">
                                                                <label for="hazardousYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="hazardousMaterialStored" id="hazardousNo" value="No">
                                                                <label for="hazardousNo"> No </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">If night work carries out?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="nightWork" id="nightWorkYes" value="Yes">
                                                                <label for="nightWorkYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="nightWork" id="nightWorkNo" value="No">
                                                                <label for="nightWorkNo"> No </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Godowns/Warehouses are electrified?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="warehousesElectrified" id="electricYes" value="Yes">
                                                                <label for="electricYes">Yes</label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="warehousesElectrified" id="electricNo" value="No">
                                                                <label for="electricNo">No</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Security Arrangement?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="securityArrangement" id="securitySatisfactory" value="Satisfactory">
                                                                <label for="securitySatisfactory"> Satisfactory </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="securityArrangement" id="securityImprove" value="Needs Improvement">
                                                                <label for="securityImprove"> Needs Improvement </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">CCTV Cameras?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="cctvCameras" id="cctvYes" value="Yes">
                                                                <label for="cctvYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="cctvCameras" id="cctvNo" value="No">
                                                                <label for="cctvNo"> No </label>
                                                            </div>
                                                            <div style="display:none " id="cameras">
                                                                <input type="text" class="form-control" id="noofcctvCameras" name="noofcctvCameras" placeholder="No. of CCTV cameras">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Fire Fighting Team?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="fireFightingTeam" id="fireTeamYes" value="Yes">
                                                                <label for="fireTeamYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="fireFightingTeam" id="fireTeamNo" value="No">
                                                                <label for="fireTeamNo"> No </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Frequency Of Drill</label>
                                                            <input type="text" class="form-control" id="frequencyOfDrill" name="frequencyOfDrill" placeholder="Drill frequency">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Fire Exits Provided?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="fireExitsProvided" id="fireExitsYes" value="Yes">
                                                                <label for="fireExitsYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="fireExitsProvided" id="fireExitsNo" value="No">
                                                                <label for="fireExitsNo"> No </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">No. Of Fire Extinguishers Installed</label>
                                                            <input type="text" class="form-control" id="noOfFireExtinguishers" name="noOfFireExtinguishers" placeholder="No. Of Fire Extinguishers">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">No. Of Fire Buckets (Water/Sand)</label>
                                                            <input type="text" class="form-control" id="noOfFireBuckets" name="noOfFireBuckets" placeholder="No. Of Fire Buckets">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Hydrant System Installed?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="hydrantSystem" id="hydrantSystemYes" value="Yes">
                                                                <label for="hydrantSystemYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="hydrantSystem" id="hydrantSystemNo" value="No">
                                                                <label for="hydrantSystemNo"> No </label>
                                                            </div>
                                                            <div style="display:none " id="hydrantSystem">
                                                                <hr>
                                                                <input type="text" class="form-control" id="noofHydrantPoints" name="noofHydrantPoints" placeholder="No. of hydrant points">
                                                                <hr>
                                                                <input type="text" class="form-control" id="noofFireHoses" name="noofFireHoses" placeholder="No. of fire hoses">
                                                                <hr>
                                                                <input type="text" class="form-control" id="hydrantpumpCapacity" name="hydrantpumpCapacity" placeholder="Hydrant pump capacity">
                                                                <hr>
                                                                <input type="text" class="form-control" id="hydrantPressure" name="hydrantPressure" placeholder="Hydrant pressure">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Hydrant pump stiil operates after electricity shuts?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="hydrantPumpOperates" id="hydrantPumpOperatesYes" value="Yes">
                                                                <label for="hydrantPumpOperatesYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="hydrantPumpOperates" id="hydrantPumpOperatesNo" value="No">
                                                                <label for="hydrantPumpOperatesNo"> No </label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <label class="control-label">Sources Of Electricity Supply?</label>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="electricitySupply" id="publicSupply" value="Public Electric Supply">
                                                                <label for="publicSupply"> Public Electric Supply </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="electricitySupply" id="inHouse" value="In House">
                                                                <label for="inHouse"> In House </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="electricitySupply" id="powerHouse" value="Power House">
                                                                <label for="powerHouse"> Power House </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="electricitySupply" id="generators" value="Generators">
                                                                <label for="generators"> Generators </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="electricitySupply" id="notApplicablee" value="Not Applicable">
                                                                <label for="notApplicablee"> N/A </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label class="control-label">Capacity Of Underground Tank(s)</label>
                                                            <input type="text" class="form-control" name="capacityUndergroundTank" id="capacityUndergroundTank" placeholder="Underground tank capacity">
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label class="control-label">Capacity Of Overhead Tank(s)</label>
                                                            <input type="text" class="form-control" name="capacityOverheadTank" id="capacityOverheadTank" placeholder="Elevated/overhead tank capacity">
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label class="control-label">Sources Of Water Supply?</label>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="sourcesOfWaterSupply" id="publicMain" value="Public Main">
                                                                <label for="publicMain"> Public Main </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="sourcesOfWaterSupply" id="tubeWell" value="Tube Well">
                                                                <label for="tubeWell"> Tube Well </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="sourcesOfWaterSupply" id="tankers" value="Tankers">
                                                                <label for="tankers"> Tankers </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="sourcesOfWaterSupply" id="bore" value="Bore">
                                                                <label for="bore"> Bore </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="sourcesOfWaterSupply" id="notApplicablese" value="Not Applicable">
                                                                <label for="notApplicablese"> N/A </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Fire Alarm Installed?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="fireAlarmInstalled" id="fireAlarmYes" value="Yes">
                                                                <label for="fireAlarmYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="fireAlarmInstalled" id="fireAlarmNo" value="No">
                                                                <label for="fireAlarmNo"> No </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Sprinkler System Installed?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="sprinklerSystemInstalled" id="sprinklerSystemYes" value="Yes">
                                                                <label for="sprinklerSystemYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="sprinklerSystemInstalled" id="sprinklerSystemNo" value="No">
                                                                <label for="sprinklerSystemNo"> No </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Smoke Detectors Installed?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="smokeDetectorsInstalled" id="smokeDetectorsYes" value="Yes">
                                                                <label for="smokeDetectorsYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="smokeDetectorsInstalled" id="smokeDetectorsNo" value="No">
                                                                <label for="smokeDetectorsNo"> No </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="nearestHospital" class="control-label">Nearest hospital</label>
                                                            <textarea id="nearestHospital" name="nearestHospital" placeholder="Nearer hospital" class="form-control"></textarea>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="responseTimeHospital" class="control-label">Response Time (Hospital)</label>
                                                            <input id="responseTimeHospital" name="responseTimeHospital" placeholder="Estimated response time (Hospital)" class="form-control">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="nearestPoliceStation" class="control-label">Nearest Police Station</label>
                                                            <textarea id="nearestPoliceStation" name="nearestPoliceStation" placeholder="Nearer police station" class="form-control"></textarea>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="responseTimePoliceStation" class="control-label">Response Time (Police Station)</label>
                                                            <input id="responseTimePoliceStation" name="responseTimePoliceStation" placeholder="Estimated response time (Police Station)" class="form-control">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="nearestFireStation" class="control-label">Nearest Fire Station</label>
                                                            <textarea id="nearestFireStation" name="nearestFireStation" placeholder="Nearer fire station" class="form-control"></textarea>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="responseTimeFireStation" class="control-label">Response Time (Fire Station)</label>
                                                            <input id="responseTimeFireStation" name="responseTimeFireStation" placeholder="Estimated response time (Fire Station)" class="form-control">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Accessibility For Fire Fighters?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="accessibilityForFireFighters" id="accessibilityFireFightersSatisfactory" value="Satisfactory">
                                                                <label for="accessibilityFireFightersSatisfactory"> Satisfactory </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="accessibilityForFireFighters" id="accessibilityFireFightersUnSatisfactory" value="Un-Satisfactory">
                                                                <label for="accessibilityFireFightersUnSatisfactory"> Un-Satisfactory </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Is Boiler Installed & In Use?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="boilerInstalled" id="boilerInstalledYes" value="Yes">
                                                                <label for="boilerInstalledYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="boilerInstalled" id="boilerInstalledNo" value="No">
                                                                <label for="boilerInstalledNo"> No </label>
                                                            </div>
                                                            <div hidden id="boilerDetails">
                                                                <hr>
                                                                <input type="text" class="form-control" id="boilerInstalledInUse" name="boilerInstalledInUse" placeholder="Boiler installed or in use">
                                                                <hr>
                                                                <input type="text" class="form-control" id="boilerMake" name="boilerMake" placeholder="Boiler make">
                                                                <hr>
                                                                <input type="text" class="form-control" id="boilerType" name="boilerType" placeholder="Boiler type">
                                                                <hr>
                                                                <label class="control-label">Boiler Is Heated By?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="boilerHeatedBy" id="gas" value="Gas">
                                                                    <label for="gas"> Gas </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="boilerHeatedBy" id="electricity" value="Electricity">
                                                                    <label for="electricity"> Electricity </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="boilerHeatedBy" id="oil" value="Oil">
                                                                    <label for="oil"> Oil </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="boilerHeatedBy" id="biofuel" value="Bio Fuel">
                                                                    <label for="biofuel"> Bio Fuel </label>
                                                                </div>
                                                                <hr>
                                                                <label class="control-label">Boiler Fitness Certificate Shown/Provided?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="boilerFitnessCertificate" id="shownProvidedYes" value="Yes">
                                                                    <label for="shownProvidedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="boilerFitnessCertificate" id="shownProvidedNo" value="No">
                                                                    <label for="shownProvidedNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Is Generator Installed & In Use?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="generatorInstalled" id="generatorInstalledYes" value="Yes">
                                                                <label for="generatorInstalledYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="generatorInstalled" id="generatorInstalledNo" value="No">
                                                                <label for="generatorInstalledNo"> No </label>
                                                            </div>
                                                            <div hidden id="generatorDetails">
                                                                <hr>
                                                                <input type="text" class="form-control" id="generatorInstalledInUse" name="generatorInstalledInUse" placeholder="Generator installed or in use">
                                                                <hr>
                                                                <input type="text" class="form-control" id="generatorMake" name="generatorMake" placeholder="Generator make">
                                                                <hr>
                                                                <input type="text" class="form-control" id="generatorCapacity" name="generatorCapacity" placeholder="Generator Capacity">
                                                                <hr>
                                                                <input type="text" class="form-control" id="generatorKVA" name="generatorKVA" placeholder="Generator KVA">
                                                                <hr>
                                                                <label class="control-label">Generator Fuel Type?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="generaorFuel" id="diesel" value="Diesel">
                                                                    <label for="diesel"> Diesel </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="generaorFuel" id="petrol" value="Petrol">
                                                                    <label for="petrol"> Petrol </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="generaorFuel" id="generaorgas" value="Gas">
                                                                    <label for="generaorgas"> Gas </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="generaorFuel" id="kerosene" value="Kerosene">
                                                                    <label for="kerosene"> Kerosene </label>
                                                                </div>
                                                                <hr>
                                                                <label class="control-label">Generator Interconnected?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="generatorInterconnected" id="interconnectedYes" value="Yes">
                                                                    <label for="interconnectedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="generatorInterconnected" id="interconnectedNo" value="No">
                                                                    <label for="interconnectedNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Is Transformer Installed?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="transformerInstalled" id="transformerInstalledYes" value="Yes">
                                                                <label for="transformerInstalledYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="transformerInstalled" id="transformerInstalledNo" value="No">
                                                                <label for="transformerInstalledNo"> No </label>
                                                            </div>
                                                            <div hidden id="transformerDetails">
                                                                <hr>
                                                                <input type="text" class="form-control" id="transformerMake" name="transformerMake" placeholder="Transformer make">
                                                                <hr>
                                                                <input type="text" class="form-control" id="transformerCapacity" name="transformerCapacity" placeholder="Transformer Capacity">
                                                                <hr>
                                                                <input type="text" class="form-control" id="transformerKVA" name="transformerKVA" placeholder="Transformer KVA">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Any leakages were found?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="leakagesFound" id="leakagesFoundYes" value="Yes">
                                                                <label for="leakagesFoundYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="leakagesFound" id="leakagesFoundNo" value="No">
                                                                <label for="leakagesFoundNo"> No </label>
                                                            </div>
                                                            <div hidden id="leakagesDetails">
                                                                <hr>
                                                                <input type="text" class="form-control" id="leakagesFoundDetails" name="leakagesFoundDetails" placeholder="Where leakages found?">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr><hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Condition Of Machinery?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="machineryCondition" id="wornout" value="Worn-Out">
                                                                <label for="wornout"> Worn-Out </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="machineryCondition" id="old" value="Old">
                                                                <label for="old"> Old </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="machineryCondition" id="wellmaintained" value="Well Maintained">
                                                                <label for="wellmaintained"> Well Maintained </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="machineryCondition" id="poor" value="Poor">
                                                                <label for="poor"> Poor </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="machineryCondition" id="new" value="New">
                                                                <label for="new"> New </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Is Maintenance Carried Out Regularly?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="maintenanceCarried" id="maintenanceYes" value="Yes">
                                                                <label for="maintenanceYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="maintenanceCarried" id="maintenanceNo" value="No">
                                                                <label for="maintenanceNo"> No </label>
                                                            </div>
                                                            <div hidden id="maintenanceDetails">
                                                                <hr>
                                                                <label class="control-label">Is Yes Which Type?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="maintenanceType" id="correctiveMaintenance" value="Corrective Maintenance">
                                                                    <label for="correctiveMaintenance"> Corrective Maintenance </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="maintenanceType" id="preventiveMaintenance" value="Preventive Maintenance">
                                                                    <label for="preventiveMaintenance"> Preventive Maintenance </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Spark Arrestors Fixed?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="sparkArrestorsFixed" id="sparkArrestorsYes" value="Yes">
                                                                <label for="sparkArrestorsYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="sparkArrestorsFixed" id="sparkArrestorsNo" value="No">
                                                                <label for="sparkArrestorsNo"> No </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Is There Any Labor Union?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="laborUnion" id="laborUnionYes" value="Yes">
                                                                <label for="laborUnionYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="laborUnion" id="laborUnionNo" value="No">
                                                                <label for="laborUnionNo"> No </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Name Of Hazardous Materials</label>
                                                            <input type="text" class="form-control" id="hazardousMaterialName" name="hazardousMaterialName" placeholder="Hazardous materials name">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">No. Of Employees/Labour Work (Day)</label>
                                                            <input type="text" class="form-control" id="noOfEmployeesDay" name="noOfEmployeesDay" placeholder="Number of employess in day">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">No. Of Employees/Labour Work (Night)</label>
                                                            <input type="text" class="form-control" id="noOfEmployeesNight" name="noOfEmployeesNight" placeholder="Number of employess in night">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">No. Of Security Guards on Duty (Day)</label>
                                                            <input type="text" class="form-control" id="noOfSecurityGuardsDay" name="noOfSecurityGuardsDay" placeholder="Number of security guards in day">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">No. Of Security Guards on Duty (Night)</label>
                                                            <input type="text" class="form-control" id="noOfSecurityGuardsNight" name="noOfSecurityGuardsNight" placeholder="Number of security guards in night">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Production Capacity Industry/Mill</label>
                                                            <input type="text" class="form-control" id="productionCapacity" name="productionCapacity" placeholder="Industry/Mill production capacity">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">No. Of CCTV Camera</label>
                                                            <input type="text" class="form-control" id="noOfCCTVCamera" name="noOfCCTVCamera" placeholder="Number of cctv cameras">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Trained Fire Fighters</label>
                                                            <input type="text" class="form-control" id="noOfTrainedFireFighters" name="noOfTrainedFireFighters" placeholder="Number of trained fire fighters">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Capacities Of Motors/Turbines</label>
                                                            <input type="text" class="form-control" id="motorTurbineCapacity" name="motorTurbineCapacity" placeholder="Motor/Turbines capacities">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Hot Work Permit Shown/Provided?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="hotWorkPermit" id="hotWorkPermitYes" value="Yes">
                                                                <label for="hotWorkPermitYes"> Yes </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="hotWorkPermit" id="hotWorkPermitNo" value="No">
                                                                <label for="hotWorkPermitNo"> No </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="headingThree">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion"
                                                       href="#collapseThree" aria-expanded="false"
                                                       aria-controls="collapseThree">
                                                        <span><i style="font-size: 20px;" class="fa fa-building-o"></i></span>&nbsp;Risk Specific
                                                    </a>
                                                </h4></div>
                                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                                                 aria-labelledby="headingThree">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <label class="control-label">Industry Specific</label>
                                                        <select path="industries" id="industries" name="industries" class="form-control" data-placeholder="Choose industry specific" tabindex="1">
                                                            <option value="" disabled selected>Choose industry specific</option>
                                                            <c:forEach items="${AllIndustryTypeSpecific}" var="industry">
                                                                <option value="${industry.value}">${industry.label}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div id="textileGarmentFactory">
                                                        <hr>
                                                        <h3><strong>Specific Information for Textile/Garment Factory/Spinning Mills/Weaving Mills:</strong></h3>
                                                        <hr><hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Separate godowns are provided for raw material & finished goods with perfect partitioning walls?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="partitioningWalls" id="partitioningWallsYes" value="Yes">
                                                                    <label for="partitioningWallsYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="partitioningWalls" id="partitioningWallsNo" value="No">
                                                                    <label for="partitioningWallsNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Double sliding fireproof doors are installed between different sections of the production hall?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="fireproofdoorsInstalled" id="fireproofdoorsInstalledYes" value="Yes">
                                                                    <label for="fireproofdoorsInstalledYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="fireproofdoorsInstalled" id="fireproofdoorsInstalledNo" value="No">
                                                                    <label for="fireproofdoorsInstalledNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Raw cotton in open (if any) is stored at least 30 feet away from any building?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="stored30feetaway" id="stored30feetawayYes" value="Yes">
                                                                    <label for="stored30feetawayYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="stored30feetaway" id="stored30feetawayNo" value="No">
                                                                    <label for="stored30feetawayNo"> No </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="stored30feetaway" id="stored30feetawayNA" value="Not Available">
                                                                    <label for="stored30feetawayNA"> Not Available </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">No stock is stored inside the production area more than day's requirement?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="storedstockproductionarea" id="storedstockproductionareaYes" value="Yes">
                                                                    <label for="storedstockproductionareaYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="storedstockproductionarea" id="storedstockproductionareaNo" value="No">
                                                                    <label for="storedstockproductionareaNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Godowns/warehouses are electrified?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="godownswarehouseselectrified" id="godownswarehouseselectrifiedYes" value="Yes">
                                                                    <label for="godownswarehouseselectrifiedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="godownswarehouseselectrified" id="godownswarehouseselectrifiedNo" value="No">
                                                                    <label for="godownswarehouseselectrifiedNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Separate blow rooms for cotton and or polyester are provided?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="separateblowrooms" id="separateblowroomsYes" value="Yes">
                                                                    <label for="separateblowroomsYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="separateblowrooms" id="separateblowroomsNo" value="No">
                                                                    <label for="separateblowroomsNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Proper cotton dust collection system is operated?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="cottondustcollection" id="cottondustcollectionYes" value="Yes">
                                                                    <label for="cottondustcollectionYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="cottondustcollection" id="cottondustcollectionNo" value="No">
                                                                    <label for="cottondustcollectionNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">No fire-wood/diesel or any fuel is stored within 50 feet of any building or stock?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="stock50feetstored" id="stock50feetstoredYes" value="Yes">
                                                                    <label for="stock50feetstoredYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="stock50feetstored" id="stock50feetstoredNo" value="No">
                                                                    <label for="stock50feetstoredNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Installed spinning mill capacity</label>
                                                                <input type="text" class="form-control" id="installedspinningmills" name="installedspinningmills" placeholder="Spinning mill capacities">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="cottonGinningPressingFactory">
                                                        <hr>
                                                        <h3><strong>Specific Information for Cotton Ginning/Pressing Factory:</strong></h3>
                                                        <hr><hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Phutti or loose cotton is stacked 50 feet away from any building?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="phutticottonstack50feetstored" id="phutticottonstack50feetstoredYes" value="Yes">
                                                                    <label for="phutticottonstack50feetstoredYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="phutticottonstack50feetstored" id="phutticottonstack50feetstoredNo" value="No">
                                                                    <label for="phutticottonstack50feetstoredNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">No stock of loose cotton/phutti is stacked inside process area?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="cottonphuttistacked" id="cottonphuttistackedYes" value="Yes">
                                                                    <label for="cottonphuttistackedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="cottonphuttistacked" id="cottonphuttistackedNo" value="No">
                                                                    <label for="cottonphuttistackedNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">No ore than 2500 FPIB cotton bales are stored in any one godown?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="2500FPIBcottonbalesstrored" id="2500FPIBcottonbalesstroredYes" value="Yes">
                                                                    <label for="2500FPIBcottonbalesstroredYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="2500FPIBcottonbalesstrored" id="2500FPIBcottonbalesstroredNo" value="No">
                                                                    <label for="2500FPIBcottonbalesstroredNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">No ore than 1000 FPIB cotton bales are stored in any one stack?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="1000FPIBcottonbalesstored" id="1000FPIBcottonbalesstoredYes" value="Yes">
                                                                    <label for="1000FPIBcottonbalesstoredYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="1000FPIBcottonbalesstored" id="1000FPIBcottonbalesstoredNo" value="No">
                                                                    <label for="1000FPIBcottonbalesstoredNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Maximum height of each stack does not exceed 6 bales?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="maximumheight6bales" id="maximumheight6balesYes" value="Yes">
                                                                    <label for="maximumheight6balesYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="maximumheight6bales" id="maximumheight6balesNo" value="No">
                                                                    <label for="maximumheight6balesNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Distance between each stack is 15 feet?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="stackdistance15feet" id="stackdistance15feetYes" value="Yes">
                                                                    <label for="stackdistance15feetYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="stackdistance15feet" id="stackdistance15feetNo" value="No">
                                                                    <label for="stackdistance15feetNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Distance between the lots of bales is approximately 75 feet?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="lotsofbaledistance75feet" id="lotsofbaledistance75feetYes" value="Yes">
                                                                    <label for="lotsofbaledistance75feetYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="lotsofbaledistance75feet" id="lotsofbaledistance75feetNo" value="No">
                                                                    <label for="lotsofbaledistance75feetNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Cotton bales are stacked 30 feet away from any building?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="cottonbalesdistance30feet" id="cottonbalesdistance30feetYes" value="Yes">
                                                                    <label for="cottonbalesdistance30feetYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="cottonbalesdistance30feet" id="cottonbalesdistance30feetNo" value="No">
                                                                    <label for="cottonbalesdistance30feetNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Not more than 10,000 FPIB cotton bales are stored in open at single location?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="10000FPIBcottonbalesstored" id="10000FPIBcottonbalesstoredYes" value="Yes">
                                                                    <label for="10000FPIBcottonbalesstoredYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="10000FPIBcottonbalesstored" id="10000FPIBcottonbalesstoredNo" value="No">
                                                                    <label for="10000FPIBcottonbalesstoredNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">No fire-wood/diesel or any fuel is stored within 50 feet of any building or stock?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="stockstored50feet" id="stockstored50feetYes" value="Yes">
                                                                    <label for="stockstored50feetYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="stockstored50feet" id="stockstored50feetNo" value="No">
                                                                    <label for="stockstored50feetNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="oilfeedMills">
                                                        <hr><hr>
                                                        <h3><strong>Specific Information for Oil & Feed Mills:</strong></h3>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Is the risk of spontaneous combustion covered ?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="combustioncovered" id="combustioncoveredYes" value="Yes">
                                                                    <label for="combustioncoveredYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="combustioncovered" id="combustioncoveredNo" value="No">
                                                                    <label for="combustioncoveredNo"> No </label>
                                                                </div>
                                                                <div hidden id="combustioncovereddetails">
                                                                    <div class="col-md-6">
                                                                        <label class="control-label">Perentange of sum insured</label>
                                                                        <input type="text" id="combustionsuminsuredpercent" name="combustionsuminsuredpercent" class="form-control" placeholder="Sum insured percent">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Quantity of silos at factory</label>
                                                                <input type="text" id="noofsilosatfactory" name="noofsilosatfactory" class="form-control" placeholder="No. of silos factory">
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Is the stock of seed stored in open ?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="seedstored" id="seedstoredYes" value="Yes">
                                                                    <label for="seedstoredYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="seedstored" id="seedstoredNo" value="No">
                                                                    <label for="seedstoredNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Distance between the walls of the godown and stocks is 4 feet?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="distancestocks4feet" id="distancestocks4feetYes" value="Yes">
                                                                    <label for="distancestocks4feetYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="distancestocks4feet" id="distancestocks4feetNo" value="No">
                                                                    <label for="distancestocks4feetNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Fire lanes are marked inside the godowns(12 ft between the society)?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="firelanesmarked" id="firelanesmarkedYes" value="Yes">
                                                                    <label for="firelanesmarkedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="firelanesmarked" id="firelanesmarkedNo" value="No">
                                                                    <label for="firelanesmarkedNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Maximum heigth of each stack does not exceed 15 ft?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="stackheight15feet" id="stackheight15feetYes" value="Yes">
                                                                    <label for="stackheight15feetYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="stackheight15feet" id="stackheight15feetNo" value="No">
                                                                    <label for="stackheight15feetNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Not more than 8,000 bags are spaced in each stack?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="8000bagsstacked" id="8000bagsstackedYes" value="Yes">
                                                                    <label for="8000bagsstackedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="8000bagsstacked" id="8000bagsstackedNo" value="No">
                                                                    <label for="8000bagsstackedNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Godowns are properly ventilated?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="godownsventilated" id="godownsventilatedYes" value="Yes">
                                                                    <label for="godownsventilatedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="godownsventilated" id="godownsventilatedNo" value="No">
                                                                    <label for="godownsventilatedNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="cosmeticsChemicalFactoriesLabs">
                                                        <hr><hr>
                                                        <h3><strong>Specific Information for Cosmetics/Chemical Factories/Labs:</strong></h3>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Tick the hazardous chemiclas stored at the facility from the following list?</label>
                                                                <div class="checkbox checkbox-info">
                                                                    <input type="checkbox" name="hazardouschemicalstored" id="alcohol" value="Alcohol">
                                                                    <label for="alcohol"> Alcohol </label>
                                                                </div>
                                                                <div class="checkbox checkbox-info">
                                                                    <input type="checkbox" name="hazardouschemicalstored" id="varnish" value="Varnish">
                                                                    <label for="varnish"> Varnish </label>
                                                                </div>
                                                                <div class="checkbox checkbox-info">
                                                                    <input type="checkbox" name="hazardouschemicalstored" id="lacquer" value="Lacquer">
                                                                    <label for="lacquer"> Lacquer </label>
                                                                </div>
                                                                <div class="checkbox checkbox-info">
                                                                    <input type="checkbox" name="hazardouschemicalstored" id="fragrances" value="Fragrances">
                                                                    <label for="fragrances"> Fragrances </label>
                                                                </div>
                                                                <div class="checkbox checkbox-info">
                                                                    <input type="checkbox" name="hazardouschemicalstored" id="propyleneglycol" value="Propylene Glycol">
                                                                    <label for="propyleneglycol"> Propylene Glycol </label>
                                                                </div>
                                                                <div class="checkbox checkbox-info">
                                                                    <input type="checkbox" name="hazardouschemicalstored" id="ethanol" value="Ethanol">
                                                                    <label for="ethanol"> Ethanol </label>
                                                                </div>
                                                                <div class="checkbox checkbox-info">
                                                                    <input type="checkbox" name="hazardouschemicalstored" id="polyox" value="Polyox">
                                                                    <label for="polyox"> Polyox </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Chemicals are stored in separate air conditioned godowns?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="chemicalseparatestored" id="chemicalseparatestoredYes" value="Yes">
                                                                    <label for="chemicalseparatestoredYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="chemicalseparatestored" id="chemicalseparatestoredNo" value="No">
                                                                    <label for="chemicalseparatestoredNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Chemicals storage is 30 feet away from porduction area?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="chemicalseparatestored30feet" id="chemicalseparatestored30feetYes" value="Yes">
                                                                    <label for="chemicalseparatestored30feetYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="chemicalseparatestored30feet" id="chemicalseparatestored30feetNo" value="No">
                                                                    <label for="chemicalseparatestored30feetNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Quantity of raw material placed in production hall?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="rawmaterialquantity" id="nil" value="Nil">
                                                                    <label for="nil"> Nil </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="rawmaterialquantity" id="oneday" value="Enough for one day">
                                                                    <label for="oneday"> Enough for one day </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="rawmaterialquantity" id="oneweek" value="Enough for one week">
                                                                    <label for="oneweek"> Enough for one week </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="rawmaterialquantity" id="moreoneweek" value="Enough for more than one week">
                                                                    <label for="moreoneweek"> Enough for more than one week </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <label class="control-label">Dry water mist & powder type fire extinguishers are provided to combat A,B,C & D type fires?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="fireextinguishersprovided" id="fireextinguishersprovidedYes" value="Yes">
                                                                    <label for="fireextinguishersprovidedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="fireextinguishersprovided" id="fireextinguishersprovidedNo" value="No">
                                                                    <label for="fireextinguishersprovidedNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="paperBoardMills">
                                                        <hr><hr>
                                                        <h3><strong>Specific Information for Paper/Board Mills:</strong></h3>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Stock of paper is stored on the wooden pallets of 4 inches height?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="paperstock4inchesheight" id="paperstock4inchesheightYes" value="Yes">
                                                                    <label for="paperstock4inchesheightYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="paperstock4inchesheight" id="paperstock4inchesheightNo" value="No">
                                                                    <label for="paperstock4inchesheightNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Stock of paper is stacked 4 ft away from the walls/doors of godowns?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="paperstock4inchesaway" id="paperstock4inchesawayYes" value="Yes">
                                                                    <label for="paperstock4inchesawayYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="paperstock4inchesaway" id="paperstock4inchesawayNo" value="No">
                                                                    <label for="paperstock4inchesawayNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label class="control-label">No stock of paper is stored in open?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="paperstockstoredopen" id="paperstockstoredopenYes" value="Yes">
                                                                    <label for="paperstockstoredopenYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="paperstockstoredopen" id="paperstockstoredopenNo" value="No">
                                                                    <label for="paperstockstoredopenNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label class="control-label">Stacks of paper sheets/rolls are at least 3 ft below the ceiling?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="paperstackefeetbelow" id="paperstackefeetbelowYes" value="Yes">
                                                                    <label for="paperstackefeetbelowYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="paperstackefeetbelow" id="paperstackefeetbelowNo" value="No">
                                                                    <label for="paperstackefeetbelowNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label class="control-label">Godowns/warehouses are electrified?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="papergodownselectrified" id="papergodownselectrifiedYes" value="Yes">
                                                                    <label for="papergodownselectrifiedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="papergodownselectrified" id="papergodownselectrifiedNo" value="No">
                                                                    <label for="papergodownselectrifiedNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div id="livestockfarms">
                                                        <hr><hr>
                                                        <h3><strong>Specific Information for Livestock, Farms:</strong></h3>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">How frequently the animals are vaccinated?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="animalsvaccinated" id="monthly" value="Monthly">
                                                                    <label for="monthly"> Monthly </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="animalsvaccinated" id="quarterly" value="Quarterly">
                                                                    <label for="quarterly"> Quarterly </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="animalsvaccinated" id="semiannually" value="Semiannually">
                                                                    <label for="semiannually"> Semiannually </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="animalsvaccinated" id="annually" value="Annually">
                                                                    <label for="annually"> Annually </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="animalsvaccinated" id="seasonally" value="Seasonally">
                                                                    <label for="seasonally"> Seasonally </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">How often pest control sprays are carried out?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="pestSprayCarriedOut" id="pestmonthly" value="Monthly">
                                                                    <label for="pestmonthly"> Monthly </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="pestSprayCarriedOut" id="pestquarterly" value="Quarterly">
                                                                    <label for="pestquarterly"> Quarterly </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="pestSprayCarriedOut" id="pestsemiannually" value="Semiannually">
                                                                    <label for="pestsemiannually"> Semiannually </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="pestSprayCarriedOut" id="pestannually" value="Annually">
                                                                    <label for="pestannually"> Annually </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="pestSprayCarriedOut" id="pestseasonally" value="Seasonally">
                                                                    <label for="pestseasonally"> Seasonally </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Does the insured has veterinary doctor on risk location round the clock?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="insuredVeterinaryDoctor" id="veterinarydoctorYes" value="Yes">
                                                                    <label for="veterinarydoctorYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="insuredVeterinaryDoctor" id="veterinarydoctorNo" value="No">
                                                                    <label for="veterinarydoctorNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Is there any in-house medical emergency team?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="inhouseMedicalEmergency" id="inhouseMedicalEmergencyYes" value="Yes in-house medical emergency">
                                                                    <label for="inhouseMedicalEmergencyYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="inhouseMedicalEmergency" id="inhouseMedicalEmergencyNo" value="No in-house medical emergency">
                                                                    <label for="inhouseMedicalEmergencyNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">The animals were ear-tagged, Ring tagged, Micro chipped?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="animalsTagged" id="animalsTaggedYes" value="Yes">
                                                                    <label for="animalsTaggedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="animalsTagged" id="animalsTaggedNo" value="No">
                                                                    <label for="animalsTaggedNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Adequate distance is maintained between the animal lanes under the sheds?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="distanceBetweenAnimals" id="distanceBetweenAnimalsYes" value="Yes">
                                                                    <label for="distanceBetweenAnimalsYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="distanceBetweenAnimals" id="distanceBetweenAnimalsNo" value="No">
                                                                    <label for="distanceBetweenAnimalsNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Proper evacuation map for animals is designed to avoid stampede in emergency situation?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="animalsEmergencyEvacuationMap" id="animalsEmergencyEvacuationMapYes" value="Yes">
                                                                    <label for="animalsEmergencyEvacuationMapYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="animalsEmergencyEvacuationMap" id="animalsEmergencyEvacuationMapNo" value="No">
                                                                    <label for="animalsEmergencyEvacuationMapNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Unauthorized entry is strictly prohibited inside the farm?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="unauthorizedEntryInFarm" id="unauthorizedEntryInFarmYes" value="Yes">
                                                                    <label for="unauthorizedEntryInFarmYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="unauthorizedEntryInFarm" id="unauthorizedEntryInFarmNo" value="No">
                                                                    <label for="unauthorizedEntryInFarmNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Does the facility is provided with proper waste management system?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="wasteManagementFacility" id="wasteManagementFacilityYes" value="Yes">
                                                                    <label for="wasteManagementFacilityYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="wasteManagementFacility" id="wasteManagementFacilityNo" value="No">
                                                                    <label for="wasteManagementFacilityNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Animal sheds can resist severe weather?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="severeWeatherResistSheds" id="severeWeatherResistShedsYes" value="Yes">
                                                                    <label for="severeWeatherResistShedsYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="severeWeatherResistSheds" id="severeWeatherResistShedsNo" value="No">
                                                                    <label for="severeWeatherResistShedsNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="headingFour">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion"
                                                       href="#collapseFour" aria-expanded="false"
                                                       aria-controls="collapseFour">
                                                        <span><i style="font-size: 20px;" class="fa  fa-search-plus"></i></span>&nbsp;Findings
                                                    </a>
                                                </h4></div>
                                            <div id="collapseFour" class="panel-collapse collapse" role="tabpanel"
                                                 aria-labelledby="headingFour">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <label for="findings" class="control-label">Observations</label>
                                                            <textarea id="findings" name="findings" placeholder="Findings?" class="form-control"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- All Form Hidden Input Fields Start -->

                                        <input type="hidden" name="rafId" value="${raForms.raFormId}"/>
                                        <input type="hidden" name="hiddeninputriskCost" style="color: #FFFFFF;" value="" id="triskCost"/>
                                        <input type="hidden" name="hiddeninpuriskCode" style="color: #FFFFFF;" value="" id="triskCode"/>
                                        <input type="hidden" name="hiddeninputpolicyNo" style="color: #FFFFFF;" value="" id="tpolicyNo"/>
                                        <input type="hidden" name="hiddeninputcity" style="color: #FFFFFF;" value="" id="tCity"/>
                                        <input type="hidden" name="hiddeninputinsuredName" style="color: #FFFFFF;" value="" id="tinsuredName"/>
                                        <input type="hidden" name="hiddeninputvisitDate" style="color: #FFFFFF;" value="" id="tvisitDate"/>
                                        <input type="hidden" name="hiddeninputriskLocation" style="color: #FFFFFF;" value="" id="triskLocation"/>
                                        <input type="hidden" name="hiddeninputheadOfficeAddress" style="color: #FFFFFF;" value="" id="theadOfficeAddress"/>
                                        <input type="hidden" name="hiddeninputpersonMet" style="color: #FFFFFF;" value="" id="tpersonMet"/>
                                        <input type="hidden" name="hiddeninputinspectedBy" style="color: #FFFFFF;" value="" id="tinspectedBy"/>
                                        <input type="hidden" name="hiddeninputnatureOfBusinessOccupation" style="color: #FFFFFF;" value="" id="tnatureOfBusinessOccupation"/>
                                        <input type="hidden" name="hiddeninputlossHistoryDate" style="color: #FFFFFF;" value="" id="tlossHistoryDate"/>
                                        <input type="hidden" name="hiddeninputlossHistoryAmount" style="color: #FFFFFF;" value="" id="tlossHistoryAmount"/>
                                        <input type="hidden" name="hiddeninputsubjectMatter" style="color: #FFFFFF;" value="" id="tsubjectMatter"/>
                                        <input type="hidden" name="hiddeninputsumInsured" style="color: #FFFFFF;" value="" id="tsumInsured"/>
                                        <input type="hidden" name="hiddeninputpremisesOwnedRented" style="color: #FFFFFF;" value="" id="tpremisesOwnedRented"/>
                                        <input type="hidden" name="hiddeninputmultipleTenancy" style="color: #FFFFFF;" value="" id="tmultipleTenancy"/>
                                        <input type="hidden" name="hiddeninputpremisesSurrounding" style="color: #FFFFFF;" value="" id="tpremisesSurrounding"/>
                                        <input type="hidden" name="hiddeninputfrontDetails" style="color: #FFFFFF;" value="" id="tfrontDetails"/>
                                        <input type="hidden" name="hiddeninputbackDetails" style="color: #FFFFFF;" value="" id="tbackDetails"/>
                                        <input type="hidden" name="hiddeninputleftDetails" style="color: #FFFFFF;" value="" id="tleftDetails"/>
                                        <input type="hidden" name="hiddeninputrightDetails" style="color: #FFFFFF;" value="" id="trightDetails"/>
                                        <input type="hidden" name="hiddeninputyearBuilt" style="color: #FFFFFF;" value="" id="tyearBuilt"/>
                                        <input type="hidden" name="hiddeninputnoOfFloors" style="color: #FFFFFF;" value="" id="tnoOfFloors"/>
                                        <input type="hidden" name="hiddeninputcoveredArea" style="color: #FFFFFF;" value="" id="tcoveredArea"/>
                                        <input type="hidden" name="hiddeninputroofType" style="color: #FFFFFF;" value="" id="troofType"/>
                                        <input type="hidden" name="hiddeninputplinthLevel" style="color: #FFFFFF;" value="" id="tplinthLevel"/>
                                        <input type="hidden" name="hiddeninputfloorCondition" style="color: #FFFFFF;" value="" id="tfloorCondition"/>
                                        <input type="hidden" name="hiddeninputelectricWiring" style="color: #FFFFFF;" value="" id="telectricWiring"/>
                                        <input type="hidden" name="hiddeninputhouseKeeping" style="color: #FFFFFF;" value="" id="thouseKeeping"/>
                                        <input type="hidden" name="hiddeninputcigaretteSmoking" style="color: #FFFFFF;" value="" id="tcigaretteSmoking"/>
                                        <input type="hidden" name="hiddeninputstorageArrangements" style="color: #FFFFFF;" value="" id="tstorageArrangements"/>
                                        <input type="hidden" name="hiddeninputrawMaterialStored" style="color: #FFFFFF;" value="" id="trawMaterialStored"/>
                                        <input type="hidden" name="hiddeninputstoredIn" style="color: #FFFFFF;" value="" id="tstoredIn"/>
                                        <input type="hidden" name="hiddeninputtypeCylinders" style="color: #FFFFFF;" value="" id="ttypeCylinders"/>
                                        <input type="hidden" name="hiddeninputnoofCylinders" style="color: #FFFFFF;" value="" id="tnoofCylinders"/>
                                        <input type="hidden" name="hiddeninputhazardousMaterialStored" style="color: #FFFFFF;" value="" id="thazardousMaterialStored"/>
                                        <input type="hidden" name="hiddeninputnightWork" style="color: #FFFFFF;" value="" id="tnightWork"/>
                                        <input type="hidden" name="hiddeninputwarehousesElectrified" style="color: #FFFFFF;" value="" id="twarehousesElectrified"/>
                                        <input type="hidden" name="hiddeninputsecurityArrangement" style="color: #FFFFFF;" value="" id="tsecurityArrangement"/>
                                        <input type="hidden" name="hiddeninputcctvCameras" style="color: #FFFFFF;" value="" id="tcctvCameras"/>
                                        <input type="hidden" name="hiddeninputnoofcctvCameras" style="color: #FFFFFF;" value="" id="tnoofcctvCameras"/>
                                        <input type="hidden" name="hiddeninputfireFightingTeam" style="color: #FFFFFF;" value="" id="tfireFightingTeam"/>
                                        <input type="hidden" name="hiddeninputfrequencyOfDrill" style="color: #FFFFFF;" value="" id="tfrequencyOfDrill"/>
                                        <input type="hidden" name="hiddeninputfireExitsProvided" style="color: #FFFFFF;" value="" id="tfireExitsProvided"/>
                                        <input type="hidden" name="hiddeninputnoOfFireExtinguishers" style="color: #FFFFFF;" value="" id="tnoOfFireExtinguishers"/>
                                        <input type="hidden" name="hiddeninputnoOfFireBuckets" style="color: #FFFFFF;" value="" id="tnoOfFireBuckets"/>
                                        <input type="hidden" name="hiddeninputhydrantSystem" style="color: #FFFFFF;" value="" id="thydrantSystem"/>
                                        <input type="hidden" name="hiddeninputnoofHydrantPoints" style="color: #FFFFFF;" value="" id="tnoofHydrantPoints"/>
                                        <input type="hidden" name="hiddeninputnoofFireHoses" style="color: #FFFFFF;" value="" id="tnoofFireHoses"/>
                                        <input type="hidden" name="hiddeninputhydrantpumpCapacity" style="color: #FFFFFF;" value="" id="thydrantpumpCapacity"/>
                                        <input type="hidden" name="hiddeninputhydrantPressure" style="color: #FFFFFF;" value="" id="thydrantPressure"/>
                                        <input type="hidden" name="hiddeninputhydrantPumpOperates" style="color: #FFFFFF;" value="" id="thydrantPumpOperates"/>
                                        <input type="hidden" name="hiddeninputelectricitySupply" style="color: #FFFFFF;" value="" id="telectricitySupply"/>
                                        <input type="hidden" name="hiddeninputcapacityUndergroundTank" style="color: #FFFFFF;" value="" id="tcapacityUndergroundTank"/>
                                        <input type="hidden" name="hiddeninputcapacityOverheadTank" style="color: #FFFFFF;" value="" id="tcapacityOverheadTank"/>
                                        <input type="hidden" name="hiddeninputsourcesOfWaterSupply" style="color: #FFFFFF;" value="" id="tsourcesOfWaterSupply"/>
                                        <input type="hidden" name="hiddeninputfireAlarmInstalled" style="color: #FFFFFF;" value="" id="tfireAlarmInstalled"/>
                                        <input type="hidden" name="hiddeninputsprinklerSystemInstalled" style="color: #FFFFFF;" value="" id="tsprinklerSystemInstalled"/>
                                        <input type="hidden" name="hiddeninputsmokeDetectorsInstalled" style="color: #FFFFFF;" value="" id="tsmokeDetectorsInstalled"/>
                                        <input type="hidden" name="hiddeninputnearestHospital" style="color: #FFFFFF;" value="" id="tnearestHospital"/>
                                        <input type="hidden" name="hiddeninputresponseTimeHospital" style="color: #FFFFFF;" value="" id="tresponseTimeHospital"/>
                                        <input type="hidden" name="hiddeninputnearestPoliceStation" style="color: #FFFFFF;" value="" id="tnearestPoliceStation"/>
                                        <input type="hidden" name="hiddeninputresponseTimePoliceStation" style="color: #FFFFFF;" value="" id="tresponseTimePoliceStation"/>
                                        <input type="hidden" name="hiddeninputnearestFireStation" style="color: #FFFFFF;" value="" id="tnearestFireStation"/>
                                        <input type="hidden" name="hiddeninputresponseTimeFireStation" style="color: #FFFFFF;" value="" id="tresponseTimeFireStation"/>
                                        <input type="hidden" name="hiddeninputaccessibilityForFireFighters" style="color: #FFFFFF;" value="" id="taccessibilityForFireFighters"/>
                                        <input type="hidden" name="hiddeninputboilerInstalled" style="color: #FFFFFF;" value="" id="tboilerInstalled"/>
                                        <input type="hidden" name="hiddeninputboilerInstalledInUse" style="color: #FFFFFF;" value="" id="tboilerInstalledInUse"/>
                                        <input type="hidden" name="hiddeninputboilerMake" style="color: #FFFFFF;" value="" id="tboilerMake"/>
                                        <input type="hidden" name="hiddeninputboilerType" style="color: #FFFFFF;" value="" id="tboilerType"/>
                                        <input type="hidden" name="hiddeninputboilerHeatedBy" style="color: #FFFFFF;" value="" id="tboilerHeatedBy"/>
                                        <input type="hidden" name="hiddeninputboilerFitnessCertificate" style="color: #FFFFFF;" value="" id="tboilerFitnessCertificate"/>
                                        <input type="hidden" name="hiddeninputgeneratorInstalled" style="color: #FFFFFF;" value="" id="tgeneratorInstalled"/>
                                        <input type="hidden" name="hiddeninputgeneratorInstalledInUse" style="color: #FFFFFF;" value="" id="tgeneratorInstalledInUse"/>
                                        <input type="hidden" name="hiddeninputgeneratorMake" style="color: #FFFFFF;" value="" id="tgeneratorMake"/>
                                        <input type="hidden" name="hiddeninputgeneratorCapacity" style="color: #FFFFFF;" value="" id="tgeneratorCapacity"/>
                                        <input type="hidden" name="hiddeninputgeneratorKVA" style="color: #FFFFFF;" value="" id="tgeneratorKVA"/>
                                        <input type="hidden" name="hiddeninputgeneraorFuel" style="color: #FFFFFF;" value="" id="tgeneraorFuel"/>
                                        <input type="hidden" name="hiddeninputgeneratorInterconnected" style="color: #FFFFFF;" value="" id="tgeneratorInterconnected"/>
                                        <input type="hidden" name="hiddeninputtransformerInstalled" style="color: #FFFFFF;" value="" id="ttransformerInstalled"/>
                                        <input type="hidden" name="hiddeninputtransformerMake" style="color: #FFFFFF;" value="" id="ttransformerMake"/>
                                        <input type="hidden" name="hiddeninputtransformerCapacity" style="color: #FFFFFF;" value="" id="ttransformerCapacity"/>
                                        <input type="hidden" name="hiddeninputtransformerKVA" style="color: #FFFFFF;" value="" id="ttransformerKVA"/>
                                        <input type="hidden" name="hiddeninputleakagesFound" style="color: #FFFFFF;" value="" id="tleakagesFound"/>
                                        <input type="hidden" name="hiddeninputleakagesFoundDetails" style="color: #FFFFFF;" value="" id="tleakagesFoundDetails"/>
                                        <input type="hidden" name="hiddeninputmachineryCondition" style="color: #FFFFFF;" value="" id="tmachineryCondition"/>
                                        <input type="hidden" name="hiddeninputmaintenanceCarried" style="color: #FFFFFF;" value="" id="tmaintenanceCarried"/>
                                        <input type="hidden" name="hiddeninputsparkArrestorsFixed" style="color: #FFFFFF;" value="" id="tsparkArrestorsFixed"/>
                                        <input type="hidden" name="hiddeninputsecurityGuardsDuty" style="color: #FFFFFF;" value="" id="tsecurityGuardsDuty"/>
                                        <input type="hidden" name="hiddeninputnoOfFireFighters" style="color: #FFFFFF;" value="" id="tnoOfFireFighters"/>
                                        <input type="hidden" name="hiddeninputmaintenanceType" style="color: #FFFFFF;" value="" id="tmaintenanceType"/>
                                        <input type="hidden" name="hiddeninputlaborUnion" style="color: #FFFFFF;" value="" id="tlaborUnion"/>
                                        <input type="hidden" name="hiddeninputhazardousMaterialName" style="color: #FFFFFF;" value="" id="thazardousMaterialName"/>
                                        <input type="hidden" name="hiddeninputnoOfEmployeesDay" style="color: #FFFFFF;" value="" id="tnoOfEmployeesDay"/>
                                        <input type="hidden" name="hiddeninputnoOfEmployeesNight" style="color: #FFFFFF;" value="" id="tnoOfEmployeesNight"/>
                                        <input type="hidden" name="hiddeninputnoOfSecurityGuardsDay" style="color: #FFFFFF;" value="" id="tnoOfSecurityGuardsDay"/>
                                        <input type="hidden" name="hiddeninputnoOfSecurityGuardsNight" style="color: #FFFFFF;" value="" id="tnoOfSecurityGuardsNight"/>
                                        <input type="hidden" name="hiddeninputproductionCapacity" style="color: #FFFFFF;" value="" id="tproductionCapacity"/>
                                        <input type="hidden" name="hiddeninputnoOfCCTVCamera" style="color: #FFFFFF;" value="" id="tnoOfCCTVCamera"/>
                                        <input type="hidden" name="hiddeninputnoOfTrainedFireFighters" style="color: #FFFFFF;" value="" id="tnoOfTrainedFireFighters"/>
                                        <input type="hidden" name="hiddeninputmotorTurbineCapacity" style="color: #FFFFFF;" value="" id="tmotorTurbineCapacity"/>
                                        <input type="hidden" name="hiddeninputhotWorkPermit" style="color: #FFFFFF;" value="" id="thotWorkPermit"/>
                                        <input type="hidden" name="hiddeninputindustries" style="color: #FFFFFF;" value="" id="tindustries"/>
                                        <input type="hidden" name="hiddeninputpartitioningWalls" style="color: #FFFFFF;" value="" id="tpartitioningWalls"/>
                                        <input type="hidden" name="hiddeninputfireproofdoorsInstalled" style="color: #FFFFFF;" value="" id="tfireproofdoorsInstalled"/>
                                        <input type="hidden" name="hiddeninputstored30feetaway" style="color: #FFFFFF;" value="" id="tstored30feetaway"/>
                                        <input type="hidden" name="hiddeninputstoredstockproductionarea" style="color: #FFFFFF;" value="" id="tstoredstockproductionarea"/>
                                        <input type="hidden" name="hiddeninputgodownswarehouseselectrified" style="color: #FFFFFF;" value="" id="tgodownswarehouseselectrified"/>
                                        <input type="hidden" name="hiddeninputseparateblowrooms" style="color: #FFFFFF;" value="" id="tseparateblowrooms"/>
                                        <input type="hidden" name="hiddeninputcottondustcollection" style="color: #FFFFFF;" value="" id="tcottondustcollection"/>
                                        <input type="hidden" name="hiddeninputstock50feetstored" style="color: #FFFFFF;" value="" id="tstock50feetstored"/>
                                        <input type="hidden" name="hiddeninputinstalledspinningmills" style="color: #FFFFFF;" value="" id="tinstalledspinningmills"/>
                                        <input type="hidden" name="hiddeninputphutticottonstack50feetstored" style="color: #FFFFFF;" value="" id="tphutticottonstack50feetstored"/>
                                        <input type="hidden" name="hiddeninputcottonphuttistacked" style="color: #FFFFFF;" value="" id="tcottonphuttistacked"/>
                                        <input type="hidden" name="hiddeninput2500FPIBcottonbalesstrored" style="color: #FFFFFF;" value="" id="t2500FPIBcottonbalesstrored"/>
                                        <input type="hidden" name="hiddeninput1000FPIBcottonbalesstored" style="color: #FFFFFF;" value="" id="t1000FPIBcottonbalesstored"/>
                                        <input type="hidden" name="hiddeninputmaximumheight6bales" style="color: #FFFFFF;" value="" id="tmaximumheight6bales"/>
                                        <input type="hidden" name="hiddeninputstackdistance15feet" style="color: #FFFFFF;" value="" id="tstackdistance15feet"/>
                                        <input type="hidden" name="hiddeninputlotsofbaledistance75feet" style="color: #FFFFFF;" value="" id="tlotsofbaledistance75feet"/>
                                        <input type="hidden" name="hiddeninputcottonbalesdistance30feet" style="color: #FFFFFF;" value="" id="tcottonbalesdistance30feet"/>
                                        <input type="hidden" name="hiddeninput10000FPIBcottonbalesstored" style="color: #FFFFFF;" value="" id="t10000FPIBcottonbalesstored"/>
                                        <input type="hidden" name="hiddeninputstockstored50feet" style="color: #FFFFFF;" value="" id="tstockstored50feet"/>
                                        <input type="hidden" name="hiddeninputcombustioncovered" style="color: #FFFFFF;" value="" id="tcombustioncovered"/>
                                        <input type="hidden" name="hiddeninputcombustionsuminsuredpercent" style="color: #FFFFFF;" value="" id="tcombustionsuminsuredpercent"/>
                                        <input type="hidden" name="hiddeninputnoofsilosatfactory" style="color: #FFFFFF;" value="" id="tnoofsilosatfactory"/>
                                        <input type="hidden" name="hiddeninputseedstored" style="color: #FFFFFF;" value="" id="tseedstored"/>
                                        <input type="hidden" name="hiddeninputdistancestocks4feet" style="color: #FFFFFF;" value="" id="tdistancestocks4feet"/>
                                        <input type="hidden" name="hiddeninputfirelanesmarked" style="color: #FFFFFF;" value="" id="tfirelanesmarked"/>
                                        <input type="hidden" name="hiddeninputstackheight15feet" style="color: #FFFFFF;" value="" id="tstackheight15feet"/>
                                        <input type="hidden" name="hiddeninput8000bagsstacked" style="color: #FFFFFF;" value="" id="t8000bagsstacked"/>
                                        <input type="hidden" name="hiddeninputgodownsventilated" style="color: #FFFFFF;" value="" id="tgodownsventilated"/>
                                        <input type="hidden" name="hiddeninputhazardouschemicalstored" style="color: #FFFFFF;" value="" id="thazardouschemicalstored"/>
                                        <input type="hidden" name="hiddeninputchemicalseparatestored" style="color: #FFFFFF;" value="" id="tchemicalseparatestored"/>
                                        <input type="hidden" name="hiddeninputchemicalseparatestored30feet" style="color: #FFFFFF;" value="" id="tchemicalseparatestored30feet"/>
                                        <input type="hidden" name="hiddeninputrawmaterialquantity" style="color: #FFFFFF;" value="" id="trawmaterialquantity"/>
                                        <input type="hidden" name="hiddeninputfireextinguishersprovided" style="color: #FFFFFF;" value="" id="tfireextinguishersprovided"/>
                                        <input type="hidden" name="hiddeninputpaperstock4inchesheight" style="color: #FFFFFF;" value="" id="tpaperstock4inchesheight"/>
                                        <input type="hidden" name="hiddeninputpaperstock4inchesaway" style="color: #FFFFFF;" value="" id="tpaperstock4inchesaway"/>
                                        <input type="hidden" name="hiddeninputpaperstockstoredopen" style="color: #FFFFFF;" value="" id="tpaperstockstoredopen"/>
                                        <input type="hidden" name="hiddeninputpaperstackefeetbelow" style="color: #FFFFFF;" value="" id="tpaperstackefeetbelow"/>
                                        <input type="hidden" name="hiddeninputpapergodownselectrified" style="color: #FFFFFF;" value="" id="tpapergodownselectrified"/>
                                        <input type="hidden" name="hiddeninputanimalsvaccinated" style="color: #FFFFFF;" value="" id="tanimalsvaccinated"/>
                                        <input type="hidden" name="hiddeninputpestSprayCarriedOut" style="color: #FFFFFF;" value="" id="tpestSprayCarriedOut"/>
                                        <input type="hidden" name="hiddeninputinsuredVeterinaryDoctor" style="color: #FFFFFF;" value="" id="tinsuredVeterinaryDoctor"/>
                                        <input type="hidden" name="hiddeninputinhouseMedicalEmergency" style="color: #FFFFFF;" value="" id="tinhouseMedicalEmergency"/>
                                        <input type="hidden" name="hiddeninputanimalsTagged" style="color: #FFFFFF;" value="" id="tanimalsTagged"/>
                                        <input type="hidden" name="hiddeninputdistanceBetweenAnimals" style="color: #FFFFFF;" value="" id="tdistanceBetweenAnimals"/>
                                        <input type="hidden" name="hiddeninputanimalsEmergencyEvacuationMap" style="color: #FFFFFF;" value="" id="tanimalsEmergencyEvacuationMap"/>
                                        <input type="hidden" name="hiddeninputunauthorizedEntryInFarm" style="color: #FFFFFF;" value="" id="tunauthorizedEntryInFarm"/>
                                        <input type="hidden" name="hiddeninputwasteManagementFacility" style="color: #FFFFFF;" value="" id="twasteManagementFacility"/>
                                        <input type="hidden" name="hiddeninputsevereWeatherResistSheds" style="color: #FFFFFF;" value="" id="tsevereWeatherResistSheds"/>
                                        <input type="hidden" name="hiddeninputFindings" style="color: #FFFFFF;" value="" id="tFindings"/>

                                        <!-- All Form Hidden Input Fields End -->
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- /.row -->
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
<%@ include file="/WEB-INF/views/template/footerSurveyor.jsp" %>

<script type="text/javascript">

    $(function(){
        // Submit the form
        $("a.wizard-finish").attr("href", "javascript:document.getElementById('validation').submit()");

        $(".above500mDetails").hide();
        $(".below500mDetails").hide();
        $("#frontSurrondings").hide();
        $("#backSurrondings").hide();
        $("#leftSurrondings").hide();
        $("#rightSurrondings").hide();

        /* Industry dropdown values bases divs hide/show */
        $("#textileGarmentFactory").hide();
        $("#cottonGinningPressingFactory").hide();
        $("#oilfeedMills").hide();
        $("#cosmeticsChemicalFactoriesLabs").hide();
        $("#paperBoardMills").hide();
        $("#livestockfarms").hide();

    })

    /* Hide/Show surrondings details on checkbox check/uncheck */
    $(function(){

        /* front surronding */
        $("#front").click(function() {
            if($(this).is(":checked")) {
                $("#frontSurrondings").show();

                /*on check holding values*/
                $("#tfrontDetails").val($("#frontDetails").val());
            }
            else if(!$("#front").is(":checked")){
                document.getElementById("tfrontDetails").value = "";
                $("#frontSurrondings").hide();
            }
        });

        /* back surronding */
        $("#back").click(function() {
            if($(this).is(":checked")) {
                $("#backSurrondings").show();

                /*on check holding values*/
                $("#tbackDetails").val($("#backDetails").val());
            }
            else if(!$("#back").is(":checked")){
                document.getElementById("tbackDetails").value = "";
                $("#backSurrondings").hide();
            }
        });

        /* left surronding */
        $("#left").click(function() {
            if($(this).is(":checked")) {
                $("#leftSurrondings").show();

                /*on check holding values*/
                $("#tleftDetails").val($("#leftDetails").val());
            }
            else if(!$("#left").is(":checked")){
                document.getElementById("tleftDetails").value = "";
                $("#leftSurrondings").hide();
            }
        });

        /* right surronding */
        $("#right").click(function() {
            if($(this).is(":checked")) {
                $("#rightSurrondings").show();

                /*on check holding values*/
                $("#trightDetails").val($("#rightDetails").val());
            }
            else if(!$("#right").is(":checked")){
                document.getElementById("trightDetails").value = "";
                $("#rightSurrondings").hide();
            }
        });

        if($("#front").is(":checked") || $("#back").is(":checked") || $("#left").is(":checked") || $("#right").is(":checked")){
            $("#tfrontDetails").val($("#frontDetails").val());
            $("#tbackDetails").val($("#backDetails").val());
            $("#tleftDetails").val($("#leftDetails").val());
            $("#trightDetails").val($("#rightDetails").val());
        }
    })

    $(function() {
        $('input[name=riskCost]').on('click init-riskCost', function() {
            $('.below500mDetails').toggle($('#below500m').prop('checked'));
        }).trigger('init-riskCost');
    })

    $(function() {
        $('input[name=riskCost]').on('click init-riskCost', function() {
            $('.above500mDetails').toggle($('#above500m').prop('checked'));
        }).trigger('init-riskCost');
    })

    $(function() {
        $('input[name=typeCylinders]').on('click init-typeCylinders', function() {
            $('#typeofCylinders').toggle($('#typeYes').prop('checked'));
        }).trigger('init-typeCylinders');
    })


    $(function() {
        $('input[name=cctvCameras]').on('click init-cctvCameras', function() {
            $('#cameras').toggle($('#cctvYes').prop('checked'));
        }).trigger('init-cctvCameras');
    })

    $(function() {
        $('input[name=hydrantSystem]').on('click init-hydrantSystem', function() {
            $('#hydrantSystem').toggle($('#hydrantSystemYes').prop('checked'));
        }).trigger('init-hydrantSystem');
    })

    $(function() {
        $('input[name=boilerInstalled]').on('click init-boilerInstalled', function() {
            $('#boilerDetails').toggle($('#boilerInstalledYes').prop('checked'));
        }).trigger('init-boilerInstalled');
    })

    $(function() {
        $('input[name=generatorInstalled]').on('click init-generatorInstalled', function() {
            $('#generatorDetails').toggle($('#generatorInstalledYes').prop('checked'));
        }).trigger('init-generatorInstalled');
    })

    $(function() {
        $('input[name=transformerInstalled]').on('click init-transformerInstalled', function() {
            $('#transformerDetails').toggle($('#transformerInstalledYes').prop('checked'));
        }).trigger('init-transformerInstalled');
    })

    $(function() {
        $('input[name=leakagesFound]').on('click init-leakagesFound', function() {
            $('#leakagesDetails').toggle($('#leakagesFoundYes').prop('checked'));
        }).trigger('init-leakagesFound');
    })

    $(function() {
        $('input[name=maintenanceCarried]').on('click init-maintenanceCarried', function() {
            $('#maintenanceDetails').toggle($('#maintenanceYes').prop('checked'));
        }).trigger('init-maintenanceCarried');
    })

    $("#industries").change(function () {
        if ($("#industries").val() == 'Specific Information for Textile/Garment Factory/Spinning Mills/Weaving Mills') {
            $("#textileGarmentFactory").show();
            $("#cottonGinningPressingFactory").hide();
            $("#oilfeedMills").hide();
            $("#cosmeticsChemicalFactoriesLabs").hide();
            $("#paperBoardMills").hide();
            $("#livestockfarms").hide();
        }
        else if ($("#industries").val() == 'Specific Information for Cotton Factory/Cotton Ginning/Pressing Factory') {
            $("#textileGarmentFactory").hide();
            $("#cottonGinningPressingFactory").show();
            $("#oilfeedMills").hide();
            $("#cosmeticsChemicalFactoriesLabs").hide();
            $("#paperBoardMills").hide();
            $("#livestockfarms").hide();
        }
        else if ($("#industries").val() == 'Specific Information for Oil & Feed Mills') {
            $("#textileGarmentFactory").hide();
            $("#cottonGinningPressingFactory").hide();
            $("#oilfeedMills").show();
            $("#cosmeticsChemicalFactoriesLabs").hide();
            $("#paperBoardMills").hide();
            $("#livestockfarms").hide();
        }
        else if ($("#industries").val() == 'Specific Information for Cosmetics/Chemical Factories/Labs') {
            $("#textileGarmentFactory").hide();
            $("#cottonGinningPressingFactory").hide();
            $("#oilfeedMills").hide();
            $("#cosmeticsChemicalFactoriesLabs").show();
            $("#paperBoardMills").hide();
            $("#livestockfarms").hide();
        }

        else if ($("#industries").val() == 'Specific Information for Paper or Board Mills') {
            $("#textileGarmentFactory").hide();
            $("#cottonGinningPressingFactory").hide();
            $("#oilfeedMills").hide();
            $("#cosmeticsChemicalFactoriesLabs").hide();
            $("#paperBoardMills").show();
            $("#livestockfarms").hide();
        }

        else if ($("#industries").val() == 'Specific Information for Livestock, Farms') {
            $("#textileGarmentFactory").hide();
            $("#cottonGinningPressingFactory").hide();
            $("#oilfeedMills").hide();
            $("#cosmeticsChemicalFactoriesLabs").hide();
            $("#paperBoardMills").hide();
            $("#livestockfarms").show();
        }

    });

    /* Combustion covered details hide/show */
    $(function() {
        $('input[name=combustioncovered]').on('click init-combustioncovered', function() {
            $('#combustioncovereddetails').toggle($('#combustioncoveredYes').prop('checked'));
        }).trigger('init-combustioncovered');
    })

    /* In summary view on edit button click specific wizard tab will open */
    $(".accordianbutton1").on("click",function(){
        $("li#litab1>a").click();
    });

    $(".accordianbutton2").on("click",function(){
        $("li#litab2>a").click();
    });

    $("#riskSpecific1").on("click",function(){
        $("li#litab3>a").click();
    });

    /* CCTV Cameras details hide/show */
    $(function() {
        /* Hide/Show CCTV Cameras on risk costing */
        $("input[name='riskCost']").click(function() {
            if ($("#above").is(":checked") && $("#cctvYes") == 'Yes' ) {
                $("#cameras").show();
            } else if ($("#cctvNo").is(":checked")) {
                $("#cameras").hide();
            }
        });
    })

</script>
</body>
