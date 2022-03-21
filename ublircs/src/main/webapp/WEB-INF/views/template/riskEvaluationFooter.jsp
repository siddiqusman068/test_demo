<%--
  Created by IntelliJ IDEA.
  User: Haider Iqbal
  Date: 1/2/2021
  Time: 12:07 PM
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
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/gallery/js/animated-masonry-gallery.js"/>"></script>
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/gallery/js/jquery.isotope.min.js"/>"></script>
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/fancybox/ekko-lightbox.min.js"/>"></script>

<script type="text/javascript">
    /* Lightbox scripts */
    $(document).ready(function($) {
        // delegate calls to data-toggle="lightbox"
        $(document).delegate('*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])', 'click', function(event) {
            event.preventDefault();
            return $(this).ekkoLightbox({
                onShown: function() {
                    if (window.console) {
                        return console.log('Checking our the events huh?');
                    }
                },
                onNavigate: function(direction, itemIndex) {
                    if (window.console) {
                        return console.log('Navigating ' + direction + '. Current item: ' + itemIndex);
                    }
                }
            });
        });
        //Programatically call
        $('#open-image').click(function(e) {
            e.preventDefault();
            $(this).ekkoLightbox();
        });
        $('#open-youtube').click(function(e) {
            e.preventDefault();
            $(this).ekkoLightbox();
        });
        // navigateTo
        $(document).delegate('*[data-gallery="navigateTo"]', 'click', function(event) {
            event.preventDefault();
            var lb;
            return $(this).ekkoLightbox({
                onShown: function() {
                    lb = this;
                    $(lb.modal_content).on('click', '.modal-footer a', function(e) {
                        e.preventDefault();
                        lb.navigateTo(2);
                    });
                }
            });
        });
    });
</script>

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

<!--Style Switcher -->
<script src="<c:url value="/resources/resourcesdarktheme/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"/>"></script>
