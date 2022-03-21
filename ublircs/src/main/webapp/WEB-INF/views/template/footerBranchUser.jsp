<%--
  Created by IntelliJ IDEA.
  User: Haider Iqbal
  Date: 12/29/2020
  Time: 12:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
<!-- Form Wizard JavaScript -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/jquery-wizard-master/dist/jquery-wizard.min.js"/>"></script>
<!-- FormValidation -->
<link rel="stylesheet" href="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/jquery-wizard-master/libs/formvalidation/formValidation.min.css"/>"/>
<!-- FormValidation plugin and the class supports validating Bootstrap form -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/jquery-wizard-master/libs/formvalidation/formValidation.min.js"/>"></script>
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/jquery-wizard-master/libs/formvalidation/bootstrap.min.js"/>"></script>
<!-- Custom Theme JavaScript -->
<script src="<c:url value="/resources/resourcesdarktheme/js/custom.min.js"/>"></script>
<!-- Plugin JavaScript -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/moment/moment.js"/>"></script>
<!-- Date Picker Plugin JavaScript -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js"/>"></script>
<!-- Sweet-Alert  -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/sweetalert/sweetalert.min.js"/>"></script>

<%-- Custom script holding risk cost values --%>
<script src="<c:url value="/resources/resourcesdarktheme/js/riskHoldBranchUser.js"/>"></script>
<style type="text/css">
    .help-block{
        color: red;
    }

    .readAbove,.readBelow{
        color: white;
    }
</style>

<script type="text/javascript">

    /* accordion initialization for branch user form */
    (function() {
        $('#validation').wizard({
            step: '[data-toggle="collapse"]',
            buttonsAppendTo: '.panel-collapse',
            templates: {
                buttons: function() {
                    var options = this.options;
                    return '<div class="panel-footer"><ul class="pager">' + '<li class="previous">' + '<a href="#' + this.id + '" data-wizard="back" role="button">' + options.buttonLabels.back + '</a>' + '</li>' + '<li class="next">' + '<a href="#' + this.id + '" data-wizard="next" role="button">' + options.buttonLabels.next + '</a>' + '<a href="#' + this.id + '" class="wizard-finish"  data-wizard="finish" role="button">' + options.buttonLabels.finish + '</a>' + '</li>' + '</ul></div>';
                }
            },
            onBeforeShow: function(step) {
                step.$pane.collapse('show');
            },
            onBeforeHide: function(step) {
                step.$pane.collapse('hide');
            },
            onFinish: function() {
                //$('#validation').submit();
            },
            onInit: function() {
                $('#validation').formValidation({
                    framework: 'bootstrap',
                    fields: {
                        riskCost: {
                            validators: {
                                notEmpty: {
                                    message: 'The risk cost is required'
                                },
                                /*stringLength: {
                                 min: 6,
                                 max: 30,
                                 message: 'The username must be more than 6 and less than 30 characters long'
                                 },
                                 regexp: {
                                 regexp: /^[a-zA-Z0-9_\.]+$/,
                                 message: 'The username can only consist of alphabetical, number, dot and underscore'
                                 }*/
                            }
                        },
                        waiver: {
                            validators: {
                                notEmpty: {
                                    message: 'The waiver selection is required'
                                },
                                /*stringLength: {
                                 min: 6,
                                 max: 30,
                                 message: 'The username must be more than 6 and less than 30 characters long'
                                 },
                                 regexp: {
                                 regexp: /^[a-zA-Z0-9_\.]+$/,
                                 message: 'The username can only consist of alphabetical, number, dot and underscore'
                                 }*/
                            }
                        },
                        email: {
                            validators: {
                                notEmpty: {
                                    message: 'The email address is required'
                                },
                                emailAddress: {
                                    message: 'The input is not a valid email address'
                                }
                            }
                        },
                        password: {
                            validators: {
                                notEmpty: {
                                    message: 'The password is required'
                                },
                                different: {
                                    field: 'username',
                                    message: 'The password cannot be the same as username'
                                }
                            }
                        }
                    }
                });
            },
            validator: function() {
                var fv = $('#validation').data('formValidation');
                var $this = $(this);
                // Validate the container
                fv.validateContainer($this);
                var isValidStep = fv.isValidContainer($this);
                if (isValidStep === false || isValidStep === null) {
                    return false;
                }
                return true;
            },
            onFinish: function() {
                $('#validation').submit();
                swal("Message Finish!", "Your form successfully has been submitted.").then(function() {
                    // Redirect the user
                });
            }
        });
    })();

    jQuery('#visitDate').datepicker({
        format: 'dd/mm/yyyy',
        autoclose: true,
        todayHighlight: true
    });

    jQuery("#yearBuilt").datepicker({
        format: "yyyy",
        viewMode: "years",
        minViewMode: "years",
        autoclose: true,
    });

    /*$('#lossHistoryDate').datepicker({
        format: "mm/yyyy",
        startView: "year",
        minViewMode: "months",
        autoclose: true,
    })*/
</script>

<!--Style Switcher -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"/>"></script>
