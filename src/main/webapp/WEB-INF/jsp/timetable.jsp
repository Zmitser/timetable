<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="templates/head.jsp"/>
<link rel="stylesheet" href="<c:url value="/webjars/fullcalendar/2.6.1/fullcalendar.min.css"/>">
<body>
<c:import url="templates/header.jsp"/>

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
//            events: '/ajaxTask',
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
</body>
</html>