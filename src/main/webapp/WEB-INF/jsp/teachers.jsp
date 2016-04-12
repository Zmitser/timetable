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
<vaadin-grid id="sort" selection-mode="multi">
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
    <form:form id="detailsForm" method="post" class="col s12">
        <div class="modal-content">
            <h4><spring:message code="app.teachers_edit"/></h4>
            <div class="row">
                <input value="Имя студента" id="id" name="id" type="hidden" class="validate">
                <div class="row">
                    <div class="input-field col s12">
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
                <div class="row">
                    <div class="input-field col s12">
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
<script src="<c:url value="/resources/js/teachersTable.js"/>"></script>
<script src="<c:url value="/resources/js/tableUtils.js"/>"></script>
<script src="<c:url value="/resources/lib/jquery-form-validator/form-validator/jquery.form-validator.min.js"/>"></script>
<script>
    $.validate({
        modules: 'location, date, security, file, html5, toggleDisabled',
        disabledFormFilter: 'form.toggle-disabled'
    });
</script>
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