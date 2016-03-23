<%--
  Created by IntelliJ IDEA.
  User: Dimka
  Date: 06.03.2016
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="templates/head.jsp"/>
<body>
<c:import url="templates/header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col s12 m12">
            <div class="card">
                <div class="card-image">
                    <img class="person-image" src="">
                    <span class="card-title"></span>
                </div>
                <div class="card-content">
                    <p class="email"></p>
                    <p class="skype"></p>
                    <p class="phone"></p>
                    <p class="descr"></p>
                </div>
                <div class="card-action">
                    <a href="<c:url value="/students"/>"><spring:message key="app.back_students"/><spring:message key="app.email"/></a>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="templates/footer.jsp"/>
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
