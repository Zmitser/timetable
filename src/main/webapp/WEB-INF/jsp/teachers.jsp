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
    <div class="row center-align">
        <a class="waves-effect waves-light btn-large" id="add"><spring:message code="app.teachers_add"/></a>
        <a class="waves-effect waves-light btn-large" href="<c:url value="/ajax/user/teachers/downloadExcel"/>"
           id="excel">Скачать Excel список преподавателей</a>
        <a class="waves-effect waves-light btn-large" href="<c:url value="/ajax/user/teachers/downloadPdf"/>" id="pdf">Скачать
            Pdf список Преподавателей</a>
    </div>
</sec:authorize>
<vaadin-grid id="sort">
    <table>
        <!-- Define the columns and their mapping to data properties. -->
        <col name="id" hidden/>
        <col name="name" sortable="true"/>
        <col name="phone" sortable="true"/>
        <col/>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <col/>
            <col/>
        </sec:authorize>
        <thead>
        <tr>
            <th><spring:message code="app.fio"/></th>
            <th><spring:message code="app.phone"/></th>
            <th></th>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <th></th>
                <th></th>
            </sec:authorize>
        </tr>
        </thead>
    </table>
</vaadin-grid>
<!-- Modal Structure -->

<div id="modal1" class="modal modal-fixed-footer">
    <form id="detailsForm" method="post" class="col s12">
        <div class="modal-content">
            <h4><spring:message code="app.teachers_edit"/></h4>
            <div class="row">
                <input value="Имя студента" id="id" name="id" type="hidden" class="validate">
                <div class="row">
                    <div class="input-field col s6">
                        <input value="Имя преподавателя"
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
                    <div class="input-field col s16">
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
                    <div class="input-field col s6">
                        <input id="skype"
                               name="skype"
                               value="Skype преподавателя"
                               type="text"
                               class="validate tooltipped"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="example: testuser"
                               data-valiation="length"
                               data-validation-length="3-50">
                        <label for="skype"><spring:message code="app.skype"/></label>
                    </div>
                    <div class="input-field col s6">
                        <input id="phone"
                               name="phone"
                               value="Телефон преподавателя"
                               type="text"
                               class="validate tooltipped"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="Blah-blah-blah!"
                               required="required">
                        <label for="phone"><spring:message code="app.phone"/></label>
                    </div>
                </div>
                <div class="file-field input-field" id="dropzone">
                    <div class="btn">
                        <span><spring:message code="app.photo"/></span>
                        <input type="file"
                               data-validation="mime"
                               data-validation-allowing="jpg, png, gif"
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
                        <textarea id="descr"
                                  name="descr"
                                  class="materialize-textarea validate tooltipped"
                                  data-position="top"
                                  data-delay="50"
                                  data-tooltip="Blah-blah-blah!"
                                  data-validation="length"
                                  data-validation-length="max500">

                        </textarea>
                        <label for="descr"><spring:message code="app.characteristic"/></label>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="waves-effect waves-light btn"><spring:message code="app.save"/></button>
        </div>
    </form>
</div>
<div id="modal2" class="modal" style="max-width: 900px; max-height: 100%">
    <div class="modal-content">
        <h4 class="truncate card-title"></h4>
        <div class="row">
            <img class="responsive-img hoverable left person-image"
                 style="margin-right: 10px; border: 1px solid #333; max-width: 300px; max-height: 300px"
                 src="">
            <div class="flow-text">
                <p class="email"></p>
                <p class="skype"></p>
                <p class="phone"></p>
                <p class="descr"></p>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
        </div>
    </div>
</div>

<c:import url="fragments/emailSender.jsp"/>
<c:import url="fragments/footer.jsp"/>
<script src="<c:url value="/resources/js/dmuploader.min.js"/>"></script>
<script src="<c:url value="/resources/js/teachersTable.js"/>"></script>
<script src="<c:url value="/resources/js/tableUtils.js"/>"></script>
<script src="<c:url value="/resources/lib/jquery-form-validator/form-validator/jquery.form-validator.min.js"/>"></script>
<script>
    $.validate({
        modules: 'location, date, security, file, html5, toggleDisabled',
        disabledFormFilter: 'form.toggle-disabled'
    });
    $(document).on("click", ".info", function (event) {
        var id = this.name;
        $.ajax({
            url: ajaxUrl + id,
            type: "GET",
            success: function (data) {
                $('.card-title').text(data.name);
                $('.email').text(data.email);
                $('.skype').text(data.skype);
                $('.phone').text(data.phone);
                $('.descr').text(data.descr);
                $('.person-image').attr("src", "<c:url value="/resources/img/"/>" + data.photo);
                $("#modal2").openModal();
            }
        })
    });
</script>
<c:import url="fragments/reformal.jsp"/>
</body>
</html>