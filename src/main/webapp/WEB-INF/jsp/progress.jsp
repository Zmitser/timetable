<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="fragments/head.jsp"/>
<body>
<c:import url="fragments/header.jsp"/>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <div class="row">
        <div class="col s4">
            <a class="waves-effect waves-light btn-large" id="add">Добавить отметку</a>
        </div>
        <div class="col s4">
            <a class="waves-effect waves-light btn-large" href="<c:url value="/ajax/user/progress/downloadExcel"/>"
               id="excel">Скачать Excel таблицу успеваемости</a>
        </div>
        <div class="col s4">
            <a class="waves-effect waves-light btn-large" href="<c:url value="/ajax/user/progress/downloadPdf"/>"
               id="pdf">Скачать Pdf таблицу успеваемости</a>
        </div>
    </div>

</sec:authorize>
<div class="row">
    <div class="col s4 m4 l4">
        <div class="input-field col s12">
            <select class="students" id="student" name="student">
            </select>
            <label>Выберите интересующего студента</label>
        </div>
    </div>

    <div class="col s4 m4 l4">
        <div class="input-field col s12">
            <select class="subjects" id="subject" name="subject">
            </select>
            <label>Выберите интересующий предмет </label>
        </div>
    </div>

    <div class="col s4 m4 l4">
        <div class="input-field col s12">
            <button type="button" id="find-progress" class="waves-effect waves-light btn">Найти</button>
        </div>
    </div>
</div>


<div class="col s6 m6 l6 canvas">
    <canvas id="buyers"></canvas>
</div>
<div class="col s6 m6 l6">
    <vaadin-grid id="sort">
        <table>
            <!-- Define the columns and their mapping to data properties. -->
            <col name="id" hidden/>
            <col name="score" sortable="true"/>
            <col name="date" sortable="true"/>
            <col/>
            <col/>
            <thead>
            <tr>
                <th></th>
                <th><spring:message code="app.fio"/></th>
                <th><spring:message code="app.group"/></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
        </table>
    </vaadin-grid>
</div>
<div id="modal1" class="modal" style="max-height: 100%">
    <form:form id="detailsForm" method="post" class="col s12 toogle-disabled">
        <div class="modal-content">
            <h4><spring:message code="app.student_edit"/></h4>
            <input value="" id="id" name="id" type="hidden">
            <div class="row">
                <div class="input-field col s12">
                    <select
                            class="students tooltipped validate"
                            name="studentId"
                            required="required"
                            data-position="top"
                            data-delay="50"
                            data-tooltip="Blah-blah-blah">
                    </select>
                    <label>Выберите интересующего студента</label>
                </div>
                <div class="input-field col s12">
                    <select class="subjects  tooltipped validate"
                            name="subjectId"
                            required="required"
                            data-position="top"
                            data-delay="50"
                            data-tooltip="Blah-blah-blah">
                    </select>
                    <label>Выберите интересующий предмет</label>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text"
                               id="date"
                               name="date"
                               value="2016-01-01"
                               class="validate tooltipped"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="yyyy-mm-dd"
                               data-validation="birthdate"
                               data-validation-format="yyyy-mm-dd">
                        <label for="date">Дата</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input id="score"
                               name="score"
                               value="0"
                               type="text"
                               class="validate tooltipped"
                               required="required"
                               maxlength="10"
                               pattern="[0-9]*"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="yyyy-mm-dd">
                        <label for="score">Отметка</label>
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
<script src="<c:url value="/resources/lib/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"/>"></script>
<script src="<c:url value="/resources/js/progressInit.js"/>"></script>
<c:import url="fragments/reformal.jsp"/>
</body>
</html>