<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="<c:url value="/resources/lib/webcomponentsjs/webcomponents-lite.min.js"/>"></script>
    <link rel="import" href="<c:url value="/resources/lib/vaadin-core-elements/vaadin-core-elements.html"/>"/>
    <c:import url="fragments/head.jsp"/>
</head>
<body>
<c:import url="fragments/header.jsp"/>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <div class="row">
        <div class="col s4">
            <a class="waves-effect waves-light btn-large" id="add"><spring:message code="app.students_add"/></a>
        </div>
        <div class="col s4">
            <a class="waves-effect waves-light btn-large" href="<c:url value="/ajax/user/students/downloadExcel"/>"
               id="excel">Скачать Excel список студентов</a>
        </div>
        <div class="col s4">
            <a class="waves-effect waves-light btn-large" href="<c:url value="/ajax/user/students/downloadPdf/"/>"
               id="pdf">Скачать Pdf список студентов</a>
        </div>
    </div>

</sec:authorize>
<vaadin-grid id="sort" selection-mode="multi">
    <table>
        <!-- Define the columns and their mapping to data properties. -->
        <col name="id" hidden/>
        <col name="name" sortable="true"/>
        <col name="studentGroup.name" sortable="true"/>
        <col/>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <col/>
            <col/>
        </sec:authorize>
        <thead>
        <tr>
            <th></th>
            <th><spring:message code="app.fio"/></th>
            <th><spring:message code="app.group"/></th>
            <th></th>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <th></th>
                <th></th>
            </sec:authorize>
        </tr>
        </thead>
    </table>
</vaadin-grid>

<div id="modal1" class="modal modal-fixed-footer">
    <form:form id="detailsForm" method="post" class="col s12">
        <div class="modal-content">
            <h4><spring:message code="app.student_edit"/></h4>
            <div class="row">
                <input value="Имя студента" id="id" name="id" type="hidden" class="validate">
                <input value="Имя студента" id="studentGroupId" name="studentGroupId" type="hidden" class="validate">
                <div class="row">
                    <div class="input-field col s12">
                        <input value="Имя студента"
                               id="studentGroupName"
                               name="studentGroupName"
                               type="text"
                               required="required"
                               data-valiation="length alphanumeric"
                               data-validation-length="3-12"
                               class="validate tooltipped"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="пример: 551001">
                        <label for="studentGroupName"><spring:message code="app.group"/></label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input value="Имя студента"
                               id="name"
                               name="name"
                               type="text"
                               class="validate tooltipped"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="пример: Иванов Иван Иванович"
                               required="required"
                               maxlength="300">
                        <label for="name"><spring:message code="app.fio"/></label>
                    </div>
                </div>
                <div class="file-field input-field" id="dropzone">
                    <div class="btn">
                        <span><spring:message code="app.photo"/></span>
                        <input type="file"
                               data-validation="mime"
                               data-validation-allowing="jpg,png,gif"
                               class="validate tooltipped"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="only jpg, png, gif">
                    </div>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" name="photo" type="text">
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input class="email tooltipped"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="example: user@user.by"
                               type="text"
                               name='email'
                               id="email"
                               pattern='^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
                               required="required">
                        <label for="email"><spring:message code="app.email"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="skype"
                               name="skype"
                               value="Skype студента"
                               type="text"
                               class="validate tooltipped"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="example: testuser"
                               data-valiation="length"
                               data-validation-length="3-50">
                        <label for="skype"><spring:message code="app.skype"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea id="descr"
                                  name="descr"
                                  class="materialize-textarea validate tooltipped"
                                  data-position="top"
                                  data-delay="50"
                                  data-tooltip="Blah-blah-blah!"
                                  data-validation="length"
                                  data-validation-length="max500"></textarea>
                        <label for="descr"><spring:message code="app.characteristic"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="phone"
                               name="phone"
                               value="Телефон студента"
                               type="text"
                               class="validate tooltipped"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="Blah-blah-blah!"
                               required="required">
                        <label for="phone"><spring:message code="app.phone"/></label>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="waves-effect waves-light btn"><spring:message code="app.save"/></button>
        </div>
    </form:form>
</div>
<c:import url="fragments/emailSender.jsp"/>
<c:import url="fragments/footer.jsp"/>
<script src="<c:url value="/resources/js/dmuploader.min.js"/>"></script>
<script src="<c:url value="/resources/js/studentsTable.js"/>"></script>
<script src="<c:url value="/resources/js/tableUtils.js"/>"></script>
<script src="<c:url value="/resources/lib/jquery-form-validator/form-validator/jquery.form-validator.min.js"/>"></script>
<script>
    $.validate({
        modules: 'location, date, security, file, html5, toggleDisabled',
        disabledFormFilter: 'form.toggle-disabled'
    });
</script>
</body>
</html>