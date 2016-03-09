<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="templates/head.jsp"/>
<link rel="stylesheet" href="<c:url value="/webjars/fullcalendar/2.6.1/fullcalendar.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/materialFullCalendar.css"/>">
<body>
<c:import url="templates/header.jsp"/>
<div class="input-field col s12">
    <select class="student-group">
    </select>
    <label>Выберите группу</label>
</div>
<div id='calendar'></div>

<c:import url="templates/footer.jsp"/>
<script src="<c:url value="/webjars/momentjs/2.5.0/min/moment-with-langs.min.js"/>"></script>
<script src="<c:url value="/webjars/fullcalendar/2.6.1/fullcalendar.min.js"/>"></script>
<script src="<c:url value="/webjars/fullcalendar/2.6.1/lang/ru.js"/>"></script>
<script>

    (function ($) {
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            events: '/ajax/timetable',
            eventDataTransform: function (rawEventData) {
                return {
                    id: rawEventData.id,
                    title: rawEventData.title,
                    start: rawEventData.start,
                    end: rawEventData.end
                };
            }
        });
    })(jQuery);
</script>
<script>
    $(document).ready(function() {
        $.getJSON("/ajax/group", function(data){
            var options = '';
            for (var i = 0; i < data.length; i++) {
                options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
            }
            $(".student-group").html(options);
            $('select').material_select();
        });
    });
</script>
</body>
</html>