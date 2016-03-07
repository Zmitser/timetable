<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <c:import url="templates/head.jsp"/>
<body>
<c:import url="templates/header.jsp"/>

<div class="row">
    <div class="col offset-s5">
        <a class="waves-effect waves-light btn-large" id="add">Добавить преподавателя</a>
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
            <th>ФИО</th>
            <th>Телефон</th>
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
            <h4>Редактирование студента</h4>
            <div class="row">
                <input value="Имя студента" id="id" name="id" type="hidden" class="validate">
                <div class="row">
                    <div class="input-field col s12">
                        <input value="Имя преподавателя" id="name" name="name" type="text" class="validate">
                        <label for="name">Имя</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input value="Фото преподавателя" id="photo" name="photo" type="text" class="validate">
                        <label for="photo">Фото</label>
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
                        <input id="skype" name="skype" value="Skype преподавателя" type="text" class="validate">
                        <label for="skype">Skype</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea id="descr" name="descr"
                                  class="materialize-textarea">Характеристика преподавателя</textarea>
                        <label for="descr">Характеристика</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="phone" name="phone" value="Телефон преподавателя" type="text" class="validate">
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
<script src="<c:url value="/resources/js/teachersTable.js"/>"></script>
</body>
</html>