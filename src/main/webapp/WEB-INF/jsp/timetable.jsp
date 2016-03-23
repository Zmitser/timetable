<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="templates/head.jsp"/>
<link rel="stylesheet" href="<c:url value="/webjars/fullcalendar/2.6.1/fullcalendar.min.css"/>">
<body>
<c:import url="templates/header.jsp"/>
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
            <h4><spring:message key="app.student_edit"/></h4>
            <input value="" id="id" name="id" type="hidden">
            <div class="row">
                <div class="input-field col s12">
                    <select class="student-group" name="studentGroupId">
                    </select>
                    <label>Выберите интересующую группу</label>
                </div>
                <div class="input-field col s12">
                    <select class="subjects" name="subjectId">
                    </select>
                    <label>Выберите интересующий предмет</label>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="datetime-local" id="startTime" name="startTime" value="date">
                        <label for="startTime">Начало</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input type="datetime-local" id="endTime" name="endTime" value="date">
                        <label for="endTime">Конец</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="waves-effect waves-light btn"><spring:message key="app.save"/></button>
            <a class="red waves-effect waves-light btn delete">Удалить</a>
        </div>
    </form:form>
</div>
<c:import url="templates/footer.jsp"/>
<script src="<c:url value="/webjars/momentjs/2.5.0/min/moment-with-langs.min.js"/>"></script>
<script src="<c:url value="/webjars/fullcalendar/2.6.1/fullcalendar.min.js"/>"></script>
<script src="<c:url value="/webjars/fullcalendar/2.6.1/lang/ru.js"/>"></script>
<script>

    (function ($) {
        form = $('#detailsForm');
        var source = '/ajax/user/timetable/';
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            eventClick: function (event, jsEvent, view) {
                $.getJSON("/ajax/user/timetable/" + event.id, function (data) {
                    $.each(data, function (key, val) {
                        form.find("input[name='" + key + "']").val(val);
                        if (key == 'group' || key == 'subject') {
//                            form.find(".students-edit input").val(val.name);
                            form.find("input[name='" + key + "']").val(val.name);
                        }
                    });
                    $('#modal1').openModal();
                })
            },
            events: source,
            eventDataTransform: function (rawEventData) {
                return {
                    id: rawEventData.id,
                    title: rawEventData.title,
                    start: rawEventData.start,
                    end: rawEventData.end
                };
            }
        });

        $('.student-group').change(function () {
            var name = $(".student-group li.active").text();
            var newSource = '/ajax/user/timetable/timetableTo/' + name;
            $('#calendar').fullCalendar('removeEventSource', source);
            $('#calendar').fullCalendar('refetchEvents');
            $('#calendar').fullCalendar('addEventSource', newSource);
            $('#calendar').fullCalendar('refetchEvents');
            source = newSource;
        });
    })(jQuery);
</script>
<script>
    $(document).ready(function () {

        $.getJSON("/ajax/user/group", function (data) {
            var optionsGroup = '<option value="' + 0 + '">' + "" + '</option>';
            ;
            for (var i = 0; i < data.length; i++) {
                optionsGroup += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
            }
            $(".student-group").html(optionsGroup);
            $('.student-group').material_select();
        });

        $.getJSON("/ajax/user/subjects/", function (data) {
            var optionsSubject = '<option value="' + 0 + '">' + "" + '</option>';
            for (var i = 0; i < data.length; i++) {
                optionsSubject += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
            }
            $(".subjects").html(optionsSubject);
            $('.subjects').material_select();
        });

        $('#add').click(function () {
            form.find(":input").val("");
//            $('#id').val(0);
            $('#modal1').openModal();
        });

        ;

    });
</script>
<script src="<c:url value="/resources/js/fullcalendarOperations.js"/>"></script>
<script>
    $(document).ready(function () {
        $('#start').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15 // Creates a dropdown of 15 years to control year
        });

        $('#end').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15 // Creates a dropdown of 15 years to control year
        });
    })
</script>


<script>

    $(document).ready(function () {

        $(document).on("click", ".delete", function (event) {
            var id = $("#id").val();
            $.ajax({
                url: "/ajax/user/timetable/" + id,
                type: "DELETE",
                success: function () {
                    $('#calendar').fullCalendar('refetchEvents');
                    $('#modal1').closeModal();
                }
            })
        })


        $(document).on("click", ".edit", function (event) {
            var id = this.name;
            $.getJSON("/ajax/user/timetable" + id, function (data) {
                $.each(data, function (key, val) {
                    form.find("input[name='" + key + "']").val(val);
                    if (key == 'student') {
                        form.find(".students-edit input").val(val.name);
                    } else if (key == 'subject') {
                        form.find(".subjects-edit input").val(val.name);
                    }
                });
                $('#modal1').openModal();
            });
        });

        function save() {
            $.ajax({
                type: "POST",
                url: "/ajax/user/timetable",
                data: form.serialize(),
                success: function (result) {
                    $('#calendar').fullCalendar('refetchEvents');
                    $('#modal1').closeModal();
                }
            });

        }

        $('#add').click(function () {
            form.find(":input").val("");
            $('#id').val(0);
            $('#studentGroupId').val(0);
            $('#modal1').openModal();
        });
        form.submit(function () {
            save();
            return false;
        });
        $("#date").pickadate({
            format: 'yyyy-mm-dd',
            formatSubmit: undefined,
            hiddenPrefix: undefined,
            hiddenSuffix: '_submit',
            hiddenName: undefined
        });
    })
</script>
<script>
</script>
</body>
</html>