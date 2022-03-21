<%--
  Created by IntelliJ IDEA.
  User: Haider Iqbal
  Date: 12/29/2020
  Time: 7:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="date" class="java.util.Date" />
<%@ include file="/WEB-INF/views/template/headerRMSTeamEdit.jsp" %>

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
                    <h4 class="page-title">Risk Update Form</h4> </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="#">Forms</a></li>
                        <li><a href="#">Risk Update</a></li>
                        <li class="active">Risk Update Form</li>
                    </ol>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- .row -->

            <!-- .row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title m-b-0">Risk Form</h3>
                        <p class="text-muted m-b-30"> Risk Update Form</p>
                        <form id="validation" data-toggle="validator" method="get" action="<c:url value="/rcsTeam/editForm/getRMTeamRAFormEditPost"/>">
                            <input type="hidden" id="readRiskCosting" value="${raForms.riskCost}"/>
                            <input type="hidden" id="riskCostonLoad" value=""/>
                            <input type="hidden" id="readSumInsured" value="${raForms.sumInsured}"/>
                            <!-- .row -->
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="panel-group wiz-aco" id="accordion" role="tablist" aria-multiselectable="true">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="headingOne">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                        <span><i style="font-size: 20px;" class="fa fa-bitcoin"></i></span>&nbsp;Risk Cost
                                                    </a>
                                                </h4> </div>
                                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="control-label"><h4>Risk Cost?</h4></label>
                                                                <div class="radio-list">
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
                                                        <!--/span-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="headingTwo">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
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
                                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Risk Code</label>
                                                            <input type="text" id="riskCode" name="riskCode" class="form-control" value="${raForms.riskLocations.riskCode}" readonly placeholder="Risk Code">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">City</label>
                                                            <select path="industries" id="city" name="city" class="form-control" data-placeholder="Choose city" tabindex="1">
                                                                <option disabled readonly selected>${raForms.riskLocations.city}</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Policy No#</label>
                                                            <input type="text" id="policyNo" name="policyNo" class="form-control" value="${raForms.policyNo}" placeholder="Policy no.">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Insured/Proposer</label>
                                                            <input type="text" id="insuredName" name="insuredName" class="form-control" value="${raForms.insuredName}" placeholder="Insured name">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Date of Visit</label>
                                                            <input type="text" class="form-control" id="visitDate" name="visitDate" value="${raForms.visitDate}" placeholder="dd/mm/yyyy">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="riskLocation" class="control-label">Risk Location</label>
                                                            <textarea id="riskLocation" name="riskLocation" placeholder="Risk location" class="form-control" readonly>${raForms.riskLocations.riskLocation}</textarea>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="headOfficeAddress" class="control-label">Head Office Address</label>
                                                            <textarea id="headOfficeAddress" name="headOfficeAddress" placeholder="Address of head office" class="form-control">${raForms.headOfficeAddress}</textarea>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label class="control-label">Person Met/Designation</label>
                                                            <input type="text" class="form-control" id="personMet" name="personMet" placeholder="Person met/designation" value="${raForms.personMet}">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Inspected By</label>
                                                            <input type="text" class="form-control" id="inspectedBy" name="inspectedBy" placeholder="Person Inspected" value="${raForms.inspectedBy}">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="control-label">Nature Of Business/Occupation</label>
                                                            <input type="text" class="form-control" id="natureOfBusinessOccupation" name="natureOfBusinessOccupation" placeholder="Business's Nature/Occupation" value="${raForms.natureOfBusinessOccupation}">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Loss History (Date)</label>
                                                            <input type="text" class="form-control" id="lossHistoryDate" name="lossHistoryDate" placeholder="dd/mm/yyyy" value="${raForms.lossHistoryDate}">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Loss History (Amount)</label>
                                                            <input type="text" class="form-control" id="lossHistoryAmount" name="lossHistoryAmount" placeholder="Loss Amount" value="${raForms.lossHistoryAmount}">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Subject Matter?</label>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="subjectMatter" id="machinery" value="Machinery">
                                                                <label for="machinery"> Machinery </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="subjectMatter" id="stock" value="Stock">
                                                                <label for="stock"> Stock </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="subjectMatter" id="building" value="Building">
                                                                <label for="building"> Building </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="subjectMatter" id="generator" value="Generator">
                                                                <label for="generator"> Generator </label>
                                                            </div>
                                                            <div class="checkbox checkbox-info">
                                                                <input type="checkbox" name="subjectMatter" id="boiler" value="Bolier">
                                                                <label for="boiler"> Boiler </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Sum Isured</label>
                                                            <input type="text" class="form-control" id="sumInsured" name="sumInsured" placeholder="Sum Insured" value="${raForms.sumInsured}">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="control-label">Want Waiver?</label>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="waiver" id="waiverYes" value="Yes waive">
                                                                <label for="waiverYes"> Yes waive </label>
                                                            </div>
                                                            <div class="radio radio-info">
                                                                <input type="radio" name="waiver" id="waiverNo" value="No waive">
                                                                <label for="waiverNo"> No waive </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="control-label">Branches</label>
                                                            <select id="branch" name="branch" class="form-control" data-placeholder="Choose branch" tabindex="1">
                                                                <option disabled readonly selected>${raForms.branches.branchName}</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="nowaiver">
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
                                                                    <input type="radio" name="multipleTenancy" id="tenancyyes" value="Yes">
                                                                    <label for="tenancyyes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="multipleTenancy" id="tenancyno" value="No">
                                                                    <label for="tenancyno"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label class="control-label">Surrondings of the premises?</label>
                                                                <div class="checkbox checkbox-info">
                                                                    <input type="checkbox" name="premisesSurrounding" id="front" value="Front">
                                                                    <label for="front">Front</label>
                                                                </div>
                                                                <div id="frontSurrondings"><br>
                                                                    <textarea class="form-control" id="frontDetails" name="frontDetails" placeholder="Front Surrondings Details">${raForms.frontSurrondingsDetails}</textarea><hr>
                                                                </div>
                                                                <div class="checkbox checkbox-info">
                                                                    <input type="checkbox" name="premisesSurrounding" id="back" value="Back">
                                                                    <label for="back">Back</label>
                                                                </div>
                                                                <div id="backSurrondings"><br>
                                                                    <textarea class="form-control" id="backDetails" name="backDetails" placeholder="Back Surrondings Details">${raForms.backSurrondingsDetails}</textarea><hr>
                                                                </div>
                                                                <div class="checkbox checkbox-info">
                                                                    <input type="checkbox" name="premisesSurrounding" id="left" value="Left">
                                                                    <label for="left">Left</label>
                                                                </div>
                                                                <div id="leftSurrondings"><br>
                                                                    <textarea class="form-control" id="leftDetails" name="leftDetails" placeholder="Left Surrondings Details">${raForms.leftSurrondingsDetails}</textarea><hr>
                                                                </div>
                                                                <div class="checkbox checkbox-info">
                                                                    <input type="checkbox" name="premisesSurrounding" id="right"  class="right" value="Right">
                                                                    <label for="right">Right</label>
                                                                </div>
                                                                <div id="rightSurrondings"><br>
                                                                    <textarea class="form-control" id="rightDetails" name="rightDetails" placeholder="Right Surrondings Details">${raForms.rightSurrondingsDetails}</textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label class="control-label">Year Built</label>
                                                                <input type="text" class="form-control" id="yearBuilt" value="${raForms.yearBuilt}" name="yearBuilt" placeholder="YYYY">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="col-md-6">
                                                                    <label class="control-label">No. Of Floors</label>
                                                                    <input type="text" class="form-control" id="noOfFloors" value="${raForms.noOfFloors}" name="noOfFloors" placeholder="No. of floors">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label class="control-label">Covered Area</label>
                                                                <input type="text" class="form-control" id="coveredArea" value="${raForms.coveredArea}" name="coveredArea" placeholder="Covered area">
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
                                                                    <input type="checkbox" name="electricWiring" id="notApplicablee" value="Not Applicable">
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
                                                                    <input type="checkbox" name="rawMaterialStored" id="notApplicablese" value="Not Applicable">
                                                                    <label for="notApplicablese"> N/A </label>
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
                                                                    <input type="text" class="form-control" id="noofCylinders" value="${raForms.noofCylinders}" name="noofCylinders" placeholder="No. of cylinders">
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
                                                                <input type="text" class="form-control" id="frequencyOfDrill" name="frequencyOfDrill" value="${raForms.frequencyOfDrill}" placeholder="Drill frequency">
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
                                                                <input type="text" class="form-control" id="noOfFireExtinguishers" name="noOfFireExtinguishers" value="${raForms.noOfFireExtinguishers}" placeholder="No. Of Fire Extinguishers">
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">No. Of Fire Buckets (Water/Sand)</label>
                                                                <input type="text" class="form-control" id="noOfFireBuckets" name="noOfFireBuckets" value="${raForms.noOfFireBuckets}" placeholder="No. Of Fire Buckets">
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
                                                                    <input type="text" class="form-control" id="noofHydrantPoints" name="noofHydrantPoints" value="${raForms.noofHydrantPoints}" placeholder="No. of hydrant points">
                                                                    <hr>
                                                                    <input type="text" class="form-control" id="noofFireHoses" name="noofFireHoses" value="${raForms.noofFireHoses}" placeholder="No. of fire hoses">
                                                                    <hr>
                                                                    <input type="text" class="form-control" id="hydrantpumpCapacity" name="hydrantpumpCapacity" value="${raForms.hydrantpumpCapacity}" placeholder="Hydrant pump capacity">
                                                                    <hr>
                                                                    <input type="text" class="form-control" id="hydrantPressure" name="hydrantPressure" value="${raForms.hydrantPressure}" placeholder="Hydrant pressure">
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
                                                                    <input type="checkbox" name="electricitySupply" id="notApplicablees" value="Not Applicable">
                                                                    <label for="notApplicablees"> N/A </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <label class="control-label">Capacity Of Underground Tank(s)</label>
                                                                <input type="text" class="form-control" name="capacityUndergroundTank" id="capacityUndergroundTank" value="${raForms.capacityUndergroundTank}" placeholder="Underground tank capacity">
                                                            </div>
                                                            <div class="col-md-3">
                                                                <label class="control-label">Capacity Of Overhead Tank(s)</label>
                                                                <input type="text" class="form-control" name="capacityOverheadTank" id="capacityOverheadTank" value="${raForms.capacityOverheadTank}" placeholder="Elevated/overhead tank capacity">
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
                                                                    <input type="checkbox" name="sourcesOfWaterSupply" id="notApplicable" value="Not Applicable">
                                                                    <label for="notApplicable"> N/A </label>
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
                                                                <textarea id="nearestHospital" name="nearestHospital" placeholder="Nearer hospital" class="form-control">${raForms.nearestHospital}</textarea>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label for="responseTimeHospital" class="control-label">Response Time (Hospital)</label>
                                                                <input id="responseTimeHospital" name="responseTimeHospital" value="${raForms.responseTimeHospital}" placeholder="Estimated response time (Hospital)" class="form-control">
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label for="nearestPoliceStation" class="control-label">Nearest Police Station</label>
                                                                <textarea id="nearestPoliceStation" name="nearestPoliceStation" placeholder="Nearer police station" class="form-control">${raForms.nearestPoliceStation}</textarea>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label for="responseTimePoliceStation" class="control-label">Response Time (Police Station)</label>
                                                                <input id="responseTimePoliceStation" name="responseTimePoliceStation" value="${raForms.responseTimePoliceStation}" placeholder="Estimated response time (Police Station)" class="form-control">
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label for="nearestFireStation" class="control-label">Nearest Fire Station</label>
                                                                <textarea id="nearestFireStation" name="nearestFireStation" placeholder="Nearer fire station" class="form-control">${raForms.nearestFireStation}</textarea>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label for="responseTimeFireStation" class="control-label">Response Time (Fire Station)</label>
                                                                <input id="responseTimeFireStation" name="responseTimeFireStation" value="${raForms.responseTimeFireStation}" placeholder="Estimated response time (Fire Station)" class="form-control">
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
                                                                    <input type="text" class="form-control" id="boilerInstalledInUse" name="boilerInstalledInUse" value="${raForms.boilerInstalledInUse}" placeholder="Boiler installed or in use">
                                                                    <hr>
                                                                    <input type="text" class="form-control" id="boilerMake" name="boilerMake" value="${raForms.boilerMake}" placeholder="Boiler make">
                                                                    <hr>
                                                                    <input type="text" class="form-control" id="boilerType" name="boilerType" value="${raForms.boilerType}" placeholder="Boiler type">
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
                                                                    <input type="text" class="form-control" id="generatorInstalledInUse" name="generatorInstalledInUse" value="${raForms.generatorInstalledInUse}" placeholder="Generator installed or in use">
                                                                    <hr>
                                                                    <input type="text" class="form-control" id="generatorMake" name="generatorMake" value="${raForms.generatorMake}" placeholder="Generator make">
                                                                    <hr>
                                                                    <input type="text" class="form-control" id="generatorCapacity" name="generatorCapacity" value="${raForms.generatorCapacity}" placeholder="Generator Capacity">
                                                                    <hr>
                                                                    <input type="text" class="form-control" id="generatorKVA" name="generatorKVA" value="${raForms.generatorKVA}" placeholder="Generator KVA">
                                                                    <hr>
                                                                    <label class="control-label">Generator Fuel Type?</label>
                                                                    <div class="radio radio-info">
                                                                        <input type="radio" name="generatorFuel" id="diesel" value="Diesel">
                                                                        <label for="diesel"> Diesel </label>
                                                                    </div>
                                                                    <div class="radio radio-info">
                                                                        <input type="radio" name="generatorFuel" id="petrol" value="Petrol">
                                                                        <label for="petrol"> Petrol </label>
                                                                    </div>
                                                                    <div class="radio radio-info">
                                                                        <input type="radio" name="generatorFuel" id="generaorgas" value="Gas">
                                                                        <label for="generaorgas"> Gas </label>
                                                                    </div>
                                                                    <div class="radio radio-info">
                                                                        <input type="radio" name="generatorFuel" id="kerosene" value="Kerosene">
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
                                                                    <input type="text" class="form-control" id="transformerMake" name="transformerMake" value="${raForms.transformerMake}" placeholder="Transformer make">
                                                                    <hr>
                                                                    <input type="text" class="form-control" id="transformerCapacity" name="transformerCapacity" value="${raForms.transformerCapacity}" placeholder="Transformer Capacity">
                                                                    <hr>
                                                                    <input type="text" class="form-control" id="transformerKVA" name="transformerKVA" value="${raForms.transformerKVA}" placeholder="Transformer KVA">
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
                                                                    <input type="text" class="form-control" id="leakagesFoundDetails" name="leakagesFoundDetails" value="${raForms.leakagesFoundDetails}" placeholder="Where leakages found?">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <c:if test="${raForms.riskCost.equals('Above 500 million')}">
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
                                                                    <input type="text" class="form-control" id="hazardousMaterialName" name="hazardousMaterialName" value="${raForms.hazardousMaterialName}" placeholder="Hazardous materials name">
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label class="control-label">No. Of Employees/Labour Work (Day)</label>
                                                                    <input type="text" class="form-control" id="noOfEmployeesDay" name="noOfEmployeesDay" value="${raForms.noOfEmployeesDay}" placeholder="Number of employess in day">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="control-label">No. Of Employees/Labour Work (Night)</label>
                                                                    <input type="text" class="form-control" id="noOfEmployeesNight" name="noOfEmployeesNight" value="${raForms.noOfEmployeesNight}" placeholder="Number of employess in night">
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label class="control-label">No. Of Security Guards on Duty (Day)</label>
                                                                    <input type="text" class="form-control" id="noOfSecurityGuardsDay" name="noOfSecurityGuardsDay" value="${raForms.noOfSecurityGuardsDay}" placeholder="Number of security guards in day">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="control-label">No. Of Security Guards on Duty (Night)</label>
                                                                    <input type="text" class="form-control" id="noOfSecurityGuardsNight" name="noOfSecurityGuardsNight" value="${raForms.noOfSecurityGuardsNight}" placeholder="Number of security guards in night">
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label class="control-label">Production Capacity Industry/Mill</label>
                                                                    <input type="text" class="form-control" id="productionCapacity" name="productionCapacity" value="${raForms.productionCapacity}" placeholder="Industry/Mill production capacity">
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label class="control-label">Trained Fire Fighters</label>
                                                                    <input type="text" class="form-control" id="noOfTrainedFireFighters" name="noOfTrainedFireFighters" value="${raForms.noOfTrainedFireFighters}" placeholder="Number of trained fire fighters">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="control-label">Capacities Of Motors/Turbines</label>
                                                                    <input type="text" class="form-control" id="motorTurbineCapacity" name="motorTurbineCapacity" value="${raForms.motorTurbineCapacity}" placeholder="Motor/Turbines capacities">
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
                                                        </c:if>
                                                        <c:if test="${raForms.riskCost.equals('Below 500 million')}">
                                                        <hr>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Condition Of Machinery?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="machineryCondition" id="machineryConditionSatisfactory" value="Satisfactory">
                                                                    <label for="machineryConditionSatisfactory"> Satisfactory </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="machineryCondition" id="machineryConditionImprove" value="Needs Improvement">
                                                                    <label for="machineryConditionImprove"> Needs Improvement </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Is Maintenance Carried Out Regularly?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="maintenanceCarried" id="maintenanceCarriedYes" value="Yes">
                                                                    <label for="maintenanceCarriedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="maintenanceCarried" id="maintenanceCarriedNo" value="No">
                                                                    <label for="maintenanceCarriedNo"> No </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label class="control-label">Spark Arrestors Fixed?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="sparkArrestorsFixed" id="sparkArrestorsFixedYes" value="Yes">
                                                                    <label for="sparkArrestorsFixedYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="sparkArrestorsFixed" id="sparkArrestorsFixedNo" value="No">
                                                                    <label for="sparkArrestorsFixedNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label class="control-label">Security Guards On Duty (Day/Night)?</label>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="securityGuardsDuty" id="securityGuardsDutyYes" value="Yes">
                                                                    <label for="securityGuardsDutyYes"> Yes </label>
                                                                </div>
                                                                <div class="radio radio-info">
                                                                    <input type="radio" name="securityGuardsDuty" id="securityGuardsDutyNo" value="No">
                                                                    <label for="securityGuardsDutyNo"> No </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label class="control-label">No .Of Fire Fighters</label>
                                                                <input type="text" class="form-control" id=noOfFireFighters name="noOfFireFighters" value="${raForms.noOfFireFighters}" placeholder="Number of fire fighters">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="panel panel-default ">
                                            <div class="panel-heading" role="tab" id="headingThree">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                        <span><i style="font-size: 20px;" class="fa fa-building-o"></i></span>&nbsp;<strong class="yeswaiver">Waiver Request</strong><strong class="nowaiver">Industry Specific</strong>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                                <div class="panel-body">
                                                    <div hidden class="nowaiver">
                                                        <div class="row">
                                                            <label class="control-label">Industry Specific</label>
                                                            <select id="industries" class="form-control" data-placeholder="Choose industry specific" tabindex="1">
                                                                <option disabled readonly selected>${raForms.industryType}</option>
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
                                                                    <input type="text" class="form-control" id="installedspinningmills" name="installedspinningmills" value="${riskSpecificTextileGarmentSpinning.installedspinningmills}" placeholder="Spinning mill capacities">
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
                                                                    <input type="text" id="noofsilosatfactory" name="noofsilosatfactory" class="form-control" value="${riskSpecificOilFeed.noofsilosatfactory}" placeholder="No. of silos factory">
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
                                                    <div hidden class="yeswaiver">
                                                        <!-- .row -->
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
                                                        <!-- .row -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- All Form Hidden Input Fields Start -->
                                        <input type="hidden" name="rafId" value="${raForms.raFormId}"/>
                                        <input type="hidden" name="raLocId" value="${raForms.riskLocations.riskLocationId}"/>
                                        <input type="hidden" name="hiddeninputriskCost" style="color: #FFFFFF;" value="${raForms.riskCost}" id="triskCost"/>
                                        <input type="hidden" name="hiddeninpuriskCode" style="color: #FFFFFF;" value="${raForms.riskLocations.riskCode}" id="triskCode"/>
                                        <input type="hidden" name="hiddeninputpolicyNo" style="color: #FFFFFF;" value="${raForms.policyNo}" id="tpolicyNo"/>
                                        <input type="hidden" name="hiddeninputcity" style="color: #FFFFFF;" value="${raForms.riskLocations.city}" id="tCity"/>
                                        <input type="hidden" name="hiddeninputinsuredName" style="color: #FFFFFF;" value="${raForms.insuredName}" id="tinsuredName"/>
                                        <input type="hidden" name="hiddeninputvisitDate" style="color: #FFFFFF;" value="${raForms.visitDate}" id="tvisitDate"/>
                                        <input type="hidden" name="hiddeninputriskLocation" style="color: #FFFFFF;" value="${raForms.riskLocations.riskLocation}" id="triskLocation"/>
                                        <input type="hidden" name="hiddeninputheadOfficeAddress" style="color: #FFFFFF;" value="${raForms.headOfficeAddress}" id="theadOfficeAddress"/>
                                        <input type="hidden" name="hiddeninputpersonMet" style="color: #FFFFFF;" value="${raForms.personMet}" id="tpersonMet"/>
                                        <input type="hidden" name="hiddeninputinspectedBy" style="color: #FFFFFF;" value="${raForms.inspectedBy}" id="tinspectedBy"/>
                                        <input type="hidden" name="hiddeninputnatureOfBusinessOccupation" style="color: #FFFFFF;" value="${raForms.natureOfBusinessOccupation}" id="tnatureOfBusinessOccupation"/>
                                        <input type="hidden" name="hiddeninputlossHistoryDate" style="color: #FFFFFF;" value="${raForms.lossHistoryDate}" id="tlossHistoryDate"/>
                                        <input type="hidden" name="hiddeninputlossHistoryAmount" style="color: #FFFFFF;" value="${raForms.lossHistoryAmount}" id="tlossHistoryAmount"/>
                                        <input type="hidden" name="hiddeninputsubjectMatter" style="color: #FFFFFF;" value="${raForms.subjectMatter}" id="tsubjectMatter"/>
                                        <input type="hidden" name="hiddeninputsumInsured" style="color: #FFFFFF;" value="${raForms.sumInsured}" id="tsumInsured"/>
                                        <input type="hidden" name="hiddeninputwaiver" style="color: #FFFFFF;" value="${raForms.waiver}" id="twaiver"/>
                                        <input type="hidden" name="hiddeninputbranch" style="color: #FFFFFF;" value="${raForms.branches.branchName}" id="tbranch"/>
                                        <input type="hidden" name="hiddeninputpremisesOwnedRented" style="color: #FFFFFF;" value="${raForms.premisesOwnedRented}" id="tpremisesOwnedRented"/>
                                        <input type="hidden" name="hiddeninputmultipleTenancy" style="color: #FFFFFF;" value="${raForms.multipleTenancy}" id="tmultipleTenancy"/>
                                        <input type="hidden" name="hiddeninputpremisesSurrounding" style="color: #FFFFFF;" value="${raForms.premisesSurrounding}" id="tpremisesSurrounding"/>
                                        <input type="hidden" name="hiddeninputfrontDetails" style="color: #FFFFFF;" value="${raForms.frontSurrondingsDetails}" id="tfrontDetails"/>
                                        <input type="hidden" name="hiddeninputbackDetails" style="color: #FFFFFF;" value="${raForms.backSurrondingsDetails}" id="tbackDetails"/>
                                        <input type="hidden" name="hiddeninputleftDetails" style="color: #FFFFFF;" value="${raForms.leftSurrondingsDetails}" id="tleftDetails"/>
                                        <input type="hidden" name="hiddeninputrightDetails" style="color: #FFFFFF;" value="${raForms.rightSurrondingsDetails}" id="trightDetails"/>
                                        <input type="hidden" name="hiddeninputyearBuilt" style="color: #FFFFFF;" value="${raForms.yearBuilt}" id="tyearBuilt"/>
                                        <input type="hidden" name="hiddeninputnoOfFloors" style="color: #FFFFFF;" value="${raForms.noOfFloors}" id="tnoOfFloors"/>
                                        <input type="hidden" name="hiddeninputcoveredArea" style="color: #FFFFFF;" value="${raForms.coveredArea}" id="tcoveredArea"/>
                                        <input type="hidden" name="hiddeninputroofType" style="color: #FFFFFF;" value="${raForms.roofType}" id="troofType"/>
                                        <input type="hidden" name="hiddeninputplinthLevel" style="color: #FFFFFF;" value="${raForms.plinthLevel}" id="tplinthLevel"/>
                                        <input type="hidden" name="hiddeninputfloorCondition" style="color: #FFFFFF;" value="${raForms.floorCondition}" id="tfloorCondition"/>
                                        <input type="hidden" name="hiddeninputelectricWiring" style="color: #FFFFFF;" value="${raForms.electricityWiring}" id="telectricWiring"/>
                                        <input type="hidden" name="hiddeninputhouseKeeping" style="color: #FFFFFF;" value="${raForms.houseKeeping}" id="thouseKeeping"/>
                                        <input type="hidden" name="hiddeninputcigaretteSmoking" style="color: #FFFFFF;" value="${raForms.cigaretteSmoking}" id="tcigaretteSmoking"/>
                                        <input type="hidden" name="hiddeninputstorageArrangements" style="color: #FFFFFF;" value="${raForms.storageArrangements}" id="tstorageArrangements"/>
                                        <input type="hidden" name="hiddeninputrawMaterialStored" style="color: #FFFFFF;" value="${raForms.rawMaterialStored}" id="trawMaterialStored"/>
                                        <input type="hidden" name="hiddeninputstoredIn" style="color: #FFFFFF;" value="${raForms.storedIn}" id="tstoredIn"/>
                                        <input type="hidden" name="hiddeninputtypeCylinders" style="color: #FFFFFF;" value="${raForms.typeCylinders}" id="ttypeCylinders"/>
                                        <input type="hidden" name="hiddeninputnoofCylinders" style="color: #FFFFFF;" value="${raForms.noofCylinders}" id="tnoofCylinders"/>
                                        <input type="hidden" name="hiddeninputhazardousMaterialStored" style="color: #FFFFFF;" value="${raForms.hazardousMaterialStored}" id="thazardousMaterialStored"/>
                                        <input type="hidden" name="hiddeninputnightWork" style="color: #FFFFFF;" value="${raForms.nightWork}" id="tnightWork"/>
                                        <input type="hidden" name="hiddeninputwarehousesElectrified" style="color: #FFFFFF;" value="${raForms.warehousesElectrified}" id="twarehousesElectrified"/>
                                        <input type="hidden" name="hiddeninputsecurityArrangement" style="color: #FFFFFF;" value="${raForms.securityArrangement}" id="tsecurityArrangement"/>
                                        <input type="hidden" name="hiddeninputcctvCameras" style="color: #FFFFFF;" value="${raForms.cctvCameras}" id="tcctvCameras"/>
                                        <input type="hidden" name="hiddeninputnoofcctvCameras" style="color: #FFFFFF;" value="${raForms.noofcctvCameras}" id="tnoofcctvCameras"/>
                                        <input type="hidden" name="hiddeninputfireFightingTeam" style="color: #FFFFFF;" value="${raForms.fireFightingTeam}" id="tfireFightingTeam"/>
                                        <input type="hidden" name="hiddeninputfrequencyOfDrill" style="color: #FFFFFF;" value="${raForms.frequencyOfDrill}" id="tfrequencyOfDrill"/>
                                        <input type="hidden" name="hiddeninputfireExitsProvided" style="color: #FFFFFF;" value="${raForms.fireExitsProvided}" id="tfireExitsProvided"/>
                                        <input type="hidden" name="hiddeninputnoOfFireExtinguishers" style="color: #FFFFFF;" value="${raForms.noOfFireExtinguishers}" id="tnoOfFireExtinguishers"/>
                                        <input type="hidden" name="hiddeninputnoOfFireBuckets" style="color: #FFFFFF;" value="${raForms.noOfFireBuckets}" id="tnoOfFireBuckets"/>
                                        <input type="hidden" name="hiddeninputhydrantSystem" style="color: #FFFFFF;" value="${raForms.hydrantSystem}" id="thydrantSystem"/>
                                        <input type="hidden" name="hiddeninputnoofHydrantPoints" style="color: #FFFFFF;" value="${raForms.noofHydrantPoints}" id="tnoofHydrantPoints"/>
                                        <input type="hidden" name="hiddeninputnoofFireHoses" style="color: #FFFFFF;" value="${raForms.noofFireHoses}" id="tnoofFireHoses"/>
                                        <input type="hidden" name="hiddeninputhydrantpumpCapacity" style="color: #FFFFFF;" value="${raForms.hydrantpumpCapacity}" id="thydrantpumpCapacity"/>
                                        <input type="hidden" name="hiddeninputhydrantPressure" style="color: #FFFFFF;" value="${raForms.hydrantPressure}" id="thydrantPressure"/>
                                        <input type="hidden" name="hiddeninputhydrantPumpOperates" style="color: #FFFFFF;" value="${raForms.hydrantPumpOperates}" id="thydrantPumpOperates"/>
                                        <input type="hidden" name="hiddeninputelectricitySupply" style="color: #FFFFFF;" value="${raForms.electricitySupply}" id="telectricitySupply"/>
                                        <input type="hidden" name="hiddeninputcapacityUndergroundTank" style="color: #FFFFFF;" value="${raForms.capacityUndergroundTank}" id="tcapacityUndergroundTank"/>
                                        <input type="hidden" name="hiddeninputcapacityOverheadTank" style="color: #FFFFFF;" value="${raForms.capacityOverheadTank}" id="tcapacityOverheadTank"/>
                                        <input type="hidden" name="hiddeninputsourcesOfWaterSupply" style="color: #FFFFFF;" value="${raForms.sourcesOfWaterSupply}" id="tsourcesOfWaterSupply"/>
                                        <input type="hidden" name="hiddeninputfireAlarmInstalled" style="color: #FFFFFF;" value="${raForms.fireAlarmInstalled}" id="tfireAlarmInstalled"/>
                                        <input type="hidden" name="hiddeninputsprinklerSystemInstalled" style="color: #FFFFFF;" value="${raForms.sprinklerSystemInstalled}" id="tsprinklerSystemInstalled"/>
                                        <input type="hidden" name="hiddeninputsmokeDetectorsInstalled" style="color: #FFFFFF;" value="${raForms.smokeDetectorsInstalled}" id="tsmokeDetectorsInstalled"/>
                                        <input type="hidden" name="hiddeninputnearestHospital" style="color: #FFFFFF;" value="${raForms.nearestHospital}" id="tnearestHospital"/>
                                        <input type="hidden" name="hiddeninputresponseTimeHospital" style="color: #FFFFFF;" value="${raForms.responseTimeHospital}" id="tresponseTimeHospital"/>
                                        <input type="hidden" name="hiddeninputnearestPoliceStation" style="color: #FFFFFF;" value="${raForms.nearestPoliceStation}" id="tnearestPoliceStation"/>
                                        <input type="hidden" name="hiddeninputresponseTimePoliceStation" style="color: #FFFFFF;" value="${raForms.responseTimePoliceStation}" id="tresponseTimePoliceStation"/>
                                        <input type="hidden" name="hiddeninputnearestFireStation" style="color: #FFFFFF;" value="${raForms.nearestFireStation}" id="tnearestFireStation"/>
                                        <input type="hidden" name="hiddeninputresponseTimeFireStation" style="color: #FFFFFF;" value="${raForms.responseTimeFireStation}" id="tresponseTimeFireStation"/>
                                        <input type="hidden" name="hiddeninputaccessibilityForFireFighters" style="color: #FFFFFF;" value="${raForms.accessibilityForFireFighters}" id="taccessibilityForFireFighters"/>
                                        <input type="hidden" name="hiddeninputboilerInstalled" style="color: #FFFFFF;" value="${raForms.boilerInstalled}" id="tboilerInstalled"/>
                                        <input type="hidden" name="hiddeninputboilerInstalledInUse" style="color: #FFFFFF;" value="${raForms.boilerInstalledInUse}" id="tboilerInstalledInUse"/>
                                        <input type="hidden" name="hiddeninputboilerMake" style="color: #FFFFFF;" value="${raForms.boilerMake}" id="tboilerMake"/>
                                        <input type="hidden" name="hiddeninputboilerType" style="color: #FFFFFF;" value="${raForms.boilerType}" id="tboilerType"/>
                                        <input type="hidden" name="hiddeninputboilerHeatedBy" style="color: #FFFFFF;" value="${raForms.boilerHeatedBy}" id="tboilerHeatedBy"/>
                                        <input type="hidden" name="hiddeninputboilerFitnessCertificate" style="color: #FFFFFF;" value="${raForms.boilerFitnessCertificate}" id="tboilerFitnessCertificate"/>
                                        <input type="hidden" name="hiddeninputgeneratorInstalled" style="color: #FFFFFF;" value="${raForms.generatorInstalled}" id="tgeneratorInstalled"/>
                                        <input type="hidden" name="hiddeninputgeneratorInstalledInUse" style="color: #FFFFFF;" value="${raForms.generatorInstalledInUse}" id="tgeneratorInstalledInUse"/>
                                        <input type="hidden" name="hiddeninputgeneratorMake" style="color: #FFFFFF;" value="${raForms.generatorMake}" id="tgeneratorMake"/>
                                        <input type="hidden" name="hiddeninputgeneratorCapacity" style="color: #FFFFFF;" value="${raForms.generatorCapacity}" id="tgeneratorCapacity"/>
                                        <input type="hidden" name="hiddeninputgeneratorKVA" style="color: #FFFFFF;" value="${raForms.generatorKVA}" id="tgeneratorKVA"/>
                                        <input type="hidden" name="hiddeninputgeneraorFuel" style="color: #FFFFFF;" value="${raForms.generatorFuel}" id="tgeneraorFuel"/>
                                        <input type="hidden" name="hiddeninputgeneratorInterconnected" style="color: #FFFFFF;" value="${raForms.generatorInterconnected}" id="tgeneratorInterconnected"/>
                                        <input type="hidden" name="hiddeninputtransformerInstalled" style="color: #FFFFFF;" value="${raForms.transformerInstalled}" id="ttransformerInstalled"/>
                                        <input type="hidden" name="hiddeninputtransformerMake" style="color: #FFFFFF;" value="${raForms.transformerMake}" id="ttransformerMake"/>
                                        <input type="hidden" name="hiddeninputtransformerCapacity" style="color: #FFFFFF;" value="${raForms.transformerCapacity}" id="ttransformerCapacity"/>
                                        <input type="hidden" name="hiddeninputtransformerKVA" style="color: #FFFFFF;" value="${raForms.transformerKVA}" id="ttransformerKVA"/>
                                        <input type="hidden" name="hiddeninputleakagesFound" style="color: #FFFFFF;" value="${raForms.leakagesFound}" id="tleakagesFound"/>
                                        <input type="hidden" name="hiddeninputleakagesFoundDetails" style="color: #FFFFFF;" value="${raForms.leakagesFoundDetails}" id="tleakagesFoundDetails"/>
                                        <input type="hidden" name="hiddeninputmachineryCondition" style="color: #FFFFFF;" value="${raForms.machineryCondition}" id="tmachineryCondition"/>
                                        <input type="hidden" name="hiddeninputmaintenanceCarried" style="color: #FFFFFF;" value="${raForms.maintenanceCarried}" id="tmaintenanceCarried"/>
                                        <input type="hidden" name="hiddeninputsparkArrestorsFixed" style="color: #FFFFFF;" value="${raForms.sparkArrestorsFixed}" id="tsparkArrestorsFixed"/>
                                        <input type="hidden" name="hiddeninputsecurityGuardsDuty" style="color: #FFFFFF;" value="${raForms.securityGuardsDuty}" id="tsecurityGuardsDuty"/>
                                        <input type="hidden" name="hiddeninputnoOfFireFighters" style="color: #FFFFFF;" value="${raForms.noOfFireFighters}" id="tnoOfFireFighters"/>
                                        <input type="hidden" name="hiddeninputmaintenanceType" style="color: #FFFFFF;" value="${raForms.maintenanceType}" id="tmaintenanceType"/>
                                        <input type="hidden" name="hiddeninputlaborUnion" style="color: #FFFFFF;" value="${raForms.laborUnion}" id="tlaborUnion"/>
                                        <input type="hidden" name="hiddeninputhazardousMaterialName" style="color: #FFFFFF;" value="${raForms.hazardousMaterialName}" id="thazardousMaterialName"/>
                                        <input type="hidden" name="hiddeninputnoOfEmployeesDay" style="color: #FFFFFF;" value="${raForms.noOfEmployeesDay}" id="tnoOfEmployeesDay"/>
                                        <input type="hidden" name="hiddeninputnoOfEmployeesNight" style="color: #FFFFFF;" value="${raForms.noOfEmployeesNight}" id="tnoOfEmployeesNight"/>
                                        <input type="hidden" name="hiddeninputnoOfSecurityGuardsDay" style="color: #FFFFFF;" value="${raForms.noOfSecurityGuardsDay}" id="tnoOfSecurityGuardsDay"/>
                                        <input type="hidden" name="hiddeninputnoOfSecurityGuardsNight" style="color: #FFFFFF;" value="${raForms.noOfSecurityGuardsNight}" id="tnoOfSecurityGuardsNight"/>
                                        <input type="hidden" name="hiddeninputproductionCapacity" style="color: #FFFFFF;" value="${raForms.productionCapacity}" id="tproductionCapacity"/>
                                        <input type="hidden" name="hiddeninputnoOfTrainedFireFighters" style="color: #FFFFFF;" value="${raForms.noOfTrainedFireFighters}" id="tnoOfTrainedFireFighters"/>
                                        <input type="hidden" name="hiddeninputmotorTurbineCapacity" style="color: #FFFFFF;" value="${raForms.motorTurbineCapacity}" id="tmotorTurbineCapacity"/>
                                        <input type="hidden" name="hiddeninputhotWorkPermit" style="color: #FFFFFF;" value="${raForms.hotWorkPermit}" id="thotWorkPermit"/>
                                        <input type="hidden" name="hiddeninputindustries" style="color: #FFFFFF;" value="${raForms.industryType}" id="tindustries"/>
                                        <input type="hidden" name="hiddeninputpartitioningWalls" style="color: #FFFFFF;" value="${riskSpecificTextileGarmentSpinning.partitioningWalls}" id="tpartitioningWalls"/>
                                        <input type="hidden" name="hiddeninputfireproofdoorsInstalled" style="color: #FFFFFF;" value="${riskSpecificTextileGarmentSpinning.fireproofdoorsInstalled}" id="tfireproofdoorsInstalled"/>
                                        <input type="hidden" name="hiddeninputstored30feetaway" style="color: #FFFFFF;" value="${riskSpecificTextileGarmentSpinning.stored30feetaway}" id="tstored30feetaway"/>
                                        <input type="hidden" name="hiddeninputstoredstockproductionarea" style="color: #FFFFFF;" value="${riskSpecificTextileGarmentSpinning.storedstockproductionarea}" id="tstoredstockproductionarea"/>
                                        <input type="hidden" name="hiddeninputgodownswarehouseselectrified" style="color: #FFFFFF;" value="${riskSpecificTextileGarmentSpinning.godownswarehouseselectrified}" id="tgodownswarehouseselectrified"/>
                                        <input type="hidden" name="hiddeninputseparateblowrooms" style="color: #FFFFFF;" value="${riskSpecificTextileGarmentSpinning.separateblowrooms}" id="tseparateblowrooms"/>
                                        <input type="hidden" name="hiddeninputcottondustcollection" style="color: #FFFFFF;" value="${riskSpecificTextileGarmentSpinning.cottondustcollection}" id="tcottondustcollection"/>
                                        <input type="hidden" name="hiddeninputstock50feetstored" style="color: #FFFFFF;" value="${riskSpecificTextileGarmentSpinning.stock50feetstored}" id="tstock50feetstored"/>
                                        <input type="hidden" name="hiddeninputinstalledspinningmills" style="color: #FFFFFF;" value="${riskSpecificTextileGarmentSpinning.installedspinningmills}" id="tinstalledspinningmills"/>
                                        <input type="hidden" name="hiddeninputphutticottonstack50feetstored" style="color: #FFFFFF;" value="${riskSpecificCottonGinning.stack50feetstored}" id="tphutticottonstack50feetstored"/>
                                        <input type="hidden" name="hiddeninputcottonphuttistacked" style="color: #FFFFFF;" value="${riskSpecificCottonGinning.cottonphuttistacked}" id="tcottonphuttistacked"/>
                                        <input type="hidden" name="hiddeninput2500FPIBcottonbalesstrored" style="color: #FFFFFF;" value="${riskSpecificCottonGinning.fPIB2500cottonbalesstrored}" id="t2500FPIBcottonbalesstrored"/>
                                        <input type="hidden" name="hiddeninput1000FPIBcottonbalesstored" style="color: #FFFFFF;" value="${riskSpecificCottonGinning.fPIB1000cottonbalesstored}" id="t1000FPIBcottonbalesstored"/>
                                        <input type="hidden" name="hiddeninputmaximumheight6bales" style="color: #FFFFFF;" value="${riskSpecificCottonGinning.maximumheight6bales}" id="tmaximumheight6bales"/>
                                        <input type="hidden" name="hiddeninputstackdistance15feet" style="color: #FFFFFF;" value="${riskSpecificCottonGinning.stackdistance15feet}" id="tstackdistance15feet"/>
                                        <input type="hidden" name="hiddeninputlotsofbaledistance75feet" style="color: #FFFFFF;" value="${riskSpecificCottonGinning.lotsofbaledistance75feet}" id="tlotsofbaledistance75feet"/>
                                        <input type="hidden" name="hiddeninputcottonbalesdistance30feet" style="color: #FFFFFF;" value="${riskSpecificCottonGinning.cottonbalesdistance30feet}" id="tcottonbalesdistance30feet"/>
                                        <input type="hidden" name="hiddeninput10000FPIBcottonbalesstored" style="color: #FFFFFF;" value="${riskSpecificCottonGinning.fPIB10000cottonbalesstoredlocation}" id="t10000FPIBcottonbalesstored"/>
                                        <input type="hidden" name="hiddeninputstockstored50feet" style="color: #FFFFFF;" value="${riskSpecificCottonGinning.stack50feetstored}" id="tstockstored50feet"/>
                                        <input type="hidden" name="hiddeninputcombustioncovered" style="color: #FFFFFF;" value="${riskSpecificOilFeed.combustioncovered}" id="tcombustioncovered"/>
                                        <input type="hidden" name="hiddeninputcombustionsuminsuredpercent" style="color: #FFFFFF;" value="${riskSpecificOilFeed.combustionsuminsuredpercent}" id="tcombustionsuminsuredpercent"/>
                                        <input type="hidden" name="hiddeninputnoofsilosatfactory" style="color: #FFFFFF;" value="${riskSpecificOilFeed.noofsilosatfactory}" id="tnoofsilosatfactory"/>
                                        <input type="hidden" name="hiddeninputseedstored" style="color: #FFFFFF;" value="${riskSpecificOilFeed.seedstored}" id="tseedstored"/>
                                        <input type="hidden" name="hiddeninputdistancestocks4feet" style="color: #FFFFFF;" value="${riskSpecificOilFeed.distancestocks4feet}" id="tdistancestocks4feet"/>
                                        <input type="hidden" name="hiddeninputfirelanesmarked" style="color: #FFFFFF;" value="${riskSpecificOilFeed.firelanesmarked}" id="tfirelanesmarked"/>
                                        <input type="hidden" name="hiddeninputstackheight15feet" style="color: #FFFFFF;" value="${riskSpecificOilFeed.stackheight15feet}" id="tstackheight15feet"/>
                                        <input type="hidden" name="hiddeninput8000bagsstacked" style="color: #FFFFFF;" value="${riskSpecificOilFeed.bagsstacked8000}" id="t8000bagsstacked"/>
                                        <input type="hidden" name="hiddeninputgodownsventilated" style="color: #FFFFFF;" value="${riskSpecificOilFeed.godownsventilated}" id="tgodownsventilated"/>
                                        <input type="hidden" name="hiddeninputhazardouschemicalstored" style="color: #FFFFFF;" value="${riskSpecificCosmeticsChemical.hazardouschemicalstored}" id="thazardouschemicalstored"/>
                                        <input type="hidden" name="hiddeninputchemicalseparatestored" style="color: #FFFFFF;" value="${riskSpecificCosmeticsChemical.chemicalseparatestored}" id="tchemicalseparatestored"/>
                                        <input type="hidden" name="hiddeninputchemicalseparatestored30feet" style="color: #FFFFFF;" value="${riskSpecificCosmeticsChemical.chemicalseparatestored30feet}" id="tchemicalseparatestored30feet"/>
                                        <input type="hidden" name="hiddeninputrawmaterialquantity" style="color: #FFFFFF;" value="${riskSpecificCosmeticsChemical.rawmaterialquantity}" id="trawmaterialquantity"/>
                                        <input type="hidden" name="hiddeninputfireextinguishersprovided" style="color: #FFFFFF;" value="${riskSpecificCosmeticsChemical.fireextinguishersprovided}" id="tfireextinguishersprovided"/>
                                        <input type="hidden" name="hiddeninputpaperstock4inchesheight" style="color: #FFFFFF;" value="${riskSpecificPaperBoard.fourInchesHeight}" id="tpaperstock4inchesheight"/>
                                        <input type="hidden" name="hiddeninputpaperstock4inchesaway" style="color: #FFFFFF;" value="${riskSpecificPaperBoard.fourInchesAway}" id="tpaperstock4inchesaway"/>
                                        <input type="hidden" name="hiddeninputpaperstockstoredopen" style="color: #FFFFFF;" value="${riskSpecificPaperBoard.storedopen}" id="tpaperstockstoredopen"/>
                                        <input type="hidden" name="hiddeninputpaperstackefeetbelow" style="color: #FFFFFF;" value="${riskSpecificPaperBoard.stocksThreeFeetBelowCeiling}" id="tpaperstackefeetbelow"/>
                                        <input type="hidden" name="hiddeninputpapergodownselectrified" style="color: #FFFFFF;" value="${riskSpecificPaperBoard.godownselectrified}" id="tpapergodownselectrified"/>
                                        <input type="hidden" name="hiddeninputanimalsvaccinated" style="color: #FFFFFF;" value="${riskSpecificLiveStocksFarms.animalsvaccinated}" id="tanimalsvaccinated"/>
                                        <input type="hidden" name="hiddeninputpestSprayCarriedOut" style="color: #FFFFFF;" value="${riskSpecificLiveStocksFarms.pestSprayCarriedOut}" id="tpestSprayCarriedOut"/>
                                        <input type="hidden" name="hiddeninputinsuredVeterinaryDoctor" style="color: #FFFFFF;" value="${riskSpecificLiveStocksFarms.insuredVeterinaryDoctor}" id="tinsuredVeterinaryDoctor"/>
                                        <input type="hidden" name="hiddeninputinhouseMedicalEmergency" style="color: #FFFFFF;" value="${riskSpecificLiveStocksFarms.inhouseMedicalEmergency}" id="tinhouseMedicalEmergency"/>
                                        <input type="hidden" name="hiddeninputanimalsTagged" style="color: #FFFFFF;" value="${riskSpecificLiveStocksFarms.animalsTagged}" id="tanimalsTagged"/>
                                        <input type="hidden" name="hiddeninputdistanceBetweenAnimals" style="color: #FFFFFF;" value="${riskSpecificLiveStocksFarms.distanceBetweenAnimals}" id="tdistanceBetweenAnimals"/>
                                        <input type="hidden" name="hiddeninputanimalsEmergencyEvacuationMap" style="color: #FFFFFF;" value="${riskSpecificLiveStocksFarms.animalsEmergencyEvacuationMap}" id="tanimalsEmergencyEvacuationMap"/>
                                        <input type="hidden" name="hiddeninputunauthorizedEntryInFarm" style="color: #FFFFFF;" value="${riskSpecificLiveStocksFarms.unauthorizedEntryInFarm}" id="tunauthorizedEntryInFarm"/>
                                        <input type="hidden" name="hiddeninputwasteManagementFacility" style="color: #FFFFFF;" value="${riskSpecificLiveStocksFarms.wasteManagementFacility}" id="twasteManagementFacility"/>
                                        <input type="hidden" name="hiddeninputsevereWeatherResistSheds" style="color: #FFFFFF;" value="${riskSpecificLiveStocksFarms.severeWeatherResistSheds}" id="tsevereWeatherResistSheds"/>
                                        <!-- All Form Hidden Input Fields End -->

                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->

                        </form>
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
<%@ include file="/WEB-INF/views/template/footerRMSTeamEditing.jsp" %>

