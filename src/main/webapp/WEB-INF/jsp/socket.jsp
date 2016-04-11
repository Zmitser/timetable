<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="<c:url value="/resources/lib/webcomponentsjs/webcomponents-lite.min.js"/>"></script>
    <link rel="import" href="<c:url value="/resources/lib/vaadin-core-elements/vaadin-core-elements.html"/>"/>
    <c:import url="fragments/head.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/chat.css"/>">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/nicescroll/3.5.4/jquery.nicescroll.js'></script>
    <script language="javascript" type="text/javascript">
        var claerResizeScroll, conf, insertI, lol;
        var websocket = new WebSocket("ws://localhost:8080/chatroomServerEndpont");
        conf = {
            cursorcolor: "#696c75",
            cursorwidth: "4px",
            cursorborder: "none"
        };
        lol = {
            cursorcolor: "#cdd2d6",
            cursorwidth: "4px",
            cursorborder: "none"
        };
        claerResizeScroll = function () {
            $("#texxt").val("");
            $(".messages").getNiceScroll(0).resize();
            return $(".messages").getNiceScroll(0).doScrollTop(999999, 999);
        };
        insertI = function (name, message) {
            $(".messages").append("<li class=\"i\"><div class=\"head\"><span class=\"time\">" + (new Date().getHours()) + ":" + (new Date().getMinutes()) + " AM, Today</span><span class=\"name\"> " + name + " </span></div><div class=\"message\">" + message + "</div></li>");
            claerResizeScroll();
        };

        websocket.onmessage = function processMessage(chatMessage) {
            var jsonData = JSON.parse(chatMessage.data);
            insertI(jsonData.name, jsonData.message);
        };

        function send() {
            var message = $("#texxt");
            websocket.send(JSON.stringify({'message': message.val()}));
        }
        window.onbeforeunload = function () {
            websocket.unclose = function () {
            };
            websocket.close();
        };
        $(document).ready(function () {
            $(".list-friends").niceScroll(conf);
            $(".messages").niceScroll(lol);
        });

    </script>

</head>
<body>
<c:import url="fragments/header.jsp"/>
<div class="ui">
    <div class="left-menu">
        <form action="#" class="search">
            <input placeholder="search..." type="search" name="" id="">
            <input type="submit" value="&#xf002;">
        </form>
        <menu class="list-friends">
            <li>
                <img width="50" height="50" src="http://cs625730.vk.me/v625730358/1126a/qEjM1AnybRA.jpg">
                <div class="info">
                    <div class="user">Юния Гапонович</div>
                    <div class="status on"> online</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/1">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status on"> online</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/2">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status off">left 3 min age</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/3">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status on"> online</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/4">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status off">left 4 min age</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/5">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status off">left 12 min age</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/6">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status off">left 13 min age</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/7">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status on">online</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/8">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status off">left 6 min age</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/9">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status on">online</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/10">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status off">left 1 min age</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/0">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status on">online</div>
                </div>
            </li>
            <li>
                <img width="50" height="50" src="http://lorempixel.com/50/50/people/99">
                <div class="info">
                    <div class="user">Name Fam</div>
                    <div class="status off">left 23 min age</div>
                </div>
            </li>
        </menu>
    </div>
    <div class="chat">
        <div class="top">
            <div class="avatar">
                <img width="50" height="50" src="http://cs625730.vk.me/v625730358/1126a/qEjM1AnybRA.jpg">
            </div>
            <div class="info">
                <div class="name">Юния Гапонович</div>
                <div class="count">already 1 902 messages</div>
            </div>
            <i class="fa fa-star"></i>
        </div>
        <ul class="messages"></ul>
        <div class="write-form">
            <textarea placeholder="Type your message" name="e" id="texxt" rows="2"></textarea>
            <i class="fa fa-picture-o"></i>
            <i class="fa fa-file-o"></i>
            <span class="send" onclick="send()">Send</span>
        </div>
    </div>
</div>
<c:import url="fragments/emailSender.jsp"/>
<c:import url="fragments/footer.jsp"/>
</body>
</html>