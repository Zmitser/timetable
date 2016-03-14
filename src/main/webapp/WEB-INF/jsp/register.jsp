<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <title><spring:message key="app.register_form"/></title>
    <!-- CORE CSS-->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">

    <style type="text/css">
        html,
        body {
            height: 100%;
        }
        html {
            display: table;
            margin: auto;
        }
        body {
            display: table-cell;
            vertical-align: middle;
        }
        .margin {
            margin: 0 !important;
        }
    </style>

</head>

<body class="blue">
<c:import url="templates/header.jsp"/>

<div id="login-page" class="row">
    <div class="col s12 z-depth-6 card-panel">
        <form class="login-form">
            <input type="hidden" name="id" value="0">
            <div class="row">
                <div class="input-field col s12 center">
                    <img src="http://w3lessons.info/logo.png" alt="" class="responsive-img valign profile-image-login">
                    <p class="center login-form-text"><spring:message key="app.register_form"/></p>
                </div>
            </div>
            <div class="row margin">
                <div class="input-field col s12">
                    <i class="mdi-communication-email prefix"></i>
                    <input id="email" type="email" name="email" class="validate">
                    <label for="email" class="center-align"><spring:message key="app.email"/></label>
                </div>
            </div>
            <div class="row margin">
                <div class="input-field col s12">
                    <i class="mdi-action-lock-outline prefix"></i>
                    <input id="password" type="password" name="password" class="validate">
                    <label for="password"><spring:message key="app.password"/></label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <button  type="submit" class="btn waves-effect waves-light col s12"><spring:message key="app.register_now"/></button>
                </div>
            </div>
        </form>
    </div>
</div>


<!-- ================================================
  Scripts
  ================================================ -->

<!-- jQuery Library -->
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!--materialize js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>

<script>
  var  form =  $(".login-form");
  var ajaxUrl = 'http://localhost:8080/ajax/users';
  form.submit(function () {
          $.ajax({
              type: "POST",
              url: ajaxUrl,
              data: form.serialize(),
              success: function () {
                  var url = "/success";
                  $(location).attr('href',url);
              }
          });

      return false;
  });
</script>
</body>

</html>