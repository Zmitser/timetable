<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Dimka
  Date: 29.03.2016
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
    <a class="btn-floating btn-large red tooltipped send-email" data-position="top" data-delay="50" data-tooltip="Send email">
        <i class="large material-icons">email</i>
    </a>
</div>
<div id="send-email-modal" class="modal modal-fixed-footer">
    <form:form id="send-email-form"   method="post" class="col s12">
        <div class="modal-content">
            <h4>Send Message</h4>
            <div class="row">
                <input value="Имя студента" id="id" name="id" type="hidden" class="validate">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="subject"
                               name="subject"
                               type="text"
                               class="validate tooltipped"
                               data-position="top"
                               data-delay="50"
                               data-tooltip="Blah-blah-blah!"
                               required="required">
                        <label for="subject">Subject</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea id="message"
                                  name="message"
                                  class="materialize-textarea validate tooltipped"
                                  data-position="top"
                                  data-delay="50"
                                  data-tooltip="Blah-blah-blah!"
                                  required="required"></textarea>
                        <label for="message">Message</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="waves-effect waves-light btn"><spring:message code="app.save"/></button>
        </div>
    </form:form>
</div>