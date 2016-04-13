<%--
  Created by IntelliJ IDEA.
  User: Dimka
  Date: 13.04.2016
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" charset="utf-8">
    var proto = (document.location.protocol=='https:')?'https:':'http:';
    var host = proto+'//widget.copiny.com';
    document.write(unescape("%3Cscript src='" + host + "/static/js/newwidget.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript" charset="utf-8">
    var copinyWidgetOptions = {
        position: 'left',
        color: '#61a8f0',
        border: '#ffffff',
        round: '1',
        title: "\u0421\u043e\u043e\u0431\u0449\u0435\u0441\u0442\u0432\u043e \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u043a\u0438",
        cache: "bf3b0dc169b4c5c175567223c5b2f69c\/bf3b0dc169b4c5c175567223c5b2f69c\/ejOwVXUxUHU0BJFOrkgkUMRQ1cISzDYFsyEiRmARCOmqDabckLSZIJEQbQZgthmYdASTFmqGtjmpaSUA",
        type: 'question',
        community:12154
    };
    initCopinyWidget(copinyWidgetOptions);
    CopinyNewWidget.showTab();
</script>