<script type="text/javascript">
    $(function(){
        // Submit the form
        $("a.wizard-finish").attr("href", "javascript:document.getElementById('validation').submit()");

        $(".wizard-finish").click(function(){
            if($("#twaiver").val() == "Yes waive")
            {
                setTimeout(function () {
                    swal({
                        title: "Request Delivered!",
                        text: "Your form has been successfully submitted!",
                        type: "success",
                        //confirmButtonText: "OK",
                        timer: 3500,
                        showConfirmButton: false
                    })
                });
            }
        })

        $(".above500mDetails").hide();
        $(".below500mDetails").hide();

        /* Industry dropdown values bases divs hide/show */
        $("#textileGarmentFactory").hide();
        $("#cottonGinningPressingFactory").hide();
        $("#oilfeedMills").hide();
        $("#cosmeticsChemicalFactoriesLabs").hide();
        $("#paperBoardMills").hide();
        $("#livestockfarms").hide();

    })

    var readRiskCosting = document.getElementById("readRiskCosting").value;
    var riskCostonLoad = document.getElementById("riskCostonLoad").value;
    riskCostonLoad = readRiskCosting;

    $(window).load(function(){
        var industryType = "<c:out value='${raForms.industryType}'/>";
        var riskCost = "<c:out value='${raForms.riskCost}'/>";

        if (industryType == 'Specific Information for Textile/Garment Factory/Spinning Mills/Weaving Mills') {
            $("#textileGarmentFactory").show();
            $("#cottonGinningPressingFactory").hide();
            $("#oilfeedMills").hide();
            $("#cosmeticsChemicalFactoriesLabs").hide();
            $("#paperBoardMills").hide();
            $("#livestockfarms").hide();
        }
        else if (industryType == 'Specific Information for Cotton Factory/Cotton Ginning/Pressing Factory') {
            $("#textileGarmentFactory").hide();
            $("#cottonGinningPressingFactory").show();
            $("#oilfeedMills").hide();
            $("#cosmeticsChemicalFactoriesLabs").hide();
            $("#paperBoardMills").hide();
            $("#livestockfarms").hide();
        }
        else if (industryType == 'Specific Information for Oil & Feed Mills') {
            $("#textileGarmentFactory").hide();
            $("#cottonGinningPressingFactory").hide();
            $("#oilfeedMills").show();
            $("#cosmeticsChemicalFactoriesLabs").hide();
            $("#paperBoardMills").hide();
            $("#livestockfarms").hide();
        }
        else if (industryType == 'Specific Information for Cosmetics/Chemical Factories/Labs') {
            $("#textileGarmentFactory").hide();
            $("#cottonGinningPressingFactory").hide();
            $("#oilfeedMills").hide();
            $("#cosmeticsChemicalFactoriesLabs").show();
            $("#paperBoardMills").hide();
            $("#livestockfarms").hide();
        }
        else if (industryType == 'Specific Information for Paper or Board Mills' && raForms.riskCost.equals('Above 500 million')) {
            $("#textileGarmentFactory").hide();
            $("#cottonGinningPressingFactory").hide();
            $("#oilfeedMills").hide();
            $("#cosmeticsChemicalFactoriesLabs").hide();
            $("#paperBoardMills").show();
            $("#livestockfarms").hide();
        }
        else if (industryType == 'Specific Information for Livestock, Farms') {
            $("#textileGarmentFactory").hide();
            $("#cottonGinningPressingFactory").hide();
            $("#oilfeedMills").hide();
            $("#cosmeticsChemicalFactoriesLabs").hide();
            $("#paperBoardMills").hide();
            $("#livestockfarms").show();
        }

        /* subject matter checked start */

        var subjectMatter = "<c:out value='${raForms.subjectMatter}'/>";
        $("#tsubjectMatter").val(subjectMatter);
        var subjectMatterArr = subjectMatter.split(",");
        var i;
        for(i = 0;i<=subjectMatterArr.length;i++)
        {
            if(subjectMatterArr[i] == "Machinery"){
                $("#machinery").prop('checked', true);
            }
            else if(subjectMatterArr[i] == "Stock"){
                $("#stock").prop('checked', true);
            }
            else if(subjectMatterArr[i] == "Building"){
                $("#building").prop('checked', true);
            }
            else if(subjectMatterArr[i] == "Generator"){
                $("#generator").prop('checked', true);
            }
            else if(subjectMatterArr[i] == "Bolier"){
                $("#boiler").prop('checked', true);
            }
        }

        /* subject matter checked end */

        /* waiver checked start */

        var waiver = "<c:out value='${raForms.waiver}'/>";
        $("#twaiver").val(waiver);
        var waiverArr = waiver.split(",");
        var i;
        for(i = 0;i<=waiverArr.length;i++)
        {
            if(waiverArr[i] == "Yes waive"){
                $("#waiverYes").prop('checked', true);
                $(".yeswaiver").show();
                $(".nowaiver").hide();
            }
            else if(waiverArr[i] == "No waive"){
                $("#waiverNo").prop('checked', true);
                $(".nowaiver").show();
                $(".yeswaiver").hide();
            }
        }

        /* waiver checked end */

        /* premises owned/rented checked start */

        var premisesOwnership = "<c:out value='${raForms.premisesOwnedRented}'/>";
        $("#tpremisesOwnedRented").val(premisesOwnership);
        var premisesOwnershipArr = premisesOwnership.split(",");
        var i;
        for(i = 0;i<=premisesOwnershipArr.length;i++)
        {
            if(premisesOwnershipArr[i] == "Owned"){
                $("#owned").prop('checked', true);
            }
            else if(premisesOwnershipArr[i] == "Rented"){
                $("#rented").prop('checked', true);
            }
        }

        /* premises owned/rented checked end */

        /* multiple tenancy checked start */

        var multipletenancy = "<c:out value='${raForms.multipleTenancy}'/>";
        $("#tmultipleTenancy").val(multipletenancy);
        var multipletenancyArr = multipletenancy.split(",");
        var i;
        for(i = 0;i<=multipletenancyArr.length;i++)
        {
            if(multipletenancyArr[i] == "Yes"){
                $("#tenancyyes").prop('checked', true);
            }
            else if(multipletenancyArr[i] == "No"){
                $("#tenancyno").prop('checked', true);
            }
        }

        /* multiple tenancy checked end */

        /* premises surrounding checked start */

        var premisesSurrounding = "<c:out value='${raForms.premisesSurrounding}'/>";
        $("#tpremisesSurrounding").val(premisesSurrounding);
        var premisesSurroundingArr = premisesSurrounding.split(",");
        var i;
        for(i = 0;i<=premisesSurroundingArr.length;i++)
        {
            if(premisesSurroundingArr[i] == "Front"){
                $("#front").prop('checked', true);
            }
            else if(premisesSurroundingArr[i] == "Back"){
                $("#back").prop('checked', true);
            }
            else if(premisesSurroundingArr[i] == "Left"){
                $("#left").prop('checked', true);
            }
            else if(premisesSurroundingArr[i] == "Right"){
                $("#right").prop('checked', true);
            }
        }

        if(!$("#front").is(":checked")){
            $("#frontSurrondings").hide();
        }else if(!$("#back").is(":checked")){
            $("#backSurrondings").hide();
        }else if(!$("#left").is(":checked")){
            $("#leftSurrondings").hide();
        }if(!$("#right").is(":checked")){
            $("#rightSurrondings").hide();
        }

        /* premises surrounding checked end */

        /* roof type checked start */

        var rooftype = "<c:out value='${raForms.roofType}'/>";
        $("#troofType").val(rooftype);
        var rooftypeArr = rooftype.split(",");
        var i;
        for(i = 0;i<=rooftypeArr.length;i++)
        {
            if(rooftypeArr[i] == "Concrete Cement"){
                $("#concrete").prop('checked', true);
            }
            else if(rooftypeArr[i] == "Asbestos Sheet"){
                $("#asbestos").prop('checked', true);
            }
            else if(rooftypeArr[i] == "Tin Sheets"){
                $("#tin").prop('checked', true);
            }
            else if(rooftypeArr[i] == "Pre-Cast"){
                $("#pre-cast").prop('checked', true);
            }
            else if(rooftypeArr[i] == "Concrete Slab"){
                $("#slab").prop('checked', true);
            }
        }

        /* roof type checked end */

        /* plinth level checked start */

        var plinthLevel = "<c:out value='${raForms.plinthLevel}'/>";
        $("#tplinthLevel").val(plinthLevel);
        var plinthLevelArr = plinthLevel.split(",");
        var i;
        for(i = 0;i<=plinthLevelArr.length;i++)
        {
            if(plinthLevelArr[i] == "Above"){
                $("#above").prop('checked', true);
            }
            else if(plinthLevelArr[i] == "Below"){
                $("#below").prop('checked', true);
            }
            else if(plinthLevelArr[i] == "Same"){
                $("#same").prop('checked', true);
            }
            else if(plinthLevelArr[i] == "Road Level"){
                $("#roadLevel").prop('checked', true);
            }
        }

        /* plinth level checked end */

        /* floor condition checked start */

        var floorCondition = "<c:out value='${raForms.floorCondition}'/>";
        $("#tfloorCondition").val(floorCondition);
        var floorConditionArr = floorCondition.split(",");
        var i;
        for(i = 0;i<=floorConditionArr.length;i++)
        {
            if(floorConditionArr[i] == "Satisfactory"){
                $("#satisfactory").prop('checked', true);
            }
            else if(floorConditionArr[i] == "Need Improvement"){
                $("#improvements").prop('checked', true);
            }
        }

        /* floor condition checked end */

        /* electric wiring checked start */

        var electricWiring = "<c:out value='${raForms.electricityWiring}'/>";
        $("#telectricWiring").val(electricWiring);
        var electricWiringArr = electricWiring.split(",");
        var i;
        for(i = 0;i<=electricWiringArr.length;i++)
        {
            if(electricWiringArr[i] == "Conduit"){
                $("#conduit").prop('checked', true);
            }
            else if(electricWiringArr[i] == "Concealed"){
                $("#concealed").prop('checked', true);
            }
            else if(electricWiringArr[i] == "Open"){
                $("#open").prop('checked', true);
            }
            else if(electricWiringArr[i] == "Loose in some areas"){
                $("#loose").prop('checked', true);
            }
            else if(electricWiringArr[i] == "Needs Improvement"){
                $("#needImprove").prop('checked', true);
            }
            else if(electricWiringArr[i] == "Not Applicable"){
                $("#notApplicablee").prop('checked', true);
            }
        }

        /* electric wiring checked end */

        /* house keeping checked start */

        var houseKeeping = "<c:out value='${raForms.houseKeeping}'/>";
        $("#thouseKeeping").val(houseKeeping);
        var houseKeepingArr = houseKeeping.split(",");
        var i;
        for(i = 0;i<=houseKeepingArr.length;i++)
        {
            if(houseKeepingArr[i] == "Satisfactory"){
                $("#satisfy").prop('checked', true);
            }
            else if(houseKeepingArr[i] == "Needs Improvement"){
                $("#need").prop('checked', true);
            }
            else if(houseKeepingArr[i] == "Not Aplicable"){
                $("#notApplicables").prop('checked', true);
            }
        }

        /* house keeping checked end */

        /* cigarette smoking checked start */

        var cigaretteSmoking = "<c:out value='${raForms.cigaretteSmoking}'/>";
        $("#tcigaretteSmoking").val(cigaretteSmoking);
        var cigaretteSmokingArr = cigaretteSmoking.split(",");
        var i;
        for(i = 0;i<=cigaretteSmokingArr.length;i++)
        {
            if(cigaretteSmokingArr[i] == "Smoking"){
                $("#smoke").prop('checked', true);
            }
            else if(cigaretteSmokingArr[i] == "Non-Smoking"){
                $("#nonSmoke").prop('checked', true);
            }
        }

        /* cigarette smoking checked end */

        /* storage arrangements checked start */

        var storageArrangements = "<c:out value='${raForms.storageArrangements}'/>";
        $("#tstorageArrangements").val(storageArrangements);
        var storageArrangementsArr = storageArrangements.split(",");
        var i;
        for(i = 0;i<=storageArrangementsArr.length;i++)
        {
            if(storageArrangementsArr[i] == "Satisfactory"){
                $("#arrangesatisfactory").prop('checked', true);
            }
            else if(storageArrangementsArr[i] == "Need Improvement"){
                $("#arrangeimprovements").prop('checked', true);
            }
        }

        /* storage arrangements checked end */

        /* raw material stored checked start */

        var rawMaterialStored = "<c:out value='${raForms.rawMaterialStored}'/>";
        $("#trawMaterialStored").val(rawMaterialStored);
        var rawMaterialStoredArr = rawMaterialStored.split(",");
        var i;
        for(i = 0;i<=rawMaterialStoredArr.length;i++)
        {
            if(rawMaterialStoredArr[i] == "Separate Godown"){
                $("#godown").prop('checked', true);
            }
            else if(rawMaterialStoredArr[i] == "Process Area"){
                $("#processArea").prop('checked', true);
            }
            else if(rawMaterialStoredArr[i] == "Open"){
                $("#openStorage").prop('checked', true);
            }
            else if(rawMaterialStoredArr[i] == "Not Applicable"){
                $("#notApplicablese").prop('checked', true);
            }
        }

        /* raw material stored checked end */

        /* stored in checked start */

        var storedIn = "<c:out value='${raForms.storedIn}'/>";
        $("#tstoredIn").val(storedIn);
        var storedInArr = storedIn.split(",");
        var i;
        for(i = 0;i<=storedInArr.length;i++)
        {
            if(storedInArr[i] == "Separate Godown"){
                $("#storedgodown").prop('checked', true);
            }
            else if(storedInArr[i] == "Process Area"){
                $("#storedprocessArea").prop('checked', true);
            }
            else if(storedInArr[i] == "Open"){
                $("#storedopenStorage").prop('checked', true);
            }
        }

        /* stored in checked end */

        /* type cylinders checked start */

        var typeCylinders = "<c:out value='${raForms.typeCylinders}'/>";
        $("#ttypeCylinders").val(typeCylinders);
        var typeCylindersArr = typeCylinders.split(",");
        var i;
        for(i = 0;i<=typeCylindersArr.length;i++)
        {
            if(typeCylindersArr[i] == "Yes"){
                $("#typeYes").prop('checked', true);
                if(!($("#noofCylinders").val() == "")){
                    $("#typeofCylinders").show();
                }
            }
            else if(typeCylindersArr[i] == "No"){
                $("#typeNo").prop('checked', true);
                $("#typeofCylinders").hide();
            }
        }

        /* type cylinders checked end */

        /* hazardous material stored checked start */

        var hazardousMaterialStored = "<c:out value='${raForms.hazardousMaterialStored}'/>";
        $("#thazardousMaterialStored").val(hazardousMaterialStored);
        var hazardousMaterialStoredArr = hazardousMaterialStored.split(",");
        var i;
        for(i = 0;i<=hazardousMaterialStoredArr.length;i++)
        {
            if(hazardousMaterialStoredArr[i] == "Yes"){
                $("#hazardousYes").prop('checked', true);
            }
            else if(hazardousMaterialStoredArr[i] == "No"){
                $("#hazardousNo").prop('checked', true);
            }
        }

        /* hazardous material stored checked end */

        /* night work checked start */

        var nightWork = "<c:out value='${raForms.nightWork}'/>";
        $("#tnightWork").val(nightWork);
        var nightWorkArr = nightWork.split(",");
        var i;
        for(i = 0;i<=nightWorkArr.length;i++)
        {
            if(nightWorkArr[i] == "Yes"){
                $("#nightWorkYes").prop('checked', true);
            }
            else if(nightWorkArr[i] == "No"){
                $("#nightWorkYes").prop('checked', true);
            }
        }

        /* night work checked end */

        /* warehouses electrified checked start */

        var warehousesElectrified = "<c:out value='${raForms.nightWork}'/>";
        $("#twarehousesElectrified").val(warehousesElectrified);
        var warehousesElectrifiedArr = warehousesElectrified.split(",");
        var i;
        for(i = 0;i<=warehousesElectrifiedArr.length;i++)
        {
            if(warehousesElectrifiedArr[i] == "Yes"){
                $("#electricYes").prop('checked', true);
            }
            else if(warehousesElectrifiedArr[i] == "No"){
                $("#electricNo").prop('checked', true);
            }
        }

        /* warehouses electrified checked end */

        /* security arrangement checked start */

        var securityArrangement = "<c:out value='${raForms.securityArrangement}'/>";
        $("#tsecurityArrangement").val(securityArrangement);
        var securityArrangementArr = securityArrangement.split(",");
        var i;
        for(i = 0;i<=securityArrangementArr.length;i++)
        {
            if(securityArrangementArr[i] == "Satisfactory"){
                $("#securitySatisfactory").prop('checked', true);
            }
            else if(securityArrangementArr[i] == "Needs Improvement"){
                $("#securityImprove").prop('checked', true);
            }
        }

        /* security arrangement checked end */

        /* cctv cameras checked start */

        var cctvCameras = "<c:out value='${raForms.cctvCameras}'/>";
        $("#tcctvCameras").val(cctvCameras);
        var cctvCamerasArr = cctvCameras.split(",");
        var i;
        for(i = 0;i<=cctvCamerasArr.length;i++)
        {
            if(cctvCamerasArr[i] == "Yes"){
                $("#cctvYes").prop('checked', true);
                if($("#noofcctvCameras").val() != ""){
                    $("#cameras").show();
                }
            }
            else if(cctvCamerasArr[i] == "No"){
                $("#cctvNo").prop('checked', true);
                $("#cameras").hide();
            }
        }

        /* cctv cameras checked end */

        /* fire fighting team checked start */

        var fireFightingTeam = "<c:out value='${raForms.fireFightingTeam}'/>";
        $("#tfireFightingTeam").val(fireFightingTeam);
        var fireFightingTeamArr = fireFightingTeam.split(",");
        var i;
        for(i = 0;i<=fireFightingTeamArr.length;i++)
        {
            if(fireFightingTeamArr[i] == "Yes"){
                $("#fireTeamYes").prop('checked', true);
            }
            else if(cctvCamerasArr[i] == "No"){
                $("#fireTeamNo").prop('checked', true);
            }
        }

        /* fire fighting team checked end */


        /* fire exits provided checked start */

        var fireExitsProvided = "<c:out value='${raForms.fireExitsProvided}'/>";
        $("#tfireExitsProvided").val(fireExitsProvided);
        var fireExitsProvidedArr = fireExitsProvided.split(",");
        var i;
        for(i = 0;i<=fireExitsProvidedArr.length;i++)
        {
            if(fireExitsProvidedArr[i] == "Yes"){
                $("#fireExitsYes").prop('checked', true);
            }
            else if(fireExitsProvidedArr[i] == "No"){
                $("#fireExitsNo").prop('checked', true);
            }
        }

        /* fire exits provided checked end */

        /* hydrant system provided checked start */

        var hydrantSystem = "<c:out value='${raForms.hydrantSystem}'/>";
        $("#thydrantSystem").val(hydrantSystem);
        var hydrantSystemArr = hydrantSystem.split(",");
        var i;
        for(i = 0;i<=hydrantSystemArr.length;i++)
        {
            if(hydrantSystemArr[i] == "Yes"){
                $("#hydrantSystemYes").prop('checked', true);
                if($("#noofHydrantPoints").val() == "" || $("#noofFireHoses").val() == "" || $("#hydrantpumpCapacity").val() == "" || $("#hydrantPressure").val() == ""){
                    $("#hydrantSystem").hide();
                }
                else{
                    $("#hydrantSystem").show();
                }
            }
            else if(hydrantSystemArr[i] == "No"){
                $("#hydrantSystemNo").prop('checked', true);
            }
        }

        /* hydrant system provided checked end */

        /* hydrant pump operates checked start */

        var hydrantPumpOperates = "<c:out value='${raForms.hydrantPumpOperates}'/>";
        $("#thydrantPumpOperates").val(hydrantPumpOperates);
        var hydrantPumpOperatesArr = hydrantPumpOperates.split(",");
        var i;
        for(i = 0;i<=hydrantPumpOperatesArr.length;i++)
        {
            if(hydrantPumpOperatesArr[i] == "Yes"){
                $("#hydrantPumpOperatesYes").prop('checked', true);
            }
            else if(hydrantPumpOperatesArr[i] == "No"){
                $("#hydrantPumpOperatesNo").prop('checked', true);
            }
        }

        /* hydrant pump operates checked end */

        /* electricity supply provided checked start */

        var electricitySupply = "<c:out value='${raForms.electricitySupply}'/>";
        $("#telectricitySupply").val(electricitySupply);
        var electricitySupplyArr = electricitySupply.split(",");
        var i;
        for(i = 0;i<=electricitySupplyArr.length;i++)
        {
            if(electricitySupplyArr[i] == "Public Electric Supply"){
                $("#publicSupply").prop('checked', true);
            }
            else if(electricitySupplyArr[i] == "In House"){
                $("#inHouse").prop('checked', true);
            }
            else if(electricitySupplyArr[i] == "Power House"){
                $("#powerHouse").prop('checked', true);
            }
            else if(electricitySupplyArr[i] == "Generators"){
                $("#generators").prop('checked', true);
            }
            else if(electricitySupplyArr[i] == "Not Applicable"){
                $("#notApplicablees").prop('checked', true);
            }
        }

        /* electricity supply provided checked end */

        /* sources of water supply provided checked start */

        var sourcesOfWaterSupply = "<c:out value='${raForms.sourcesOfWaterSupply}'/>";
        $("#tsourcesOfWaterSupply").val(sourcesOfWaterSupply);
        var sourcesOfWaterSupplyArr = sourcesOfWaterSupply.split(",");
        var i;
        for(i = 0;i<=sourcesOfWaterSupplyArr.length;i++)
        {
            if(sourcesOfWaterSupplyArr[i] == "Public Main"){
                $("#publicMain").prop('checked', true);
            }
            else if(sourcesOfWaterSupplyArr[i] == "Tube Well"){
                $("#tubeWell").prop('checked', true);
            }
            else if(sourcesOfWaterSupplyArr[i] == "Tankers"){
                $("#tankers").prop('checked', true);
            }
            else if(sourcesOfWaterSupplyArr[i] == "Bore"){
                $("#bore").prop('checked', true);
            }
            else if(sourcesOfWaterSupplyArr[i] == "Not Applicable"){
                $("#notApplicable").prop('checked', true);
            }
        }

        /* sources of water supply provided checked end */

        /* fire alarm installed provided checked start */

        var fireAlarmInstalled = "<c:out value='${raForms.fireAlarmInstalled}'/>";
        $("#tfireAlarmInstalled").val(fireAlarmInstalled);
        var fireAlarmInstalledArr = fireAlarmInstalled.split(",");
        var i;
        for(i = 0;i<=fireAlarmInstalledArr.length;i++)
        {
            if(fireAlarmInstalledArr[i] == "Yes"){
                $("#fireAlarmYes").prop('checked', true);
            }
            else if(fireAlarmInstalledArr[i] == "No"){
                $("#fireAlarmNo").prop('checked', true);
            }
        }

        /* fire alarm installed provided checked end */

        /* sprinkler system installed checked start */

        var sprinklerSystemInstalled = "<c:out value='${raForms.sprinklerSystemInstalled}'/>";
        $("#tsprinklerSystemInstalled").val(sprinklerSystemInstalled);
        var sprinklerSystemInstalledArr = sprinklerSystemInstalled.split(",");
        var i;
        for(i = 0;i<=sprinklerSystemInstalledArr.length;i++)
        {
            if(sprinklerSystemInstalledArr[i] == "Yes"){
                $("#sprinklerSystemYes").prop('checked', true);
            }
            else if(sprinklerSystemInstalledArr[i] == "No"){
                $("#sprinklerSystemNo").prop('checked', true);
            }
        }

        /* sprinkler system installed checked end */

        /* smoke detectors installed checked start */

        var smokeDetectorsInstalled = "<c:out value='${raForms.smokeDetectorsInstalled}'/>";
        $("#tsmokeDetectorsInstalled").val(smokeDetectorsInstalled);
        var smokeDetectorsInstalledArr = smokeDetectorsInstalled.split(",");
        var i;
        for(i = 0;i<=smokeDetectorsInstalledArr.length;i++)
        {
            if(smokeDetectorsInstalledArr[i] == "Yes"){
                $("#smokeDetectorsYes").prop('checked', true);
            }
            else if(smokeDetectorsInstalledArr[i] == "No"){
                $("#smokeDetectorsNo").prop('checked', true);
            }
        }

        /* smoke detectors installed checked end */

        /* accessibility for fire fighters provided checked start */

        var accessibilityForFireFighters = "<c:out value='${raForms.accessibilityForFireFighters}'/>";
        $("#taccessibilityForFireFighters").val(accessibilityForFireFighters);
        var accessibilityForFireFightersArr = accessibilityForFireFighters.split(",");
        var i;
        for(i = 0;i<=accessibilityForFireFightersArr.length;i++)
        {
            if(accessibilityForFireFightersArr[i] == "Satisfactory"){
                $("#accessibilityFireFightersSatisfactory").prop('checked', true);
            }
            else if(accessibilityForFireFightersArr[i] == "Un-Satisfactory"){
                $("#accessibilityFireFightersUnSatisfactory").prop('checked', true);
            }
        }

        /* accessibility for fire fighters provided checked end */

        /**********************************************************/
        /* boiler installed with child details div checked start */

        var boilerInstalled = "<c:out value='${raForms.boilerInstalled}'/>";
        $("#tboilerInstalled").val(boilerInstalled);
        var boilerInstalledArr = boilerInstalled.split(",");
        var i;
        for(i = 0;i<=boilerInstalledArr.length;i++)
        {
            if(boilerInstalledArr[i] == "Yes"){
                $("#boilerInstalledYes").prop('checked', true);
                /*if($("#boilerInstalledInUse").val() == "" || $("#boilerMake").val() == "" || $("#boilerType").val() == "" || boilerHeatedBy == ""){
                    $("#boilerDetails").hide();
                }*/
                $("#boilerDetails").show();
            }
            else if(boilerInstalledArr[i] == "No"){
                $("#boilerInstalledNo").prop('checked', true);
                $("#boilerDetails").hide();
            }
        }

        /* boiler heated checked start */
        var boilerHeatedBy = "<c:out value='${raForms.boilerHeatedBy}'/>";
        $("#tboilerHeatedBy").val(boilerHeatedBy);
        var boilerHeatedByArr = boilerHeatedBy.split(",");
        var i;
        for(i = 0;i<=boilerHeatedByArr.length;i++)
        {
            if(boilerHeatedByArr[i] == "Gas"){
                $("#gas").prop('checked', true);
            }
            else if(boilerHeatedByArr[i] == "Electricity"){
                $("#electricity").prop('checked', true);
            }
            else if(boilerHeatedByArr[i] == "Oil"){
                $("#oil").prop('checked', true);
            }
            else if(boilerHeatedByArr[i] == "Bio Fuel"){
                $("#biofuel").prop('checked', true);
            }
        }

        /* boiler heated checked end */

        /* boiler fitness certificate checked start */

        var boilerFitnessCertificate = "<c:out value='${raForms.boilerFitnessCertificate}'/>";
        $("#tboilerFitnessCertificate").val(boilerFitnessCertificate);
        var boilerFitnessCertificateArr = boilerFitnessCertificate.split(",");
        var i;
        for(i = 0;i<=boilerFitnessCertificateArr.length;i++)
        {
            if(boilerFitnessCertificateArr[i] == "Yes"){
                $("#shownProvidedYes").prop('checked', true);
            }
            else if(boilerFitnessCertificateArr[i] == "No"){
                $("#shownProvidedNo").prop('checked', true);
            }
        }

        /* boiler fitness certificate checked end */

        /* boiler installed with child details div checked  end */
        /********************************************************/

        /* generator installed with child details div checked start */

        var generatorInstalled = "<c:out value='${raForms.generatorInstalled}'/>";
        $("#tgeneratorInstalled").val(generatorInstalled);
        var generatorFuel = "<c:out value='${raForms.generatorFuel}'/>";
        $("#tgeneraorFuel").val(generatorFuel);
        var generatorInterconnected = "<c:out value='${raForms.generatorInterconnected}'/>";
        $("#tgeneratorInterconnected").val(generatorInterconnected);
        var generatorInstalledArr = generatorInstalled.split(",");
        var i;
        for(i = 0;i<=generatorInstalledArr.length;i++)
        {
            if(generatorInstalledArr[i] == "Yes"){
                $("#generatorInstalledYes").prop('checked', true);
                if(!($("#generatorInstalledInUse").val() == "" || $("#generatorMake").val() == "" || $("#generatorCapacity").val() == "" || $("#generatorKVA").val() == "" || generatorFuel == "" || generatorInterconnected == "")){
                    $("#generatorDetails").show();
                }
            }
            else if(generatorInstalledArr[i] == "No"){
                $("#generatorInstalledNo").prop('checked', true);
                $("#generatorDetails").hide();
            }
        }

        /* generator fuel certificate checked start */

        var generatorFuelArr = generatorFuel.split(",");
        var i;
        for(i = 0;i<=generatorFuelArr.length;i++)
        {
            if(generatorFuelArr[i] == "Diesel"){
                $("#diesel").prop('checked', true);
            }
            else if(generatorFuelArr[i] == "Petrol"){
                $("#petrol").prop('checked', true);
            }
            else if(generatorFuelArr[i] == "Gas"){
                $("#gas").prop('checked', true);
            }
            else if(generatorFuelArr[i] == "Kerosene"){
                $("#kerosene").prop('checked', true);
            }
        }

        /* generator fuel certificate checked end */

        /* generator interconnected checked start */

        var generatorInterconnectedArr = generatorInterconnected.split(",");
        var i;
        for(i = 0;i<=generatorInterconnectedArr.length;i++)
        {
            if(generatorInterconnectedArr[i] == "Yes"){
                $("#interconnectedYes").prop('checked', true);
            }
            else if(generatorInterconnectedArr[i] == "No"){
                $("#interconnectedNo").prop('checked', true);
            }
        }

        /* generator interconnected checked end */

        /* generator installed with child details div  checked end */
        /***********************************************************/

        /* transformer installed with child details div checked start  */

        var transformerInstalled = "<c:out value='${raForms.transformerInstalled}'/>";
        $("#ttransformerInstalled").val(transformerInstalled);
        var transformerInstalledArr = transformerInstalled.split(",");
        var i;
        for(i = 0;i<=transformerInstalledArr.length;i++)
        {
            if(transformerInstalledArr[i] == "Yes"){
                $("#transformerInstalledYes").prop('checked', true);
                if($("#transformerMake").val() == "" || $("#transformerCapacity").val() == "" || $("#transformerKVA").val() == ""){
                    $("#transformerDetails").hide();
                }
                else{
                    $("#transformerDetails").show();
                }
            }
            else if(transformerInstalledArr[i] == "No"){
                $("#transformerInstalledNo").prop('checked', true);
            }
        }

        /* transformer installed with child details div checked end */
        /************************************************************/

        /* leakages found with child details div checked start  */

        var leakagesFound = "<c:out value='${raForms.leakagesFound}'/>";
        $("#tleakagesFound").val(leakagesFound);
        var leakagesFoundArr = leakagesFound.split(",");
        var i;
        for(i = 0;i<=leakagesFoundArr.length;i++)
        {
            if(leakagesFoundArr[i] == "Yes"){
                $("#leakagesFoundYes").prop('checked', true);
                if($("#leakagesFoundDetails").val() == ""){
                    $("#leakagesDetails").hide();
                }
                else{
                    $("#leakagesDetails").show();
                }
            }
            else if(transformerInstalledArr[i] == "No"){
                $("#leakagesFoundNo").prop('checked', true);
            }
        }

        /* leakages found with child details div checked end */
        /************************************************************/

        /* machinery condition checked start  */

        var machineryCondition = "<c:out value='${raForms.machineryCondition}'/>";
        $("#tmachineryCondition").val(machineryCondition);
        var machineryConditionArr = machineryCondition.split(",");
        var i;
        for(i = 0;i<=machineryConditionArr.length;i++)
        {

            if(${raForms.riskCost.equals('Below 500 million')})
            {
                if(machineryConditionArr[i] == "Satisfactory"){
                    $("#machineryConditionSatisfactory").prop('checked', true);
                }
                else if(machineryConditionArr[i] == "Needs Improvement"){
                    $("#machineryConditionImprove").prop('checked', true);
                }
            }

            else if(${raForms.riskCost.equals('Above 500 million')})
            {
                if(machineryConditionArr[i] == "Worn-Out"){
                    $("#wornout").prop('checked', true);
                }
                else if(machineryConditionArr[i] == "Old"){
                    $("#old").prop('checked', true);
                }
                else if(machineryConditionArr[i] == "Well Maintained"){
                    $("#wellmaintained").prop('checked', true);
                }
                else if(machineryConditionArr[i] == "Poor"){
                    $("#poor").prop('checked', true);
                }
                else if(machineryConditionArr[i] == "New"){
                    $("#new").prop('checked', true);
                }
            }


        }

        /* machinery condition checked end */
        /************************************************************/

        /* maintenance carried with child details div checked start  */

        var maintenanceCarried = "<c:out value='${raForms.maintenanceCarried}'/>";
        $("#tmaintenanceCarried").val(maintenanceCarried);
        var maintenanceType = "<c:out value='${raForms.maintenanceType}'/>";
        $("#tmaintenanceType").val(maintenanceType);
        var maintenanceCarriedArr = maintenanceCarried.split(",");
        var i;
        for(i = 0;i<=maintenanceCarriedArr.length;i++)
        {
            if(${raForms.riskCost.equals('Below 500 million')})
            {
                if(maintenanceCarriedArr[i] == "Yes"){
                    $("#maintenanceCarriedYes").prop('checked', true);
                }
                else if(maintenanceCarriedArr[i] == "No"){
                    $("#maintenanceCarriedNo").prop('checked', true);
                }
            }

            else if(${raForms.riskCost.equals('Above 500 million')})
            {
                if(maintenanceCarriedArr[i] == "Yes"){
                    $("#maintenanceYes").prop('checked', true);
                    if(maintenanceType == ""){
                        $("#maintenanceDetails").hide();
                    }
                    else{
                        $("#maintenanceDetails").show();
                    }
                }
                else if(maintenanceCarriedArr[i] == "No"){
                    $("#maintenanceNo").prop('checked', true);
                }

                var maintenanceTypeArr = maintenanceType.split(",");
                var i;
                for(i = 0;i<=maintenanceTypeArr.length;i++)
                {
                    if(maintenanceTypeArr[i] == "Corrective Maintenance"){
                        $("#correctiveMaintenance").prop('checked', true);
                    }
                    else if(maintenanceTypeArr[i] == "Preventive Maintenance"){
                        $("#preventiveMaintenance").prop('checked', true);
                    }
                }
            }
        }

        /* machinery condition with child details div checked end */
        /************************************************************/

        /* spark arrestors fixed checked start  */

        var sparkArrestorsFixed = "<c:out value='${raForms.sparkArrestorsFixed}'/>";
        $("#tsparkArrestorsFixed").val(sparkArrestorsFixed);
        var sparkArrestorsFixedArr = sparkArrestorsFixed.split(",");
        var i;
        for(i = 0;i<=sparkArrestorsFixedArr.length;i++)
        {
            if(${raForms.riskCost.equals('Below 500 million')})
            {
                if(sparkArrestorsFixedArr[i] == "Yes"){
                    $("#sparkArrestorsFixedYes").prop('checked', true);
                }
                else if(sparkArrestorsFixedArr[i] == "No"){
                    $("#sparkArrestorsFixedNo").prop('checked', true);
                }
            }
            else if(${raForms.riskCost.equals('Above 500 million')})
            {
                if(sparkArrestorsFixedArr[i] == "Yes"){
                    $("#sparkArrestorsYes").prop('checked', true);
                }
                else if(sparkArrestorsFixedArr[i] == "No"){
                    $("#sparkArrestorsNo").prop('checked', true);
                }
            }
        }

        /* spark arrestors fixed checked end */
        /************************************************************/

        /* labor union fixed checked start  */

        var laborUnion = "<c:out value='${raForms.laborUnion}'/>";
        $("#tlaborUnion").val(laborUnion);
        var laborUnionArr = laborUnion.split(",");
        var i;
        for(i = 0;i<=laborUnionArr.length;i++)
        {
            if(laborUnionArr[i] == "Yes"){
                $("#laborUnionYes").prop('checked', true);
            }
            else if(laborUnionArr[i] == "No"){
                $("#laborUnionNo").prop('checked', true);
            }
        }

        /* labor union fixed checked end */
        /************************************************************/

        /* hot wWork permit checked start  */

        var hotWorkPermit = "<c:out value='${raForms.hotWorkPermit}'/>";
        $("#thotWorkPermit").val(hotWorkPermit);
        var hotWorkPermitArr = laborUnion.split(",");
        var i;
        for(i = 0;i<=hotWorkPermitArr.length;i++)
        {
            if(hotWorkPermitArr[i] == "Yes"){
                $("#hotWorkPermitYes").prop('checked', true);
            }
            else if(hotWorkPermitArr[i] == "No"){
                $("#hotWorkPermitNo").prop('checked', true);
            }
        }

        /* hot wWork permit checked end */
        /************************************************************/

        /* security guards duty checked start  */

        var securityGuardsDuty = "<c:out value='${raForms.securityGuardsDuty}'/>";
        $("#tsecurityGuardsDuty").val(securityGuardsDuty);
        var securityGuardsDutyArr = securityGuardsDuty.split(",");
        var i;
        for(i = 0;i<=securityGuardsDutyArr.length;i++)
        {
            if(securityGuardsDutyArr[i] == "Yes"){
                $("#securityGuardsDutyYes").prop('checked', true);
            }
            else if(securityGuardsDutyArr[i] == "No"){
                $("#securityGuardsDutyNo").prop('checked', true);
            }
        }

        /* security guards duty checked end */

        /************************************************************/
        /************************************************************/
        /************************************************************/

        /* risk specific textile garment spinning checked start  */

        var partitioningWalls = "<c:out value='${riskSpecificTextileGarmentSpinning.partitioningWalls}'/>";
        var partitioningWallsArr = partitioningWalls.split(",");
        var i;
        for(i = 0;i<=partitioningWallsArr.length;i++)
        {
            if(partitioningWallsArr[i] == "Yes"){
                $("#partitioningWallsYes").prop('checked', true);
            }
            else if(partitioningWallsArr[i] == "No"){
                $("#partitioningWallsNo").prop('checked', true);
            }
        }

        var fireproofdoorsInstalled = "<c:out value='${riskSpecificTextileGarmentSpinning.fireproofdoorsInstalled}'/>";
        var fireproofdoorsInstalledArr = fireproofdoorsInstalled.split(",");
        var i;
        for(i = 0;i<=fireproofdoorsInstalledArr.length;i++)
        {
            if(fireproofdoorsInstalledArr[i] == "Yes"){
                $("#fireproofdoorsInstalledYes").prop('checked', true);
            }
            else if(fireproofdoorsInstalledArr[i] == "No"){
                $("#fireproofdoorsInstalledNo").prop('checked', true);
            }
        }

        var stored30feetaway = "<c:out value='${riskSpecificTextileGarmentSpinning.stored30feetaway}'/>";

        var stored30feetawayArr = stored30feetaway.split(",");
        var i;
        for(i = 0;i<=stored30feetawayArr.length;i++)
        {
            if(stored30feetawayArr[i] == "Yes"){
                $("#stored30feetawayYes").prop('checked', true);
            }
            else if(stored30feetawayArr[i] == "No"){
                $("#stored30feetawayNo").prop('checked', true);
            }
            else if(stored30feetawayArr[i] == "Not Available"){
                $("#stored30feetawayNA").prop('checked', true);
            }
        }

        var storedstockproductionarea = "<c:out value='${riskSpecificTextileGarmentSpinning.storedstockproductionarea}'/>";

        var storedstockproductionareaArr = storedstockproductionarea.split(",");
        var i;
        for(i = 0;i<=storedstockproductionareaArr.length;i++)
        {
            if(storedstockproductionareaArr[i] == "Yes"){
                $("#storedstockproductionareaYes").prop('checked', true);
            }
            else if(storedstockproductionareaArr[i] == "No"){
                $("#storedstockproductionareaNo").prop('checked', true);
            }
        }

        var godownswarehouseselectrified = "<c:out value='${riskSpecificTextileGarmentSpinning.godownswarehouseselectrified}'/>";

        var godownswarehouseselectrifiedArr = godownswarehouseselectrified.split(",");
        var i;
        for(i = 0;i<=godownswarehouseselectrifiedArr.length;i++)
        {
            if(godownswarehouseselectrifiedArr[i] == "Yes"){
                $("#godownswarehouseselectrifiedYes").prop('checked', true);
            }
            else if(godownswarehouseselectrifiedArr[i] == "No"){
                $("#godownswarehouseselectrifiedNo").prop('checked', true);
            }
        }

        var separateblowrooms = "<c:out value='${riskSpecificTextileGarmentSpinning.separateblowrooms}'/>";

        var separateblowroomsArr = separateblowrooms.split(",");
        var i;
        for(i = 0;i<=separateblowroomsArr.length;i++)
        {
            if(separateblowroomsArr[i] == "Yes"){
                $("#separateblowroomsYes").prop('checked', true);
            }
            else if(separateblowroomsArr[i] == "No"){
                $("#separateblowroomsNo").prop('checked', true);
            }
        }

        var cottondustcollection = "<c:out value='${riskSpecificTextileGarmentSpinning.cottondustcollection}'/>";

        var cottondustcollectionArr = cottondustcollection.split(",");
        var i;
        for(i = 0;i<=cottondustcollectionArr.length;i++)
        {
            if(cottondustcollectionArr[i] == "Yes"){
                $("#cottondustcollectionYes").prop('checked', true);
            }
            else if(cottondustcollectionArr[i] == "No"){
                $("#cottondustcollectionNo").prop('checked', true);
            }
        }

        var stock50feetstored = "<c:out value='${riskSpecificTextileGarmentSpinning.stock50feetstored}'/>";

        var stock50feetstoredArr = stock50feetstored.split(",");
        var i;
        for(i = 0;i<=stock50feetstoredArr.length;i++)
        {
            if(stock50feetstoredArr[i] == "Yes"){
                $("#stock50feetstoredYes").prop('checked', true);
            }
            else if(stock50feetstoredArr[i] == "No"){
                $("#stock50feetstoredNo").prop('checked', true);
            }
        }

        /* risk specific textile garment spinning checked end */

        /* risk specific cotton ginning checked start  */

        var phutticottonstack50feetstored = "<c:out value='${riskSpecificCottonGinning.phutticottonstack50feetstored}'/>";

        var phutticottonstack50feetstoredArr = phutticottonstack50feetstored.split(",");
        var i;
        for(i = 0;i<=phutticottonstack50feetstoredArr.length;i++)
        {
            if(phutticottonstack50feetstoredArr[i] == "Yes"){
                $("#phutticottonstack50feetstoredYes").prop('checked', true);
            }
            else if(phutticottonstack50feetstoredArr[i] == "No"){
                $("#phutticottonstack50feetstoredNo").prop('checked', true);
            }
        }

        var cottonphuttistacked = "<c:out value='${riskSpecificCottonGinning.cottonphuttistacked}'/>";

        var cottonphuttistackedArr = cottonphuttistacked.split(",");
        var i;
        for(i = 0;i<=cottonphuttistackedArr.length;i++)
        {
            if(cottonphuttistackedArr[i] == "Yes"){
                $("#cottonphuttistackedYes").prop('checked', true);
            }
            else if(cottonphuttistackedArr[i] == "No"){
                $("#cottonphuttistackedNo").prop('checked', true);
            }
        }

        var fPIB2500cottonbalesstrored = "<c:out value='${riskSpecificCottonGinning.fPIB2500cottonbalesstrored}'/>";

        var fPIB2500cottonbalesstroredArr = fPIB2500cottonbalesstrored.split(",");
        var i;
        for(i = 0;i<=fPIB2500cottonbalesstroredArr.length;i++)
        {
            if(fPIB2500cottonbalesstroredArr[i] == "Yes"){
                $("#2500FPIBcottonbalesstroredYes").prop('checked', true);
            }
            else if(fPIB2500cottonbalesstroredArr[i] == "No"){
                $("#2500FPIBcottonbalesstroredNo").prop('checked', true);
            }
        }

        var fPIB1000cottonbalesstored = "<c:out value='${riskSpecificCottonGinning.fPIB1000cottonbalesstored}'/>";

        var fPIB1000cottonbalesstoredArr = fPIB1000cottonbalesstored.split(",");
        var i;
        for(i = 0;i<=fPIB1000cottonbalesstoredArr.length;i++)
        {
            if(fPIB1000cottonbalesstoredArr[i] == "Yes"){
                $("#1000FPIBcottonbalesstoredYes").prop('checked', true);
            }
            else if(fPIB1000cottonbalesstoredArr[i] == "No"){
                $("#1000FPIBcottonbalesstoredNo").prop('checked', true);
            }
        }

        var maximumheight6bales = "<c:out value='${riskSpecificCottonGinning.maximumheight6bales}'/>";

        var maximumheight6balesArr = maximumheight6bales.split(",");
        var i;
        for(i = 0;i<=maximumheight6balesArr.length;i++)
        {
            if(maximumheight6balesArr[i] == "Yes"){
                $("#maximumheight6balesYes").prop('checked', true);
            }
            else if(maximumheight6balesArr[i] == "No"){
                $("#maximumheight6balesNo").prop('checked', true);
            }
        }

        var stackdistance15feet = "<c:out value='${riskSpecificCottonGinning.stackdistance15feet}'/>";

        var stackdistance15feetArr = stackdistance15feet.split(",");
        var i;
        for(i = 0;i<=stackdistance15feetArr.length;i++)
        {
            if(stackdistance15feetArr[i] == "Yes"){
                $("#stackdistance15feetYes").prop('checked', true);
            }
            else if(stackdistance15feetArr[i] == "No"){
                $("#stackdistance15feetNo").prop('checked', true);
            }
        }

        var lotsofbaledistance75feet = "<c:out value='${riskSpecificCottonGinning.lotsofbaledistance75feet}'/>";

        var lotsofbaledistance75feetArr = lotsofbaledistance75feet.split(",");
        var i;
        for(i = 0;i<=lotsofbaledistance75feetArr.length;i++)
        {
            if(lotsofbaledistance75feetArr[i] == "Yes"){
                $("#lotsofbaledistance75feetYes").prop('checked', true);
            }
            else if(lotsofbaledistance75feetArr[i] == "No"){
                $("#lotsofbaledistance75feetNo").prop('checked', true);
            }
        }

        var cottonbalesdistance30feet = "<c:out value='${riskSpecificCottonGinning.cottonbalesdistance30feet}'/>";

        var cottonbalesdistance30feetArr = cottonbalesdistance30feet.split(",");
        var i;
        for(i = 0;i<=cottonbalesdistance30feetArr.length;i++)
        {
            if(lotsofbaledistance75feetArr[i] == "Yes"){
                $("#cottonbalesdistance30feetYes").prop('checked', true);
            }
            else if(lotsofbaledistance75feetArr[i] == "No"){
                $("#cottonbalesdistance30feetNo").prop('checked', true);
            }
        }

        var fPIB10000cottonbalesstoredlocation = "<c:out value='${riskSpecificCottonGinning.fPIB10000cottonbalesstoredlocation}'/>";

        var fPIB10000cottonbalesstoredlocationArr = fPIB10000cottonbalesstoredlocation.split(",");
        var i;
        for(i = 0;i<=fPIB10000cottonbalesstoredlocationArr.length;i++)
        {
            if(fPIB10000cottonbalesstoredlocationArr[i] == "Yes"){
                $("#10000FPIBcottonbalesstoredYes").prop('checked', true);
            }
            else if(fPIB10000cottonbalesstoredlocationArr[i] == "No"){
                $("#10000FPIBcottonbalesstoredNo").prop('checked', true);
            }
        }

        var stack50feetstored = "<c:out value='${riskSpecificCottonGinning.stack50feetstored}'/>";

        var stack50feetstoredArr = stack50feetstored.split(",");
        var i;
        for(i = 0;i<=stack50feetstoredArr.length;i++)
        {
            if(stack50feetstoredArr[i] == "Yes"){
                $("#stockstored50feetYes").prop('checked', true);
            }
            else if(stack50feetstoredArr[i] == "No"){
                $("#stockstored50feetNo").prop('checked', true);
            }
        }

        /* risk specific cotton ginning checked end */

        /* risk specific oil feed checked start  */

        var combustioncovered = "<c:out value='${riskSpecificOilFeed.combustioncovered}'/>";

        var combustioncoveredArr = combustioncovered.split(",");
        var i;
        for(i = 0;i<=combustioncoveredArr.length;i++)
        {
            if(combustioncoveredArr[i] == "Yes"){
                $("#combustioncoveredYes").prop('checked', true);
                if($("#combustionsuminsuredpercent").val() == ""){
                    $("#combustioncovereddetails").hide();
                }
                else{
                    $("#combustioncovereddetails").show();
                }
            }
            else if(combustioncoveredArr[i] == "No"){
                $("#combustioncoveredNo").prop('checked', true);
            }
        }

        var seedstored = "<c:out value='${riskSpecificOilFeed.seedstored}'/>";

        var seedstoredArr = seedstored.split(",");
        var i;
        for(i = 0;i<=seedstoredArr.length;i++)
        {
            if(seedstoredArr[i] == "Yes"){
                $("#seedstoredYes").prop('checked', true);
            }
            else if(seedstoredArr[i] == "No"){
                $("#seedstoredNo").prop('checked', true);
            }
        }

        var distancestocks4feet = "<c:out value='${riskSpecificOilFeed.distancestocks4feet}'/>";

        var distancestocks4feetArr = distancestocks4feet.split(",");
        var i;
        for(i = 0;i<=distancestocks4feetArr.length;i++)
        {
            if(distancestocks4feetArr[i] == "Yes"){
                $("#distancestocks4feetYes").prop('checked', true);
            }
            else if(distancestocks4feetArr[i] == "No"){
                $("#distancestocks4feetNo").prop('checked', true);
            }
        }

        var firelanesmarked = "<c:out value='${riskSpecificOilFeed.firelanesmarked}'/>";

        var firelanesmarkedArr = firelanesmarked.split(",");
        var i;
        for(i = 0;i<=firelanesmarkedArr.length;i++)
        {
            if(firelanesmarkedArr[i] == "Yes"){
                $("#firelanesmarkedYes").prop('checked', true);
            }
            else if(firelanesmarkedArr[i] == "No"){
                $("#firelanesmarkedNo").prop('checked', true);
            }
        }

        var stackheight15feet = "<c:out value='${riskSpecificOilFeed.stackheight15feet}'/>";

        var stackheight15feetArr = stackheight15feet.split(",");
        var i;
        for(i = 0;i<=stackheight15feetArr.length;i++)
        {
            if(stackheight15feetArr[i] == "Yes"){
                $("#stackheight15feetYes").prop('checked', true);
            }
            else if(stackheight15feetArr[i] == "No"){
                $("#stackheight15feetNo").prop('checked', true);
            }
        }

        var bagsstacked8000 = "<c:out value='${riskSpecificOilFeed.bagsstacked8000}'/>";

        var bagsstacked8000Arr = bagsstacked8000.split(",");
        var i;
        for(i = 0;i<=bagsstacked8000Arr.length;i++)
        {
            if(bagsstacked8000Arr[i] == "Yes"){
                $("#8000bagsstackedYes").prop('checked', true);
            }
            else if(bagsstacked8000Arr[i] == "No"){
                $("#8000bagsstackedNo").prop('checked', true);
            }
        }

        var godownsventilated = "<c:out value='${riskSpecificOilFeed.godownsventilated}'/>";

        var godownsventilatedArr = godownsventilated.split(",");
        var i;
        for(i = 0;i<=godownsventilatedArr.length;i++)
        {
            if(godownsventilatedArr[i] == "Yes"){
                $("#godownsventilatedYes").prop('checked', true);
            }
            else if(godownsventilatedArr[i] == "No"){
                $("#godownsventilatedNo").prop('checked', true);
            }
        }

        /* risk specific oil feed checked end  */

        /* risk specific cosmetics chemical checked start  */

        var hazardouschemicalstored = "<c:out value='${riskSpecificCosmeticsChemical.hazardouschemicalstored}'/>";

        var hazardouschemicalstoredArr = hazardouschemicalstored.split(",");
        var i;
        for(i = 0;i<=hazardouschemicalstoredArr.length;i++)
        {

            if(hazardouschemicalstoredArr[i] == "Alcohol"){
                $("#alcohol").prop('checked', true);
            }
            else if(hazardouschemicalstoredArr[i] == "Varnish"){
                $("#varnish").prop('checked', true);
            }
            else if(hazardouschemicalstoredArr[i] == "Lacquer"){
                $("#lacquer").prop('checked', true);
            }
            else if(hazardouschemicalstoredArr[i] == "Fragrances"){
                $("#fragrances").prop('checked', true);
            }
            else if(hazardouschemicalstoredArr[i] == "Propylene Glycol"){
                $("#propyleneglycol").prop('checked', true);
            }
            else if(hazardouschemicalstoredArr[i] == "Ethanol"){
                $("#ethanol").prop('checked', true);
            }
            else if(hazardouschemicalstoredArr[i] == "Polyox"){
                $("#polyox").prop('checked', true);
            }
        }

        var chemicalseparatestored = "<c:out value='${riskSpecificCosmeticsChemical.chemicalseparatestored}'/>";

        var chemicalseparatestoredArr = chemicalseparatestored.split(",");
        var i;
        for(i = 0;i<=chemicalseparatestoredArr.length;i++)
        {

            if(chemicalseparatestoredArr[i] == "Alcohol"){
                $("#chemicalseparatestoredYes").prop('checked', true);
            }
            else if(chemicalseparatestoredArr[i] == "Varnish"){
                $("#chemicalseparatestoredNo").prop('checked', true);
            }
        }

        var chemicalseparatestored30feet = "<c:out value='${riskSpecificCosmeticsChemical.chemicalseparatestored30feet}'/>";

        var chemicalseparatestored30feetArr = chemicalseparatestored30feet.split(",");
        var i;
        for(i = 0;i<=chemicalseparatestored30feetArr.length;i++)
        {

            if(chemicalseparatestored30feetArr[i] == "Alcohol"){
                $("#chemicalseparatestored30feetYes").prop('checked', true);
            }
            else if(chemicalseparatestored30feetArr[i] == "Varnish"){
                $("#chemicalseparatestored30feetNo").prop('checked', true);
            }
        }

        var rawmaterialquantity = "<c:out value='${riskSpecificCosmeticsChemical.rawmaterialquantity}'/>";

        var rawmaterialquantityArr = rawmaterialquantity.split(",");
        var i;
        for(i = 0;i<=rawmaterialquantityArr.length;i++)
        {

            if(rawmaterialquantityArr[i] == "Nil"){
                $("#nil").prop('checked', true);
            }
            else if(rawmaterialquantityArr[i] == "Enough for one day"){
                $("#oneday").prop('checked', true);
            }
            else if(rawmaterialquantityArr[i] == "Enough for one week"){
                $("#oneweek").prop('checked', true);
            }
            else if(rawmaterialquantityArr[i] == "Enough for more than one week"){
                $("#moreoneweek").prop('checked', true);
            }
        }

        var fireextinguishersprovided = "<c:out value='${riskSpecificCosmeticsChemical.fireextinguishersprovided}'/>";

        var fireextinguishersprovidedArr = fireextinguishersprovided.split(",");
        var i;
        for(i = 0;i<=fireextinguishersprovidedArr.length;i++)
        {

            if(fireextinguishersprovidedArr[i] == "Yes"){
                $("#fireextinguishersprovidedYes").prop('checked', true);
            }
            else if(fireextinguishersprovidedArr[i] == "No"){
                $("#fireextinguishersprovidedNo").prop('checked', true);
            }
        }

        /* risk specific cosmetics chemical checked end  */

        /* paper board mills checked start  */

        var fourInchesHeight = "<c:out value='${riskSpecificPaperBoard.fourInchesHeight}'/>";
        var fourInchesHeightArr = fourInchesHeight.split(",");
        var i;
        for(i = 0;i<=fourInchesHeightArr.length;i++)
        {
            if(fourInchesHeightArr[i] == "Yes"){
                $("#paperstock4inchesheightYes").prop('checked', true);
            }
            else if(fourInchesHeightArr[i] == "No"){
                $("#paperstock4inchesheightNo").prop('checked', true);
            }
        }

        var fourInchesAway = "<c:out value='${riskSpecificPaperBoard.fourInchesAway}'/>";
        var fourInchesAwayArr = fourInchesAway.split(",");
        var i;
        for(i = 0;i<=fourInchesAwayArr.length;i++)
        {
            if(fourInchesAwayArr[i] == "Yes"){
                $("#paperstock4inchesawayYes").prop('checked', true);
            }
            else if(fourInchesAwayArr[i] == "No"){
                $("#paperstock4inchesawayNo").prop('checked', true);
            }
        }

        var storedopen = "<c:out value='${riskSpecificPaperBoard.storedopen}'/>";

        var storedopenArr = storedopen.split(",");
        var i;
        for(i = 0;i<=storedopenArr.length;i++)
        {
            if(storedopenArr[i] == "Yes"){
                $("#paperstockstoredopenYes").prop('checked', true);
            }
            else if(storedopenArr[i] == "No"){
                $("#paperstockstoredopenNo").prop('checked', true);
            }
        }

        var stocksThreeFeetBelowCeiling = "<c:out value='${riskSpecificPaperBoard.stocksThreeFeetBelowCeiling}'/>";

        var stocksThreeFeetBelowCeilingArr = stocksThreeFeetBelowCeiling.split(",");
        var i;
        for(i = 0;i<=stocksThreeFeetBelowCeilingArr.length;i++)
        {
            if(stocksThreeFeetBelowCeilingArr[i] == "Yes"){
                $("#paperstackefeetbelowYes").prop('checked', true);
            }
            else if(stocksThreeFeetBelowCeilingArr[i] == "No"){
                $("#paperstackefeetbelowNo").prop('checked', true);
            }
        }

        var godownselectrified = "<c:out value='${riskSpecificPaperBoard.godownselectrified}'/>";

        var godownselectrifiedArr = godownselectrified.split(",");
        var i;
        for(i = 0;i<=godownselectrifiedArr.length;i++)
        {
            if(godownselectrifiedArr[i] == "Yes"){
                $("#papergodownselectrifiedYes").prop('checked', true);
            }
            else if(godownselectrifiedArr[i] == "No"){
                $("#papergodownselectrifiedNo").prop('checked', true);
            }
        }

        /* paper board mills checked end */
        /************************************************************/

        /* risk specific live stocks farms checked start */

        var animalsvaccinated = "<c:out value='${riskSpecificLiveStocksFarms.animalsvaccinated}'/>";

        var animalsvaccinatedArr = animalsvaccinated.split(",");
        var i;
        for(i = 0;i<=animalsvaccinatedArr.length;i++)
        {
            if(animalsvaccinatedArr[i] == "Monthly"){
                $("#monthly").prop('checked', true);
            }
            else if(animalsvaccinatedArr[i] == "Quarterly"){
                $("#quarterly").prop('checked', true);
            }
            else if(animalsvaccinatedArr[i] == "Semiannually"){
                $("#semiannually").prop('checked', true);
            }
            else if(animalsvaccinatedArr[i] == "Annually"){
                $("#annually").prop('checked', true);
            }
            else if(animalsvaccinatedArr[i] == "Seasonally"){
                $("#seasonally").prop('checked', true);
            }
        }

        var pestSprayCarriedOut = "<c:out value='${riskSpecificLiveStocksFarms.pestSprayCarriedOut}'/>";

        var pestSprayCarriedOutArr = pestSprayCarriedOut.split(",");
        var i;
        for(i = 0;i<=pestSprayCarriedOutArr.length;i++)
        {
            if(pestSprayCarriedOutArr[i] == "Monthly"){
                $("#pestmonthly").prop('checked', true);
            }
            else if(pestSprayCarriedOutArr[i] == "Quarterly"){
                $("#pestquarterly").prop('checked', true);
            }
            else if(pestSprayCarriedOutArr[i] == "Semiannually"){
                $("#pestsemiannually").prop('checked', true);
            }
            else if(pestSprayCarriedOutArr[i] == "Annually"){
                $("#pestannually").prop('checked', true);
            }
            else if(pestSprayCarriedOutArr[i] == "Seasonally"){
                $("#pestseasonally").prop('checked', true);
            }
        }

        var insuredVeterinaryDoctor = "<c:out value='${riskSpecificLiveStocksFarms.insuredVeterinaryDoctor}'/>";

        var insuredVeterinaryDoctorArr = insuredVeterinaryDoctor.split(",");
        var i;
        for(i = 0;i<=insuredVeterinaryDoctorArr.length;i++)
        {
            if(insuredVeterinaryDoctorArr[i] == "Yes"){
                $("#veterinarydoctorYes").prop('checked', true);
            }
            else if(insuredVeterinaryDoctorArr[i] == "No"){
                $("#veterinarydoctorNo").prop('checked', true);
            }
        }

        var inhouseMedicalEmergency = "<c:out value='${riskSpecificLiveStocksFarms.inhouseMedicalEmergency}'/>";

        var inhouseMedicalEmergencyArr = inhouseMedicalEmergency.split(",");
        var i;
        for(i = 0;i<=inhouseMedicalEmergencyArr.length;i++)
        {
            if(inhouseMedicalEmergencyArr[i] == "Yes"){
                $("#inhouseMedicalEmergencyYes").prop('checked', true);
            }
            else if(inhouseMedicalEmergencyArr[i] == "No"){
                $("#inhouseMedicalEmergencyNo").prop('checked', true);
            }
        }

        var animalsTagged = "<c:out value='${riskSpecificLiveStocksFarms.animalsTagged}'/>";

        var animalsTaggedArr = animalsTagged.split(",");
        var i;
        for(i = 0;i<=animalsTaggedArr.length;i++)
        {
            if(animalsTaggedArr[i] == "Yes"){
                $("#animalsTaggedYes").prop('checked', true);
            }
            else if(animalsTaggedArr[i] == "No"){
                $("#animalsTaggedNo").prop('checked', true);
            }
        }

        var distanceBetweenAnimals = "<c:out value='${riskSpecificLiveStocksFarms.distanceBetweenAnimals}'/>";

        var distanceBetweenAnimalsArr = distanceBetweenAnimals.split(",");
        var i;
        for(i = 0;i<=distanceBetweenAnimalsArr.length;i++)
        {
            if(distanceBetweenAnimalsArr[i] == "Yes"){
                $("#distanceBetweenAnimalsYes").prop('checked', true);
            }
            else if(distanceBetweenAnimalsArr[i] == "No"){
                $("#distanceBetweenAnimalsNo").prop('checked', true);
            }
        }

        var animalsEmergencyEvacuationMap = "<c:out value='${riskSpecificLiveStocksFarms.animalsEmergencyEvacuationMap}'/>";

        var animalsEmergencyEvacuationMapArr = animalsEmergencyEvacuationMap.split(",");
        var i;
        for(i = 0;i<=animalsEmergencyEvacuationMapArr.length;i++)
        {
            if(animalsEmergencyEvacuationMapArr[i] == "Yes"){
                $("#animalsEmergencyEvacuationMapYes").prop('checked', true);
            }
            else if(animalsEmergencyEvacuationMapArr[i] == "No"){
                $("#animalsEmergencyEvacuationMapNo").prop('checked', true);
            }
        }

        var unauthorizedEntryInFarm = "<c:out value='${riskSpecificLiveStocksFarms.unauthorizedEntryInFarm}'/>";

        var unauthorizedEntryInFarmArr = unauthorizedEntryInFarm.split(",");
        var i;
        for(i = 0;i<=unauthorizedEntryInFarmArr.length;i++)
        {
            if(unauthorizedEntryInFarmArr[i] == "Yes"){
                $("#unauthorizedEntryInFarmYes").prop('checked', true);
            }
            else if(unauthorizedEntryInFarmArr[i] == "No"){
                $("#unauthorizedEntryInFarmNo").prop('checked', true);
            }
        }

        var wasteManagementFacility = "<c:out value='${riskSpecificLiveStocksFarms.wasteManagementFacility}'/>";

        var wasteManagementFacilityArr = wasteManagementFacility.split(",");
        var i;
        for(i = 0;i<=wasteManagementFacilityArr.length;i++)
        {
            if(wasteManagementFacilityArr[i] == "Yes"){
                $("#wasteManagementFacilityYes").prop('checked', true);
            }
            else if(wasteManagementFacilityArr[i] == "No"){
                $("#wasteManagementFacilityNo").prop('checked', true);
            }
        }

        var severeWeatherResistSheds = "<c:out value='${riskSpecificLiveStocksFarms.severeWeatherResistSheds}'/>";

        var severeWeatherResistShedsArr = severeWeatherResistSheds.split(",");
        var i;
        for(i = 0;i<=severeWeatherResistShedsArr.length;i++)
        {
            if(severeWeatherResistShedsArr[i] == "Yes"){
                $("#severeWeatherResistShedsYes").prop('checked', true);
            }
            else if(severeWeatherResistShedsArr[i] == "No"){
                $("#severeWeatherResistShedsYes").prop('checked', true);
            }
        }

        /* risk specific live stocks farms checked end */
        /************************************************************/

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

    /* Combustion covered details hide/show */
    $(function() {
        $('input[name=combustioncovered]').on('click init-combustioncovered', function() {
            $('#combustioncovereddetails').toggle($('#combustioncoveredYes').prop('checked'));
        }).trigger('init-combustioncovered');
    })

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
