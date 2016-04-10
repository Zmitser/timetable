<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="<c:url value="/resources/js/classie.js" />"></script>
<script src="<c:url value="/resources/js/uiMorphingButton_fixed.js" />"></script>
<script src="<c:url value="/webjars/materializecss/0.97.5/js/materialize.min.js"/>"></script>
<script src="<c:url value="/resources/js/logreg.js"/>"></script>

<script src="<c:url value="/resources/lib/jquery-form-validator/form-validator/jquery.form-validator.min.js"/>"></script>>
<script>
    $(document).ready(function () {
        var loginForm = $(".login-form");
        var registerForm = $(".register-form");
        var ajaxUrl = 'http://localhost:8080/ajax/user/users';
        noty({
            text: "<spring:message code="app.welcome"/>",
            theme: 'relax', // or 'relax'
            type: 'information',
            layout: 'top',
            timeout: 2000,
            animation: {
                open: 'animated bounceInLeft', // Animate.css class names
                close: 'animated bounceOutLeft', // Animate.css class names
                easing: 'swing', // unavailable - no need
                speed: 500 // unavailable - no need
            }
        });
        $(document).ajaxError(function (event, jqXHR, options, jsExc) {
            failNoty(event, jqXHR, options, jsExc);
        });
        registerForm.submit(function () {
            $.ajax({
                type: "POST",
                url: ajaxUrl,
                data: registerForm.serialize(),
                success: function () {
                    successNoty("<spring:message code="app.success_registry"/>")
                }
            });
            return false;
        });
        var failedNote;
        function closeNoty() {
            if (failedNote) {
                failedNote.close();
                failedNote = undefined;
            }
        }

        function failNoty(event, jqXHR, options, jsExc) {
            closeNoty();
            var errorInfo = $.parseJSON(jqXHR.responseText);
            failedNote = noty({
                layout: 'top',
                text: 'Failed: ' + jqXHR.statusText + "<br>" + errorInfo.cause + "<br>" + errorInfo.detail,
                theme: 'relax',
                timeout: 10000,
                type: 'error',
                animation: {
                    open: 'animated bounceInLeft', // Animate.css class names
                    close: 'animated bounceOutLeft', // Animate.css class names
                    easing: 'swing', // unavailable - no need
                    speed: 500 // unavailable - no need
                }
            });
        }
        function successNoty(text) {
            closeNoty();
            noty({
                text: text,
                theme: 'relax',
                type: 'success',
                layout: 'top',
                timeout: 2000,
                animation: {
                    open: 'animated bounceInLeft', // Animate.css class names
                    close: 'animated bounceOutLeft', // Animate.css class names
                    easing: 'swing', // unavailable - no need
                    speed: 500 // unavailable - no need
                }
            });
        }
        $.validate({
            modules: 'location, date, security, file, html5, toggleDisabled',
            disabledFormFilter: 'form.toggle-disabled'
        });
    })
</script>
