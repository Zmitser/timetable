<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <c:import url="fragments/loginHead.jsp"/>
</head>
<body>
<div class="particles">
    <div id="login-page" class="row">
        <c:import url="fragments/header.jsp"/>
        <section>
            <p><spring:message code="app.registry_or_login"/></p>
            <div class="mockup-content">
                <p>Pea horseradish azuki bean lettuce avocado asparagus okra.</p>
                <div class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed">
                    <button type="button"><spring:message code="app.login_form"/></button>
                    <div class="morph-content">
                        <div>
                            <div class="content-style-form content-style-form-1">
                                <span class="icon icon-close">Close the dialog</span>
                                <h2><spring:message code="app.login_form"/></h2>
                                <form class="login-form toggle-disabled"
                                      action="<c:url value="/spring_security_check"/>" method="POST">
                                    <p><label><spring:message code="app.email"/></label> <input class="email"
                                                                                                type="text"
                                                                                                name='username'
                                                                                                pattern='^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
                                                                                                required="required">

                                    </p>

                                    <p><label><spring:message code="app.password"/></label> <input class="password"
                                                                                                   id="password"
                                                                                                   type="password"
                                                                                                   name='password'
                                                                                                   data-valiation="length alphanumeric"
                                                                                                   data-validation-length="3-12"
                                                                                                   data-validation-error-msg="User name has to be an alphanumeric value (3-12 chars)"
                                                                                                   required="required">

                                    </p>

                                    <p>
                                        <input type="checkbox" name="_spring_security_remember_me" class="filled-in"
                                               id="remember_me"/>
                                        <label for="remember_me"><spring:message code="app.remember_me"/></label>
                                    </p>
                                    <c:if test="${!empty SPRING_SECURITY_LAST_EXCEPTION}">
                                        <p class="error"><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></p>
                                        <c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>
                                    </c:if>
                                    <p>
                                        <button type="submit"
                                                class="btn waves-effect waves-light col s12"><spring:message
                                                code="app.login_form"/></button>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div><!-- morph-button -->
                <strong class="joiner">or</strong>
                <div class="morph-button morph-button-modal morph-button-modal-3 morph-button-fixed">
                    <button type="button"><spring:message code="app.register_form"/></button>
                    <div class="morph-content">
                        <div>
                            <div class="content-style-form content-style-form-2">
                                <span class="icon icon-close">Close the dialog</span>
                                <h2><spring:message code="app.register_form"/></h2>
                                <form:form class="register-form toggle-disabled" method="POST">
                                    <input type="hidden" name="id" value="0">
                                    <p>
                                        <label><spring:message code="app.email"/>
                                        </label>
                                        <input class="email tooltipped"
                                               data-position="top"
                                               data-delay="50"
                                               data-tooltip="example: user@user.by"
                                               type="text"
                                               name='email'
                                               pattern='^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
                                               required="required">
                                        <form:errors path="email"/>
                                    </p>
                                    <p>
                                        <label><spring:message code="app.password"/></label
                                        ><input type="password"
                                                name="password_confirmation"
                                                class="password tooltipped"
                                                data-position="top"
                                                data-delay="50"
                                                data-tooltip="example: password1"
                                                data-validation="strength"
                                                data-validation-strength="2"/>
                                        <form:errors path="password"/>
                                    </p>
                                    <p>
                                        <label>
                                            <spring:message code="app.repeat_password"/></label>
                                        <input type="password"
                                               name="password"
                                               class="password tooltipped"
                                               data-position="top"
                                               data-delay="50"
                                               data-tooltip="just repeat paassword:)"
                                               data-validation="confirmation"/>
                                    </p>
                                    <p>
                                        <button type="submit"
                                                class="btn waves-effect waves-light col s12"><spring:message
                                                code="app.register_form"/></button>
                                    </p>
                                </form:form>
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
            <spring:message code="app.close_modal"/>
        </div>

        <div class="modal-content">
            <div class="container">
                <div class="card-panel">
                    <div>
                        <p><spring:message code="app.glad_to_see"/></p>
                        <p><spring:message code="app.stack"/><a href="http://projects.spring.io/spring-security/">Spring
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
                        <p><spring:message code="app.testing"/></p>
                        <p>1) login: admin@admin.ru, password: admin</p>
                        <p>2) login: user@user.by, password: user</p>
                        <p><spring:message code="app.description"/></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="fragments/loginFooter.jsp"/>
<script type="text/javascript">
    var reformalOptions = {
        project_id: 973416,
        project_host: "mytimetable.reformal.ru",
        tab_orientation: "left",
        tab_indent: "50%",
        tab_bg_color: "#F05A00",
        tab_border_color: "#FFFFFF",
        tab_image_url: "http://tab.reformal.ru/T9GC0LfRi9Cy0Ysg0Lgg0L%252FRgNC10LTQu9C%252B0LbQtdC90LjRjw==/FFFFFF/2a94cfe6511106e7a48d0af3904e3090/left/1/tab.png",
        tab_border_width: 2
    };

    (function() {
        var script = document.createElement('script');
        script.type = 'text/javascript'; script.async = true;
        script.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'media.reformal.ru/widgets/v3/reformal.js';
        document.getElementsByTagName('head')[0].appendChild(script);
    })();
</script><noscript><a href="http://reformal.ru"><img src="http://media.reformal.ru/reformal.png" /></a><a href="http://mytimetable.reformal.ru">Oтзывы и предложения для Отзывы и предложения</a></noscript>
</body>
</html>
