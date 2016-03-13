<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <c:import url="templates/head.jsp"/>
<body>
<c:import url="templates/header.jsp"/>

<div class="row">
    <div class="col offset-s5">
        <a class="waves-effect waves-light btn-large" id="add"><spring:message key="app.teachers_add"/></a>
    </div>
</div>

<vaadin-grid id="sort" selection-mode="multi">
    <table>
        <!-- Define the columns and their mapping to data properties. -->
        <col name="name" sortable="true"/>
        <col name="phone" sortable="true"/>
        <col/>
        <col/>
        <col/>
        <thead>
        <tr>
            <th><spring:message key="app.fio"/></th>
            <th><spring:message key="app.phone"/></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
    </table>
</vaadin-grid>
<!-- Modal Structure -->

<div id="modal1" class="modal modal-fixed-footer">
    <form:form id="detailsForm" method="post" class="col s12">
        <div class="modal-content">
            <h4><spring:message key="app.teachers_edit"/></h4>
            <div class="row">
                <input value="Имя студента" id="id" name="id" type="hidden" class="validate">
                <div class="row">
                    <div class="input-field col s12">
                        <input value="Имя преподавателя" id="name" name="name" type="text" class="validate">
                        <label for="name"><spring:message key="app.fio"/></label>
                    </div>
                </div>

                <div class="file-field input-field" id="dropzone">
                    <div class="btn">
                        <span><spring:message key="app.photo"/></span>
                        <input type="file">
                    </div>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" name="photo" type="text">
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input id="email" value="test@tut.by" type="email" name="email" class="validate">
                        <label for="email"><spring:message key="app.email"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="skype" name="skype" value="Skype преподавателя" type="text" class="validate">
                        <label for="skype"><spring:message key="app.skype"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea id="descr" name="descr"
                                  class="materialize-textarea"><spring:message key="app.characteristic"/></textarea>
                        <label for="descr"><spring:message key="app.characteristic"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="phone" name="phone" value="Телефон преподавателя" type="text" class="validate">
                        <label for="phone"><spring:message key="app.phone"/></label>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="waves-effect waves-light btn"><spring:message key="app.save"/></button>
        </div>
    </form:form>
</div>

<c:import url="templates/footer.jsp"/>
<script src="<c:url value="/resources/js/dmuploader.min.js"/>"></script>
<script src="<c:url value="/resources/js/teachersTable.js"/>"></script>
</body>
</html>