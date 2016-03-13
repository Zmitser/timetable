<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="templates/head.jsp"/>
<body>
<c:import url="templates/header.jsp"/>

<canvas id="buyers" width="1000" height="400"></canvas>



<c:import url="templates/footer.jsp"/>
<script type="text/javascript">
    $(document).ready(function() {
        $.getJSON("/ajax/progress", function (result) {
            var labels = [],data=[];
            for(var item in result){
                labels.push(result[item].date);
                data.push(result[item].score);
            }

            var tempData = {
                labels : labels,
                datasets : [{
                    fillColor : "rgba(172,194,132,0.4)",
                    strokeColor : "#ACC26D",
                    pointColor : "#fff",
                    pointStrokeColor : "#9DB86D",
                    data : data
                }]
            };
            var temp = document.getElementById('buyers').getContext('2d');
            var lineChart = new Chart(temp).Line(tempData);
        });
    });
</script>
</body>
</html>