<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="fragments/head.jsp"/>
<link rel="stylesheet" href="<c:url value="/resources/lib/fullcalendar/dist/fullcalendar.min.css"/>">
<body>
<c:import url="fragments/header.jsp"/>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <div class="row">
        <div class="col offset-s5">
            <a class="waves-effect waves-light btn-large" id="add">Добавить занятие</a>
        </div>
    </div>
</sec:authorize>
<div class="row">
    <div class="col s4 m4 l4">
        <div class="input-field col s12">
            <select class="student-group" name="student">
            </select>
            <label>Выберите интересующую группу</label>
        </div>
    </div>

    <div class="col s4 m4 l4">
        <div class="input-field col s12">
            <select class="subjects" name="subject">
            </select>
            <label>Выберите интересующий предмет</label>
        </div>
    </div>

    <div class="col s4 m4 l4">
        <div class="input-field col s12">
            <button type="button" id="find-progress" class="waves-effect waves-light btn">Найти</button>
        </div>
    </div>
</div>
<div id='calendar'></div>

<div id="modal1" class="modal modal-fixed-footer">
    <form:form id="detailsForm" method="post" class="col s12">
        <div class="modal-content">
            <h4><spring:message code="app.student_edit"/></h4>
            <input value="" id="id" name="id" type="hidden">
            <div class="row">
                <div class="input-field col s12">
                    <select class="student-group tooltipped validate"
                            name="studentGroupId"
                            required="required"
                            data-position="top"
                            data-delay="50"
                            data-tooltip="Выберите группу">
                    </select>
                    <label>Выберите интересующую группу</label>
                </div>
                <div class="input-field col s12">
                    <select class="subjects tooltipped validate"
                            name="subjectId"
                            required="required"
                            data-position="top"
                            data-delay="50"
                            data-tooltip="Выберите предмет">
                    </select>
                    <label>Выберите интересующий предмет</label>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text"
                               id="startTime"
                               name="startTime"
                               value="date"
                               class="date tooltipped validate"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="Начало занятия в формате YYYY-MM-DDTHH:mm"
                               data-validation="birthdate"
                               data-validation-format="YYYY-MM-DD\\THH:mm"
                               required="required">
                        <label for="startTime">Начало</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input type="text"
                               id="endTime"
                               name="endTime"
                               value="date"
                               class="date tooltipped validate"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="Начало занятия в формате YYYY-MM-DDTHH:mm"
                               data-validation="birthdate"
                               data-validation-format="YYYY-MM-DD\\THH:mm"
                               required="required">
                        <label for="endTime">Конец</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="waves-effect waves-light btn"><spring:message code="app.save"/></button>
            <a class="red waves-effect waves-light btn delete">Удалить</a>
        </div>
    </form:form>
</div>
<c:import url="fragments/emailSender.jsp"/>
<c:import url="fragments/footer.jsp"/>
<script src="<c:url value="/resources/lib/fullcalendar/dist/fullcalendar.min.js"/>"></script>
<script src="<c:url value="/resources/lib/fullcalendar/dist/lang/ru.js"/>"></script>
<script src="<c:url value="/resources/js/timetable.js"/>"></script>
<script src="<c:url value="/resources/lib/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"/>"></script>
<c:import url="fragments/reformal.jsp"/>
</body>
</html>