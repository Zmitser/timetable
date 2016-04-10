<%--
  Created by IntelliJ IDEA.
  User: Dimka
  Date: 06.03.2016
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="fragments/head.jsp"/>
<body>
<c:import url="fragments/header.jsp"/>
<div class="container ">
    <div class="card-panel parent teal lighten-5">
        <h4 class="truncate card-title"></h4>
        <div class="row">
            <img class="responsive-img hoverable left person-image" style="margin-right: 10px; border: 1px solid #333" src="">
            <div class="flow-text">
                <p class="email"></p>
                <p class="skype"></p>
                <p class="phone"></p>
                <p class="descr"></p>
            </div>
        </div>
        <div class="card-action">
            <a href="<spring:url value="/students"/>"><spring:message code="app.back_students"/></a>
        </div>
    </div>
</div>
<c:import url="fragments/emailSender.jsp"/>
<c:import url="fragments/footer.jsp"/>
</body>
<script>
    var ajaxUrl = 'http://localhost:8080/ajax/user/students/';
    var array = window.location.href.split('/');
        $.ajax({
            type: "GET",
            url: ajaxUrl + array[array.length - 1],
            success: function (data) {
                $('.card-title').text(data.name);
                $('.email').text(data.email);
                $('.skype').text(data.skype);
                $('.phone').text( data.phone);
                $('.descr').text(data.descr);
                $('.person-image').attr("src","<c:url value="/resources/img/"/>" +  data.photo);
            }
        });
</script>
</html>
