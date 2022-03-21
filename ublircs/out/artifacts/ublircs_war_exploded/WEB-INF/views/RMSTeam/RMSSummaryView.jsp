<%--
  Created by IntelliJ IDEA.
  User: Haider Iqbal
  Date: 12/29/2020
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="date" class="java.util.Date" />
<%@ include file="/WEB-INF/views/template/riskEvaluationHeader.jsp" %>
<!-- Editable CSS -->
<link rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/jquery-datatables-editable/datatables.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/gallery/css/animated-masonry-gallery.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/fancybox/ekko-lightbox.min.css"/>"/>
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
                    <h4 class="page-title">Summary View</h4> </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <button class="right-side-toggle waves-effect waves-light btn-info btn-circle pull-right m-l-20"><i class="ti-settings text-white"></i></button>
                    <ol class="breadcrumb">
                        <li><a href="#">RMS Team</a></li>
                        <li><a href="#">Summary</a></li>
                        <li class="active">Summary View</li>
                    </ol>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- .row -->
            <div class="row">
                <div class="col-sm-12">
                    <%--<h4 class="box-title m-b-0 m-t-40">Summary</h4>
                    <br>--%>
                    <div class="panel-group wiz-aco" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-checked="true" aria-controls="collapseOne">
                                        <span><i style="font-size: 20px;" class="fa fa-bitcoin"></i></span>&nbsp;Risk Cost
                                    </a>
                                </h4> </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">
                                    <c:if test="${raForms.riskCost.equals('Below 500 million')}">
                                        <strong style="color:white">
                                            Industrial/General Risks (Below 500m)
                                        </strong>
                                    </c:if>
                                    <c:if test="${raForms.riskCost.equals('Above 500 million')}">
                                        <strong style="color:white">
                                            Industrial/General Risks (Above 500m)
                                        </strong>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                        <span><i style="font-size: 20px;" class="fa fa-cogs"></i></span>&nbsp;Industrial/General Risks
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
                                </h4> </div>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"  aria-labelledby="headingTwo">
                                <div class="panel-body">
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
                                            <labelclass="control-label">Head Office Address:</label>&nbsp;<strong style="color: white">${raForms.headOfficeAddress}</strong>
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
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Want Waiver?</label>&nbsp;<strong style="color: white">${raForms.waiver}</strong>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Branches</label>&nbsp;<strong style="color: white">${raForms.branches.branchName}</strong>
                                        </div>
                                    </div>
                                    <c:if test="${raForms.waiver.equals('No waive')}">
                                        <hr><hr>
                                        <h3><strong>General Information:</strong></h3>
                                        <hr><hr>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label class="control-label">Is the premises owned or rented? </label>&nbsp;<strong style="color: white">${raForms.premisesOwnedRented}</strong>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label">Does the premises has multiple tenancy? </label>&nbsp;<strong style="color: white">${raForms.multipleTenancy}</strong>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label">Surrondings of the premises? </label>&nbsp;<strong style="color: white">${raForms.premisesSurrounding}</strong>
                                                <br>
                                                <c:if test="${raForms.frontSurrondingsDetails != ''  }">
                                                    <label class="control-label">Front Details: </label>&nbsp;<strong style="color: white">${raForms.frontSurrondingsDetails}</strong>
                                                </c:if>
                                                <br><c:if test="${raForms.backSurrondingsDetails != ''  }">
                                                <label class="control-label">Back Details: </label>&nbsp;<strong style="color: white">${raForms.backSurrondingsDetails}</strong>
                                                </c:if>
                                                <br><c:if test="${raForms.leftSurrondingsDetails != ''  }">
                                                <label class="control-label">Left Details: </label>&nbsp;<strong style="color: white">${raForms.leftSurrondingsDetails}</strong>
                                                </c:if>
                                                <br><c:if test="${raForms.rightSurrondingsDetails != ''  }">
                                                <label class="control-label">Right Details: </label>&nbsp;<strong style="color: white">${raForms.rightSurrondingsDetails}</strong>
                                                </c:if>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label class="control-label">Year Built: </label>&nbsp;<strong style="color: white">${raForms.yearBuilt}</strong>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="col-md-6">
                                                    <label class="control-label">No. Of Floors: </label>&nbsp;<strong style="color: white">${raForms.noOfFloors}</strong>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label">Covered Area: </label>&nbsp;<strong style="color: white">${raForms.coveredArea}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label class="control-label">Roof? </label>&nbsp;<strong style="color: white">${raForms.roofType}</strong>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label">Plinth Level? </label>&nbsp;<strong style="color: white">${raForms.plinthLevel}</strong>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label">Floor Condition? </label>&nbsp;<strong style="color: white">${raForms.floorCondition}</strong>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label">Electricity Wiring? </label>&nbsp;<strong style="color: white">${raForms.electricityWiring}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label class="control-label">House keeping? </label>&nbsp;<strong style="color: white">${raForms.houseKeeping}</strong>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label">Cigarette Smoking? </label>&nbsp;<strong style="color: white">${raForms.cigaretteSmoking}</strong>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label">Storage Arrangements? </label>&nbsp;<strong style="color: white">${raForms.storageArrangements}</strong>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label">Raw Material Stored? </label>&nbsp;<strong style="color: white">${raForms.rawMaterialStored}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Stored? </label>&nbsp;<strong style="color: white">${raForms.storedIn}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Any type of cyliders(Gas/Kerosene)? </label>&nbsp;<strong style="color: white">${raForms.typeCylinders}</strong><br>
                                                <c:if test="${raForms.typeCylinders.equals('Yes')}">
                                                    <label class="control-label">No. of cylinders</label>&nbsp;<strong style="color: white">${raForms.noofCylinders}</strong>
                                                </c:if>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label class="control-label">Is hazardous material stored separately? </label>&nbsp;<strong style="color: white">${raForms.hazardousMaterialStored}</strong>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label">If night work carries out? </label>&nbsp;<strong style="color: white">${raForms.nightWork}</strong>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label">Godowns/Warehouses are electrified? </label>&nbsp;<strong style="color: white">${raForms.warehousesElectrified}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Security Arrangement? </label>&nbsp;<strong style="color: white">${raForms.securityArrangement}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">CCTV Cameras? </label>&nbsp;${raForms.cctvCameras}<br>
                                                <c:if test="${raForms.riskCost.equals('Above 500 million') && raForms.cctvCameras.equals('Yes')}">
                                                    <label class="control-label">No. of CCTV cameras</label>&nbsp;<strong style="color: white">${raForms.noofcctvCameras}</strong>
                                                </c:if>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label class="control-label">Fire Fighting Team? </label>&nbsp;<strong style="color: white">${raForms.fireFightingTeam}</strong>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label">Frequency Of Drill: </label>&nbsp;<strong style="color: white">${raForms.frequencyOfDrill}</strong>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label">Fire Exits Provided? </label>&nbsp;<strong style="color: white">${raForms.fireExitsProvided}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">No. Of Fire Extinguishers Installed: </label>&nbsp;<strong style="color: white">${raForms.noOfFireExtinguishers}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">No. Of Fire Buckets (Water/Sand): </label>&nbsp;<strong style="color: white">${raForms.noOfFireBuckets}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Hydrant System Installed? </label>&nbsp;<strong style="color: white">${raForms.hydrantSystem}</strong><br>
                                                <c:if test="${raForms.hydrantSystem.equals('Yes')}">
                                                    <label class="control-label">No. of hydrant points: </label>&nbsp;<strong style="color: white">${raForms.noofHydrantPoints}</strong><br>
                                                    <label class="control-label">No. of fire hoses: </label>&nbsp;<strong style="color: white">${raForms.noofFireHoses}</strong><br>
                                                    <label class="control-label">Hydrant pump capacity: </label>&nbsp;<strong style="color: white">${raForms.hydrantpumpCapacity}</strong><br>
                                                    <label class="control-label">Hydrant pressure: </label>&nbsp;<strong style="color: white">${raForms.hydrantSystem}</strong>
                                                </c:if>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Hydrant pump stiil operates after electricity shuts? </label>&nbsp;<strong style="color: white">${raForms.hydrantPumpOperates}</strong>
                                            </div>

                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label class="control-label">Sources Of Electricity Supply? </label>&nbsp;<strong style="color: white">${raForms.electricitySupply}</strong>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label">Capacity Of Underground Tank(s): </label>&nbsp;<strong style="color: white">${raForms.capacityUndergroundTank}</strong>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label">Capacity Of Overhead Tank(s): </label>&nbsp;<strong style="color: white">${raForms.capacityOverheadTank}</strong>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label">Sources Of Water Supply? </label>&nbsp;<strong style="color: white">${raForms.sourcesOfWaterSupply}</strong>
                                            </div>

                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label class="control-label">Fire Alarm Installed? </label>&nbsp;<strong style="color: white">${raForms.fireAlarmInstalled}</strong>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label">Sprinkler System Installed? </label>&nbsp;<strong style="color: white">${raForms.sprinklerSystemInstalled}</strong>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label">Smoke Detectors Installed? </label>&nbsp;<strong style="color: white">${raForms.smokeDetectorsInstalled}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Nearest hospital:</label>&nbsp;<strong style="color: white">${raForms.nearestHospital}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Response Time (Hospital): </label>&nbsp;<strong style="color: white">${raForms.responseTimeHospital}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Nearest Police Station: </label>&nbsp;<strong style="color: white">${raForms.nearestPoliceStation}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Response Time (Police Station): </label>&nbsp;<strong style="color: white">${raForms.responseTimePoliceStation}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Nearest Fire Station: </label>&nbsp;<strong style="color: white">${raForms.nearestFireStation}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Response Time (Fire Station): </label>&nbsp;<strong style="color: white">${raForms.responseTimeFireStation}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Accessibility For Fire Fighters? </label>&nbsp;<strong style="color: white">${raForms.accessibilityForFireFighters}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Is Boiler Installed & In Use? </label>&nbsp;<strong style="color: white">${raForms.boilerInstalled}</strong><br>
                                                <c:if test="${raForms.boilerInstalled.equals('Yes')}">
                                                    <label class="control-label">Boiler installed or in use: </label>&nbsp;<strong style="color: white">${raForms.boilerInstalledInUse}</strong><br>
                                                    <label class="control-label">Boiler make: </label>&nbsp;<strong style="color: white">${raForms.boilerMake}</strong><br>
                                                    <label class="control-label">Boiler type: </label>&nbsp;<strong style="color: white">${raForms.boilerType}</strong><br>
                                                    <label class="control-label">Boiler Is Heated By? </label>&nbsp;<strong style="color: white">${raForms.boilerHeatedBy}</strong><br>
                                                    <label class="control-label">Boiler Fitness Certificate Shown/Provided? </label>&nbsp;<strong style="color: white">${raForms.boilerFitnessCertificate}</strong>
                                                </c:if>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Is Generator Installed & In Use? </label>&nbsp;<strong style="color: white">${raForms.generatorInstalled}</strong><br>
                                                <c:if test="${raForms.generatorInstalled.equals('Yes')}">
                                                    <label class="control-label">Generator installed or in use: </label>&nbsp;<strong style="color: white">${raForms.generatorInstalledInUse}</strong><br>
                                                    <label class="control-label">Generator make: </label>&nbsp;<strong style="color: white">${raForms.generatorMake}</strong><br>
                                                    <label class="control-label">Generator Capacity: </label>&nbsp;<strong style="color: white">${raForms.generatorCapacity}</strong><br>
                                                    <label class="control-label">Generator KVA: </label>&nbsp;<strong style="color: white">${raForms.generatorKVA}</strong><br>
                                                    <label class="control-label">Generator Fuel Type? </label>&nbsp;<strong style="color: white">${raForms.generatorFuel}</strong><br>
                                                    <label class="control-label">Generator Interconnected? </label>&nbsp;<strong style="color: white">${raForms.generatorInterconnected}</strong>
                                                </c:if>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Is Transformer Installed? </label>&nbsp;<strong style="color: white">${raForms.transformerInstalled}</strong><br>
                                                <c:if test="${raForms.transformerInstalled.equals('Yes')}">
                                                    <label class="control-label">Transformer make </label>&nbsp;<strong style="color: white">${raForms.transformerMake}</strong><br>
                                                    <label class="control-label">Transformer Capacity </label>&nbsp;<strong style="color: white">${raForms.transformerCapacity}</strong><br>
                                                    <label class="control-label">Transformer KVA </label>&nbsp;<strong style="color: white">${raForms.transformerKVA}</strong>
                                                </c:if>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Any leakages were found? </label>&nbsp;<strong style="color: white">${raForms.leakagesFound}</strong>
                                                <c:if test="${raForms.leakagesFound.equals('Yes')}">
                                                    <hr>
                                                    <label class="control-label">Where leakages found? </label>&nbsp;<strong style="color: white">${raForms.leakagesFoundDetails}</strong>
                                                </c:if>
                                            </div>
                                        </div>
                                        <c:if test="${raForms.riskCost.equals('Below 500 million')}">
                                            <hr><hr>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="control-label">Condition Of Machinery? </label>&nbsp;<strong style="color: white">${raForms.machineryCondition}</strong>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="control-label">Is Maintenance Carried Out Regularly? </label>&nbsp;<strong style="color: white">${raForms.maintenanceCarried}</strong>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label class="control-label">Spark Arrestors Fixed? </label>&nbsp;<strong style="color: white">${raForms.sparkArrestorsFixed}</strong>
                                                </div>
                                                <div class="col-md-4">
                                                    <label class="control-label">Security Guards On Duty (Day/Night)? </label>&nbsp;<strong style="color: white">${raForms.securityGuardsDuty}</strong>
                                                </div>
                                                <div class="col-md-4">
                                                    <label class="control-label">No .Of Fire Fighters: </label>&nbsp;<strong style="color: white">${raForms.noOfFireFighters}</strong>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${raForms.riskCost.equals('Above 500 million')}">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="control-label">Condition Of Machinery?</label>&nbsp;<strong style="color: white">${raForms.machineryCondition}</strong>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="control-label">Is Maintenance Carried Out Regularly?</label>&nbsp;<strong style="color: white">${raForms.maintenanceCarried}</strong>
                                                    <c:if test="${raForms.maintenanceCarried.equals('Yes')}">
                                                        <hr>
                                                        <label class="control-label">Is Yes Which Type?</label>&nbsp;<strong style="color: white">${raForms.maintenanceType}</strong>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label class="control-label">Spark Arrestors Fixed?</label>&nbsp;<strong style="color: white">${raForms.sparkArrestorsFixed}</strong>
                                                </div>
                                                <div class="col-md-4">
                                                    <label class="control-label">Is There Any Labor Union?</label>&nbsp;<strong style="color: white">${raForms.laborUnion}</strong>
                                                </div>
                                                <div class="col-md-4">
                                                    <label class="control-label">Name Of Hazardous Materials</label>&nbsp;<strong style="color: white">${raForms.hazardousMaterialName}</strong>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="control-label">No. Of Employees/Labour Work (Day)</label>&nbsp;<strong style="color: white">${raForms.noOfEmployeesDay}</strong>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="control-label">No. Of Employees/Labour Work (Night)</label>&nbsp;<strong style="color: white">${raForms.noOfEmployeesNight}</strong>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="control-label">No. Of Security Guards on Duty (Day)</label>&nbsp;<strong style="color: white">${raForms.noOfSecurityGuardsDay}</strong>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="control-label">No. Of Security Guards on Duty (Night)</label>&nbsp;<strong style="color: white">${raForms.noOfSecurityGuardsNight}</strong>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="control-label">Production Capacity Industry/Mill</label>&nbsp;<strong style="color: white">${raForms.productionCapacity}</strong>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="control-label">Trained Fire Fighters</label>&nbsp;<strong style="color: white">${raForms.noOfTrainedFireFighters}</strong>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="control-label">Capacities Of Motors/Turbines</label>&nbsp;<strong style="color: white">${raForms.motorTurbineCapacity}</strong>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label class="control-label">Hot Work Permit Shown/Provided?</label>&nbsp;<strong style="color: white">${raForms.hotWorkPermit}</strong>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                                        <span><i style="font-size: 20px;" class="fa fa-building-o"></i></span>&nbsp;
                                        <c:if test="${raForms.waiver.equals('Yes waive')}" ><strong class="yeswaiver">Waiver Request</strong></c:if><c:if test="${raForms.waiver.equals('No waive')}"><strong class="nowaiver">Industry Specific</strong></c:if>
                                    </a>
                                </h4> </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <c:if test="${raForms.waiver.equals('Yes waive')}" >
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="white-box">
                                                    <h3 class="box-title">Note:</h3>
                                                    <div class="alert alert-info">
                                                        You have requested for waiver!
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <hr>
                                        <h4><strong>Observation: </strong></h4>
                                        <hr><hr>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label">Finidings?</label>&nbsp;<strong style="color: white">${raForms.findings}</strong>
                                            </div>
                                        </div>

                                    </c:if>
                                    <c:if test="${raForms.waiver.equals('No waive')}">

                                       <c:if test="${raForms.industryType.equals('Specific Information for Textile/Garment Factory/Spinning Mills/Weaving Mills')}">
                                        <h3><strong>Specific Information for Textile/Garment Factory/Spinning
                                            Mills/Weaving Mills:</strong></h3>
                                        <hr>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Separate godowns are provided for raw
                                                    material & finished goods with perfect partitioning walls? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificTextileGarmentSpinning.partitioningWalls}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Double sliding fireproof doors are
                                                    installed between different sections of the production
                                                    hall? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificTextileGarmentSpinning.fireproofdoorsInstalled}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Raw cotton in open (if any) is stored in
                                                    open at least 30 feet away from any building? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificTextileGarmentSpinning.stored30feetaway}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">No stock is stored inside the production
                                                    area more than day's requirement? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificTextileGarmentSpinning.storedstockproductionarea}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Godowns/warehouses are
                                                    electrified? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificTextileGarmentSpinning.godownswarehouseselectrified}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Separate blow rooms for cotton and or
                                                    polyester are provided? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificTextileGarmentSpinning.separateblowrooms}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Proper cotton dust collection system is
                                                    operated? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificTextileGarmentSpinning.cottondustcollection}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">No fire-wood/diesel or any fuel is stored
                                                    within 50 feet of any building or stock? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificTextileGarmentSpinning.stock50feetstored}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Installed spinning mill capacity: </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificTextileGarmentSpinning.installedspinningmills}</strong>
                                            </div>
                                        </div>
                                    </c:if>

                                       <c:if test="${raForms.industryType.equals('Specific Information for Cotton Factory/Cotton Ginning/Pressing Factory')}">
                                        <hr>
                                        <hr>
                                        <h3><strong>Specific Information for Cotton Ginning/Pressing Factory:</strong>
                                        </h3>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Phutti or loose cotton is stacked 50 feet
                                                    away from any building? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificCottonGinning.stack50feetstored}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">No stock of loose cotton/phutti is stacked
                                                    inside process area? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificCottonGinning.cottonphuttistacked}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">No ore than 2500 FPIB cotton bales are
                                                    stored in any one godown? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificCottonGinning.fPIB2500cottonbalesstrored}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">No ore than 1000 FPIB cotton bales are
                                                    stored in any one stack? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificCottonGinning.fPIB1000cottonbalesstored}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Maximum height of each stack does not
                                                    exceed 6 bales? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificCottonGinning.maximumheight6bales}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Distance between each stack is 15
                                                    feet? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificCottonGinning.stackdistance15feet}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Distance between the lots of bales is
                                                    approximately 75 feet? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificCottonGinning.lotsofbaledistance75feet}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">Cotton bales are stacked 30 feet away from
                                                    any building? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificCottonGinning.cottonbalesdistance30feet}</strong>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="control-label">Not more than 10,000 FPIB cotton bales are
                                                    stored in open at single location? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificCottonGinning.fPIB10000cottonbalesstoredlocation}</strong>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="control-label">No fire-wood/diesel or any fuel is stored
                                                    within 50 feet of any building or stock? </label>&nbsp;<strong
                                                    style="color: white">${riskSpecificCottonGinning.fuelstockstored50feet}</strong>
                                            </div>
                                        </div>
                                    </c:if>

                                       <c:if test="${raForms.industryType.equals('Specific Information for Oil & Feed Mills')}">
                                    <hr>
                                    <hr>
                                    <h3><strong>Specific Information for Oil & Feed Mills:</strong></h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Is the risk of spontaneous combustion
                                                covered? </label>&nbsp;<strong style="color: white"><c:out
                                                value='${riskSpecificOilFeed.combustioncovered}'/></strong>
                                        </div>
                                        <c:if test="${riskSpecificOilFeed.combustioncovered.equals('Yes')}">
                                            <div class="col-md-6">
                                                <label class="control-label">Perentange of sum
                                                    insured: </label>&nbsp;<strong style="color: white"><c:out
                                                    value='${riskSpecificOilFeed.combustionsuminsuredpercent}'/></strong>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">Quantity of silos at factory: </label>&nbsp;<strong
                                            style="color: white">${riskSpecificOilFeed.noofsilosatfactory}</strong>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="control-label">Is the stock of seed stored in open? </label>&nbsp;<strong
                                            style="color: white">${riskSpecificOilFeed.seedstored}</strong>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">Distance between the walls of the godown and stocks
                                            is 4 feet? </label>&nbsp;<strong
                                            style="color: white">${riskSpecificOilFeed.distancestocks4feet}</strong>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="control-label">Fire lanes are marked inside the godowns(12 ft
                                            between the society)? </label>&nbsp;<strong
                                            style="color: white">${riskSpecificOilFeed.firelanesmarked}</strong>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">Maximum heigth of each stack does not exceed 15
                                            ft? </label>&nbsp;<strong
                                            style="color: white">${riskSpecificOilFeed.stackheight15feet}</strong>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="control-label">Not more than 8,000 bags are spaced in each
                                            stack? </label>&nbsp;<strong
                                            style="color: white">${riskSpecificOilFeed.bagsstacked8000}</strong>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">Godowns are properly
                                            ventilated? </label>&nbsp;<strong
                                            style="color: white">${riskSpecificOilFeed.godownsventilated}</strong>
                                    </div>
                                </div>
                                </c:if>

                                       <c:if test="${raForms.industryType.equals('Specific Information for Cosmetics/Chemical Factories/Labs')}">
                                    <hr>
                                    <hr>
                                    <h3><strong>Specific Information for Cosmetics/Chemical Factories/Labs:</strong>
                                    </h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Tick the hazardous chemiclas stored at the
                                                facility from the following list? </label>&nbsp;<strong
                                                style="color: white">${riskSpecificCosmeticsChemical.hazardouschemicalstored}</strong>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Chemicals are stored in separate air
                                                conditioned godowns? </label>&nbsp;<strong
                                                style="color: white">${riskSpecificCosmeticsChemical.chemicalseparatestored}</strong>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Chemicals storage is 30 feet away from
                                                porduction area? </label>&nbsp;<strong
                                                style="color: white">${riskSpecificCosmeticsChemical.chemicalseparatestored30feet}</strong>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Quantity of raw material placed in production
                                                hall? </label>&nbsp;<strong
                                                style="color: white">${riskSpecificCosmeticsChemical.rawmaterialquantity}</strong>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label">Dry water mist & powder type fire extinguishers
                                                are provided to combat A,B,C & D type fires? </label>&nbsp;<strong
                                                style="color: white">${riskSpecificCosmeticsChemical.fireextinguishersprovided}</strong>
                                        </div>
                                    </div>
                                    <br>
                                </c:if>

                                       <c:if test="${raForms.riskCost.equals('Above 500 million') && raForms.industryType.equals('Specific Information for Paper/Board Mills')}">
                                    <hr>
                                    <hr>
                                    <h3><strong>Specific Information for Paper/Board Mills:</strong></h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Stock of paper is stored on the wooden pallets
                                                of 4 inches height?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificPaperBoard.fourInchesHeight}</strong>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Stock of paper is stacked 4 ft away from the
                                                walls/doors of godowns?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificPaperBoard.fourInchesAway}</strong>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label class="control-label">No stock of paper is stored in open?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificPaperBoard.storedopen}</strong>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="control-label">Stacks of paper sheets/rolls are at least 3 ft
                                                below the ceiling?</label>&nbsp;$<strong style="color: white">{riskSpecificPaperBoard.stocksThreeFeetBelowCeiling}</strong>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="control-label">Godowns/warehouses are electrified?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificPaperBoard.godownselectrified}</strong>
                                        </div>
                                    </div>
                                </c:if>

                                       <c:if test="${raForms.industryType.equals('Specific Information for Livestock, Farms')}">
                                    <hr><hr>
                                    <h3><strong>Specific Information for Livestock, Farms:</strong></h3>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">How frequently the animals are vaccinated?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificLiveStocksFarms.animalsvaccinated}</strong>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">How often pest control sprays are carried out?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificLiveStocksFarms.pestSprayCarriedOut}</strong>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Does the insured has veterinary doctor on risk location round the clock?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificLiveStocksFarms.insuredVeterinaryDoctor}</strong>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Is there any in-house medical emergency team?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificLiveStocksFarms.inhouseMedicalEmergency}</strong>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">The animals were ear-tagged, Ring tagged, Micro chipped?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificLiveStocksFarms.animalsTagged}</strong>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Adequate distance is maintained between the animal lanes under the sheds?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificLiveStocksFarms.distanceBetweenAnimals}</strong>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Proper evacuation map for animals is designed to avoid stampede in emergency situation?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificLiveStocksFarms.animalsEmergencyEvacuationMap}</strong>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Unauthorized entry is strictly prohibited inside the farm?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificLiveStocksFarms.unauthorizedEntryInFarm}</strong>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Does the facility is provided with proper waste management system?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificLiveStocksFarms.wasteManagementFacility}</strong>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Animal sheds can resist severe weather?</label>&nbsp;<strong
                                                style="color: white">${riskSpecificLiveStocksFarms.severeWeatherResistSheds}</strong>
                                        </div>
                                    </div>
                                </c:if>

                                <hr>
                                <h4><strong>Observation: </strong></h4>
                                <hr><hr>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label">Finidings?</label>&nbsp;<strong style="color: white">${raForms.findings}</strong>
                                    </div>
                                </div>

                                </c:if>
                                </div></div>

                        <c:if test="${raForms.waiver.equals('No waive')}">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingFour">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                            <span><i style="font-size: 20px;" class="mdi mdi-file-document-box"></i></span>&nbsp;Docs Data Table
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingFour">
                                    <div class="panel-body">
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
                                                                <a title="Download" class="btn btn-block btn-success btn-rounded" href="<c:url value="/rcsTeam/download/${doc.raForm.raFormId}/${doc.locReportId}" />"/><i class="mdi mdi-cloud-download"></i>&nbsp;Download</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                    </div>
            </div>
        </div>
            <!-- /.row -->


            <!-- /.row -->
            <div class="row">
                <c:if test="${raForms.waiver.equals('No waive')}">
                    <div class="col-md-12">
                        <div class="white-box">
                            <h3 class="box-title">Inspected Snap Shots</h3>
                            <div id="gallery">
                                <div id="gallery-content">
                                    <div id="gallery-content-center">
                                        <c:forEach items="${locationInspectionPicsList}" var="img" varStatus="counter">
                                            <a href="<c:url value="/rcsTeam/getImage?id=${img.locInspId}"/>" target="_blank" rel="noopener noreferrer" ><img src="<c:url value="/rcsTeam/getImage?id=${img.locInspId}"/>" alt="gallery" class="all studio" /> </a>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </c:if>
                <div class="row">
                    <div class="col-lg-2 col-sm-4 col-xs-12 pull-right">
                        <a href="<c:url value="../finalSubmission/${raForms.raFormId}"/>" type="submit" class="btn btn-block btn-outline btn-rounded btn-info"><i class="mdi mdi-image-album"></i>Final Submission</a>
                    </div>
                </div>
            </div>


            <!-- .row -->

        </div>
    </div>
    <!-- /.row -->

<!-- /.container-fluid -->
<footer class="footer text-center"> <fmt:formatDate value="${date}" pattern="yyyy" /> &copy; UBLI RCS brought to you by UBL Insureres IT Dept. </footer>
</div>
<!-- /#page-wrapper -->


<!-- /#wrapper -->
<%@ include file="/WEB-INF/views/template/riskEvaluationFooter.jsp" %>
<!-- Editable -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/jquery-datatables-editable/jquery.dataTables.js"/>"></script>
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/datatables/dataTables.bootstrap.js"/>"></script>
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/tiny-editable/mindmup-editabletable.js"/>"></script>
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/tiny-editable/numeric-input-example.js"/>"></script>
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/gallery/js/animated-masonry-gallery.js"/>"></script>
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/gallery/js/jquery.isotope.min.js"/>"></script>
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/fancybox/ekko-lightbox.min.js"/>"></script>
</body>
