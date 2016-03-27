<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <c:import url="templates/loginHead.jsp"/>
</head>
<body>
<div class="particles">
    <div id="login-page" class="row">
        <c:import url="templates/header.jsp"/>
        <section>
            <p><spring:message key="app.registry_or_login"/></p>
            <div class="mockup-content">
                <p>Pea horseradish azuki bean lettuce avocado asparagus okra.</p>
                <div class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed">
                    <button type="button"><spring:message key="app.login_form"/></button>
                    <div class="morph-content">
                        <div>
                            <div class="content-style-form content-style-form-1">
                                <span class="icon icon-close">Close the dialog</span>
                                <h2><spring:message key="app.login_form"/></h2>
                                <form class="login-form toggle-disabled"
                                      action="<c:url value="/spring_security_check"/>" method="POST">
                                    <p><label><spring:message key="app.email"/></label> <input class="email" type="text"
                                                                                               name='username'
                                                                                               pattern='^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
                                                                                               required="required"></p>
                                    <p><label><spring:message key="app.password"/></label> <input class="password"
                                                                                                  id="password"
                                                                                                  type="password"
                                                                                                  name='password'
                                                                                                  data-validation="length alphanumeric"
                                                                                                  data-validation-length="3-12"
                                                                                                  data-validation-error-msg="User name has to be an alphanumeric value (3-12 chars)">
                                    </p>

                                    <p>
                                        <input type="checkbox" name="_spring_security_remember_me" class="filled-in" id="remember_me"/>
                                        <label for="remember_me">Запомнить меня</label>
                                    </p>

                                    <c:if test="${!empty SPRING_SECURITY_LAST_EXCEPTION}">
                                        <p class="error"><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></p>
                                        <c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>
                                    </c:if>
                                    <p>
                                        <button type="submit" onclick="submitLoginform()"
                                                class="btn waves-effect waves-light col s12"><spring:message
                                                key="app.login_form"/></button>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div><!-- morph-button -->
                <strong class="joiner">or</strong>
                <div class="morph-button morph-button-modal morph-button-modal-3 morph-button-fixed">
                    <button type="button"><spring:message key="app.register_form"/></button>
                    <div class="morph-content">
                        <div>
                            <div class="content-style-form content-style-form-2">
                                <span class="icon icon-close">Close the dialog</span>
                                <h2><spring:message key="app.register_form"/></h2>
                                <form class="register-form toggle-disabled" method="POST">
                                    <input type="hidden" name="id" value="0">
                                    <p><label><spring:message key="app.email"/></label> <input class="email" type="text"
                                                                                               name='email'
                                                                                               pattern='^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
                                                                                               required="required"></p>
                                    <p><label><spring:message key="app.password"/> </label><input type="password"
                                                                                                  name="password_confirmation"
                                                                                                  class="password"
                                                                                                  data-validation="strength"
                                                                                                  data-validation-strength="2"/>
                                    </p>
                                    <p><label><spring:message key="app.repeat_password"/></label><input type="password"
                                                                                                        name="password"
                                                                                                        class="password"
                                                                                                        data-validation="confirmation"/>
                                    </p>
                                    <p>
                                        <button type="submit" onclick="submitRegisterForm()"
                                                class="btn waves-effect waves-light col s12"><spring:message
                                                key="app.register_form"/></button>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div><!-- morph-button -->
                <p>Kohlrabi radish okra azuki bean corn fava bean mustard tigernut juccama green bean celtuce collard
                    greens avocado quandong.</p>
            </div><!-- /form-mockup -->
        </section>
    </div>

    <div id="modal-02">
        <!--"THIS IS IMPORTANT! to close the modal, the class name has to match the name given on the ID-->
        <div id="btn-close-modal" class="close-modal-02">
            <spring:message key="app.close_modal"/>
        </div>

        <div class="modal-content">
            <div class="container">
                <div class="card-panel">
                    <div>
                        <p><spring:message key="app.glad_to_see"/></p>
                        <p><spring:message key="app.stack"/><a href="http://projects.spring.io/spring-security/">Spring
                            Security</a>,
                            <a href="http://docs.spring.io/autorepo/docs/spring/3.2.x/spring-framework-reference/html/mvc.html">Spring
                                MVC</a>,
                            <a href="http://projects.spring.io/spring-data-jpa/">Spring Data Jpa</a>,
                            <a href="http://hibernate.org/orm/">Hibernate ORM</a>,
                            <a href="http://hibernate.org/validator/">Hibernate Validator</a>,
                            <a href="http://www.slf4j.org/">SLF4J</a>,
                            <a href="http://wiki.fasterxml.com/JacksonHome">Json Jackson</a>,
                            <a href="http://www.oracle.com/technetwork/java/javaee/jsp/index.html">JSP</a>,
                            <a href="http://www.oracle.com/technetwork/java/index-jsp-135995.html">JSTL</a>,
                            <a href="http://tomcat.apache.org/">Apache Tomcat</a>,
                            <a href="http://www.webjars.org/">WebJars</a>,
                            <a href="https://vaadin.com/elements/-/element/vaadin-grid">Vaadin Grid</a>,
                            <a href="https://www.mysql.com/">MySQL</a>,
                            <a href="http://jquery.com/">jQuery</a>,
                            <a href="http://ned.im/noty/#/about">Noty</a>,
                            <a href="http://www.formvalidator.net/index.html">jQuery Form Validator</a>,
                            <a href="http://materializecss.com/">Materialize</a>,
                            <a href="https://daneden.github.io/animate.css/">Animate.css.</a>
                        </p>
                        <p><spring:message key="app.testing"/></p>
                        <p>1) login: admin@admin.ru, password: admin</p>
                        <p>2) login: user@user.by, password: user</p>
                        <p><spring:message key="app.description"/></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="templates/loginFooter.jsp"/>
<script>
    var loginForm = $(".login-form");
    var registerForm = $(".register-form");
    var ajaxUrl = 'http://localhost:8080/ajax/user/users';
    noty({
        text: "<spring:message key="app.welcome"/>",
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

    function submitLoginform() {
        loginForm.submit()
    }

    function submitRegisterForm() {
        registerForm.submit();
    }
    $(document).ajaxError(function (event, jqXHR, options, jsExc) {
        failNoty(event, jqXHR, options, jsExc);
    });

    registerForm.submit(function () {
        $.ajax({
            type: "POST",
            url: ajaxUrl,
            data: registerForm.serialize(),
            success: function () {
                successNoty("<spring:message key="app.success_registry"/>")
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
            timeout: 2000,
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
            theme: 'relax', // or 'relax'
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
</script>
</body>
</html>
