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
        <div class="col offset-s5">
            <a class="waves-effect waves-light btn-large" id="add"><spring:message code="app.students_add"/></a>
        </div>
    </div>
</sec:authorize>
<vaadin-grid id="sort" selection-mode="multi">
    <table>
        <!-- Define the columns and their mapping to data properties. -->
        <col name="id" hidden/>
        <col name="email" sortable="true"/>
        <col name="role" sortable="true"/>
        <col/>
        <col/>
        <col/>
        <thead>
        <tr>
            <th></th>
            <th>Email</th>
            <th>Role</th>
            <th></th>
            <th></th>
            <th></th>
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
                        <input value="Имя студента" id="studentGroupName" name="studentGroupName" type="text"
                               class="validate">
                        <label for="studentGroupName"><spring:message code="app.group"/></label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input value="Имя студента" id="name" name="name" type="text" class="validate">
                        <label for="name"><spring:message code="app.fio"/></label>
                    </div>
                </div>
                <div class="file-field input-field" id="dropzone">
                    <div class="btn">
                        <span><spring:message code="app.photo"/></span>
                        <input type="file">
                    </div>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" name="photo" type="text">
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input id="email" value="test@tut.by" type="email" name="email" class="validate">
                        <label for="email"><spring:message code="app.email"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="skype" name="skype" value="Skype студента" type="text" class="validate">
                        <label for="skype"><spring:message code="app.skype"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea id="descr" name="descr"
                                  class="materialize-textarea"></textarea>
                        <label for="descr"><spring:message code="app.characteristic"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="phone" name="phone" value="Телефон студента" type="text" class="validate">
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
<script src="<c:url value="/resources/js/usersTable.js"/>"></script>
<c:import url="fragments/reformal.jsp"/>
</body>
</html>