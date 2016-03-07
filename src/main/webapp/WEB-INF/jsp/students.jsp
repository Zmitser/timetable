<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="<c:url value="/resources/lib/webcomponentsjs/webcomponents-lite.min.js"/>"></script>
    <link rel="import" href="<c:url value="/resources/lib/vaadin-core-elements/vaadin-core-elements.html"/>"/>
    <c:import url="templates/head.jsp"/>
</head>
<body>
<c:import url="templates/header.jsp"/>
<div class="row">
    <div class="col offset-s5">
        <a class="waves-effect waves-light btn-large" id="add">Добавить студента</a>
    </div>
</div>

<vaadin-grid id="sort" selection-mode="multi">
    <table>
        <!-- Define the columns and their mapping to data properties. -->
        <col name="id" hidden/>
        <col name="name" sortable="true"/>
        <col name="studentGroup.name" sortable="true"/>
        <col/>
        <col/>
        <col/>
        <col/>
        <thead>
        <tr>
            <th></th>
            <th>ФИО</th>
            <th>Группа</th>
            <th></th>
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
            <h4>Редактирование студента</h4>
            <div class="row">
                <input value="Имя студента" id="id" name="id" type="hidden" class="validate">
                <input value="Имя студента" id="studentGroupId" name="studentGroupId" type="hidden" class="validate">
                <div class="row">
                    <div class="input-field col s12">
                        <input value="Имя студента" id="studentGroupName" name="studentGroupName" type="text"
                               class="validate">
                        <label for="studentGroupName">Группа</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input value="Имя студента" id="name" name="name" type="text" class="validate">
                        <label for="name">Имя</label>
                    </div>
                </div>
                <div class="file-field input-field" id="dropzone">
                    <div class="btn">
                        <span>Фото</span>
                        <input type="file">
                    </div>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" name="photo" type="text">
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input id="email" value="test@tut.by" type="email" name="email" class="validate">
                        <label for="email">Email</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="skype" name="skype" value="Skype студента" type="text" class="validate">
                        <label for="skype">Skype</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea id="descr" name="descr"
                                  class="materialize-textarea">Характеристика студента</textarea>
                        <label for="descr">Характеристика</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="phone" name="phone" value="Телефон студента" type="text" class="validate">
                        <label for="phone">Телефон</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="waves-effect waves-light btn">Сохранить</button>
        </div>
    </form:form>
</div>

<c:import url="templates/footer.jsp"/>
<script src="<c:url value="/resources/js/dmuploader.min.js"/>"></script>
<script src="<c:url value="/resources/js/studentsTable.js"/>"></script>
</body>
</html>