<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Dimka
  Date: 10.03.2016
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><spring:message key="app.login_form"/></title>
    <!-- CORE CSS-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/css/animate.min.css"/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
    <style type="text/css">
        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        html, body {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        body {
            background: #16a085;
            font-family: 'Montserrat', sans-serif;
            -webkit-font-smoothing: antialiased;
        }

        .particles {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

         #login-page{
            position: absolute;
            left: 25%;
            top: 50%;
            padding: 0 100px;
            width: 50%;
        }


        @media only screen and (max-width: 1000px) {
            h1 {
                font-size: 70px;
            }
        }

        @media only screen and (max-width: 800px) {
            h1 {
                font-size: 48px;
            }
            h1::after {
                height: 8px;
            }
        }

        @media only screen and (max-width: 568px) {
            #login-page {
                padding:10px 20px;
                left: 0;
                width: 100%;
            }
        }

        #modal-02 {
            width: 100%;
            text-align: center;

        }

        #btn-close-modal {
            cursor: pointer;
            color: #fff;
        }


    </style>

</head>

<body>

<div class="particles">
    <div id="login-page" class="row">
        <c:import url="templates/header.jsp"/>
        <div class="col s12 z-depth-6 card-panel">
            <form class="login-form" action="<c:url value="/spring_security_check"/>" method="POST">
                <div class="row">
                    <div class="input-field col s12 center">
                        <img src="http://w3lessons.info/logo.png" alt=""
                             class="responsive-img valign profile-image-login">
                        <p class="center login-form-text"><spring:message key="app.login_form"/></p>
                    </div>
                </div>
                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="mdi-social-person-outline prefix"></i>
                        <input class="validate" id="email" type="email" name='username'>
                        <label for="email" data-error="wrong" data-success="right" class="center-align"><spring:message
                                key="app.email"/></label>
                    </div>
                </div>
                <div class="row margin">
                    <div class="input-field col s12">
                        <i class="mdi-action-lock-outline prefix"></i>
                        <input id="password" type="password" name='password'>
                        <label for="password"><spring:message key="app.password"/></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <button type="submit" class="btn waves-effect waves-light col s12"><spring:message
                                key="app.enter"/></button>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s8 m8 l8">
                        <p class="margin medium-small"><a href="<s:url value="/register"/>"><spring:message
                                key="app.register_now"/></a></p>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div id="modal-02">
        <!--"THIS IS IMPORTANT! to close the modal, the class name has to match the name given on the ID-->
        <div id="btn-close-modal" class="close-modal-02">
            CLOSE MODAL
        </div>

        <div class="modal-content">
            <div class="container">
                <div class="card-panel">
                    <div class="flow-text">
                        <p> This is my little "pet-project" - a simple simulation of online banking.</p>
                        <p> Technology stack: Spring Security, Spring MVC, Hibernate ORM, Hibernate Validator, Log4J,
                            JSP,
                            JSTL,
                            Apache Tomcat, WebJars, DataTables plugin, Ehcache, PostgreSQL, JUnit, Hamcrest, jQuery,
                            jQuery
                            notification, Bootstrap.
                        </p>
                        <p>Accounts for testing</p>

                        <p>1) login: admin, password: password</p>

                        <p>2) login: shapka, password: legitimniy</p>

                        <p> accounts: 50500000000000000320, 30300000000000000316, 20200000000000000314,
                            10100000000000000318
                        </p>

                        <p>There are three roles in the application: user, admin and super admin.</p>

                        <p> Each user can create accounts with different currencies (USD, EUR, PLN, UAH, RUB), pay money
                            into
                            accounts, send money to his own accounts or to another user's accounts, with automatically
                            conversion to
                            recipient currency.
                        </p>

                        <p> Also, a small commission is taken for each transaction. In account's menu user can see all
                            transaction
                            history for each account.</p>

                        <p> User can send email to administration.</p>

                        You can check all user's e-mails on Gmail. (login: onlinebankrecipient@gmail.com, password:
                        onlinebankrecipient123)

                        <p> Besides, user has message menu, where he can read messages, sent by administrators.</p>

                        <p>
                            Administrator can check user's profile, block/unblock him or his accounts, change user's
                            role,
                            see
                            users
                            account's history and, also, histories of all commissions.
                        </p>

                        <p>
                            In addition, administrator can send a message personally to each user and to all users
                            together

                        </p>

                        <p>
                            Super admin role - it's just for me :) It's the same as a usual admin role, except that
                            another
                            administrators can't edit my profile, can't delete it and all commission accounts belong to
                            this
                            profile.
                        </p>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
<!-- jQuery Library -->
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!--materialize js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
<script src="<c:url value="/resources/js/animatedModal.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.particleground.min.js" />"></script>
<script type="text/javascript">
    $(document).ready(function () {
        function show(lang) {
            window.location.href = window.location.href.split('?')[0] + '?lang=' + lang;
        }

        $("#demo02").animatedModal({
            modalTarget: 'modal-02',
            animatedIn: 'lightSpeedIn',
            animatedOut: 'bounceOutDown',
            color: '#3498db',
            // Callbacks
            beforeOpen: function () {
                console.log("The animation was called");
            },
            afterOpen: function () {
                console.log("The animation is completed");
            },
            beforeClose: function () {
                console.log("The animation was called");
            },
            afterClose: function () {
                console.log("The animation is completed");
            }
        });

            $('.particles').particleground({
                dotColor: '#5cbdaa',
                lineColor: '#5cbdaa'
            });
            $('#login-page').css({
                'margin-top': -($('#login-page').height()/2)
            })
    });
</script>
</body>
</html>
