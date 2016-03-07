<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="templates/head.jsp"/>
<body>
<c:import url="templates/header.jsp"/>
<div id="content">
    <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
            <div class="container">
                <br><br>
                <h1 class="header center teal-text text-lighten-2">СтудКампус</h1>
                <div class="row center">
                    <h5 class="header col s12 light">Приложение для университетов Нового времени</h5>
                </div>
                <div class="row center">
                    <a href="http://materializecss.com/getting-started.html" id="download-button"
                       class="btn-large waves-effect waves-light teal lighten-1">Поехали!</a>
                </div>
                <br><br>

            </div>
        </div>
        <div class="parallax"><img class="bg" src="<c:url value="/resources/img/background1.jpg"/>"
                                   alt="Unsplashed background img 1"></div>
    </div>
    <div class="container">
        <div class="section">
            <div class="row">
                <div class="col s12 m4">
                    <div class="icon-block">
                        <h2 class="center brown-text"><i class="material-icons">flash_on</i></h2>
                        <h5 class="center">Удобно</h5>

                        <p class="light">С помощью данного приложения вы можете всегда иметь при себе ваше расписание.</p>
                    </div>
                </div>

                <div class="col s12 m4">
                    <div class="icon-block">
                        <h2 class="center brown-text"><i class="material-icons">group</i></h2>
                        <h5 class="center">Полезно</h5>

                        <p class="light">С данным приложением можно контролировать свою успеваемость в реальном времени и
                            сравнить с успеваемостью других.</p>
                    </div>
                </div>

                <div class="col s12 m4">
                    <div class="icon-block">
                        <h2 class="center brown-text"><i class="material-icons">settings</i></h2>
                        <h5 class="center">Легко</h5>

                        <p class="light">Найди интересующего студента или преподавателя в 1 клик!</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="parallax-container valign-wrapper">
        <div class="section no-pad-bot">
            <div class="container">
                <div class="row center">
                    <h5 class="header col s12 light">Смотрится одинаково великолепно как на декстопах, так и на мобильнных устройствах</h5>
                </div>
            </div>
        </div>
        <div class="parallax"><img class="bg" src="<c:url value="/resources/img/background2.jpg"/>"
                                   alt="Unsplashed background img 2"></div>
    </div>
    <div class="container">
        <div class="section">

            <div class="row">
                <div class="col s12 center">
                    <h3><i class="mdi-content-send brown-text"></i></h3>
                    <h4>Обратная связь</h4>
                    <p class="left-align light">По всем интересующим Вас вопросам Вы можете связаться с разработчиками
                        данного приложения: sale@nailure.ru</p>
                </div>
            </div>

        </div>
    </div>
    <div class="parallax-container valign-wrapper">
        <div class="section no-pad-bot">
            <div class="container">
                <div class="row center">
                    <h5 class="header col s12 light">A modern responsive front-end framework based on Material Design</h5>
                </div>
            </div>
        </div>
        <div class="parallax"><img class="bg" src="<c:url value="/resources/img/background3.jpg"/>"
                                   alt="Unsplashed background img 3"></div>
    </div>
</div>





<c:import url="templates/footer.jsp"/>
</body>
</html>

