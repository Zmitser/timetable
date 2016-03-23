<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:import url="templates/head.jsp"/>
<body>
<c:import url="templates/header.jsp"/>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <div class="row">
        <div class="col offset-s5">
            <a class="waves-effect waves-light btn-large" id="add">Добавить отметку</a>
        </div>
    </div>

</sec:authorize>
<div class="row">
    <div class="col s4 m4 l4">
        <div class="input-field col s12">
            <select class="students" id="student" name="student">
            </select>
            <label>Выберите интересующего студента</label>
        </div>
    </div>

    <div class="col s4 m4 l4">
        <div class="input-field col s12">
            <select class="subjects" id="subject" name="subject">
            </select>
            <label>Выберите интересующий предмет </label>
        </div>
    </div>

    <div class="col s4 m4 l4">
        <div class="input-field col s12">
            <button type="button" id="find-progress" class="waves-effect waves-light btn">Найти</button>
        </div>
    </div>
</div>


<div class="col s6 m6 l6 canvas">
    <canvas id="buyers"></canvas>
</div>
<div class="col s6 m6 l6">
    <vaadin-grid id="sort" selection-mode="multi">
        <table>
            <!-- Define the columns and their mapping to data properties. -->
            <col name="id" hidden/>
            <col name="score" sortable="true"/>
            <col name="date" sortable="true"/>
            <col/>
            <col/>
            <thead>
            <tr>
                <th></th>
                <th><spring:message key="app.fio"/></th>
                <th><spring:message key="app.group"/></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
        </table>
    </vaadin-grid>
</div>
<div id="modal1" class="modal modal-fixed-footer">
    <form:form id="detailsForm" method="post" class="col s12">
        <div class="modal-content">
            <h4><spring:message key="app.student_edit"/></h4>
            <input value="" id="id" name="id" type="hidden">
            <div class="row">
                <div class="input-field col s12">
                    <select class="students" name="studentId">
                    </select>
                    <label>Выберите интересующего студента</label>
                </div>
                <div class="input-field col s12">
                    <select class="subjects" name="subjectId">
                    </select>
                    <label>Выберите интересующий предмет </label>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="date" id="date" name="date" value="date">
                        <label for="date">Дата</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input id="score" name="score" value="0" type="text" class="validate">
                        <label for="score">Отметка</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="waves-effect waves-light btn"><spring:message key="app.save"/></button>
        </div>
    </form:form>
</div>
<c:import url="templates/footer.jsp"/>

<script>
    $(document).ready(function () {
        grid = document.querySelector('vaadin-grid');
        ajaxUrl = 'http://localhost:8080/ajax/user/progress/';
        ajaxAdminUrl = 'http://localhost:8080/ajax/admin/progress/';
        form = $('#detailsForm');
        statistic = $('#statistic-form');
        $.getJSON("/ajax/user/students/", function (data) {
            var options = '<option value="' + 0 + '">' + "" + '</option>';
            for (var i = 0; i < data.length; i++) {
                options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
            }
            $(".students").html(options);
            $('.students').material_select();
        });

        $.getJSON("/ajax/user/subjects/", function (data) {
            var options = '<option value="' + 0 + '">' + "" + '</option>';
            for (var i = 0; i < data.length; i++) {
                options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
            }
            $(".subjects").html(options);
            $('.subjects').material_select();
        });
        $("#find-progress").click(function () {
            var student = $(".students .initialized").val();
            var subject = $(".subjects .initialized").val();
            $.ajax({
                type: "GET",
                url: "/ajax/user/progress/student?student=" + student + "&subject=" + subject,
                data: form.serialize(),
                success: function (result) {
                    $("#buyers").remove();
                    $(".canvas").html("<canvas id='buyers'></canvas>");
                    var labels = [], data = [];
                    for (var item in result) {
                        labels.push(result[item].date);
                        data.push(result[item].score);
                    }
                    var tempData = {
                        labels: labels,
                        datasets: [{
                            fillColor: "rgba(172,194,132,0.4)",
                            strokeColor: "#ACC26D",
                            pointColor: "#fff",
                            pointStrokeColor: "#9DB86D",
                            data: data
                        }]
                    };
                    var ctx = $("#buyers").get(0).getContext("2d");
                    var myChart = new Chart(ctx).Line(tempData, {
                        responsive: true
                    });

                    function getJSON(callback) {
                        var xhr = new XMLHttpRequest();
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                                callback(JSON.parse(xhr.responseText));
                            }
                        };
                        xhr.open('GET', "/ajax/user/progress/student?student=" + student + "&subject=" + subject, true);
                        xhr.send();
                    }

                    HTMLImports.whenReady(function () {
                        getJSON(function (json) {
                            grid.items = json;
                        });


                        grid.addEventListener('sort-order-changed', function () {
                            var sortOrder = grid.sortOrder[0];
                            var sortProperty = grid.columns[sortOrder.column].name;
                            var sortDirection = sortOrder.direction;
                            grid.items.sort(function (a, b) {
                                var res;
                                var path = sortProperty.split('.');
                                for (var i = 0; i < path.length; i++) {
                                    a = a[path[i]];
                                    b = b[path[i]];
                                }
                                if (!isNaN(a)) {
                                    res = parseInt(a, 10) - parseInt(b, 10);
                                } else {
                                    res = a.localeCompare(b);
                                }
                                if ('desc' === sortDirection) {
                                    res *= -1;
                                }
                                return res;
                            });
                        });

                        grid.columns[3].renderer = function (cell) {
                            cell.element.innerHTML = '';
                            var button = document.createElement('a');
                            button.innerHTML = "Изменить";
                            button.setAttribute("class", "blue waves-effect waves-light btn edit");
                            button.setAttribute("name", grid.items[cell.row.index]['id']);
                            cell.element.appendChild(button);
                        };
                        grid.columns[4].renderer = function (cell) {
                            cell.element.innerHTML = '';
                            var button = document.createElement('a');
                            button.innerHTML = "Удалить";
                            button.setAttribute("class", "red waves-effect waves-light btn delete");
                            button.setAttribute("name", grid.items[cell.row.index]['id']);
                            cell.element.appendChild(button);
                        };
                    });
                }

            });


        });

    })

</script>


<script>

    $(document).ready(function () {
        function getJSON(callback) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    callback(JSON.parse(xhr.responseText));
                }
            };
            xhr.open('GET', ajaxUrl, true);
            xhr.send();
        }

        function getUsersJSON() {
            getJSON(function (json) {
                grid.items = json;
                grid.refreshItems();
            });
        }

        $(document).on("click", ".delete", function (event) {
            var id = this.name;
            $.ajax({
                url: ajaxAdminUrl + id,
                type: "DELETE",
                success: function () {
                    getUsersJSON();
                }
            })
        });


        $(document).on("click", ".edit", function (event) {
            var id = this.name;
            $.getJSON(ajaxUrl + id, function (data) {
                $.each(data, function (key, val) {
                    form.find("input[name='" + key + "']").val(val);
                    if (key == 'student') {
                        form.find(".students-edit input").val(val.name);
                    } else if (key == 'subject') {
                        form.find(".subjects-edit input").val(val.name);
                    }
                });
                $('#modal1').openModal();
            });
        });

        function save() {
            $.ajax({
                type: "POST",
                url: ajaxUrl,
                data: form.serialize(),
                success: function (result) {
                    $('#modal1').closeModal();
                    getJSON(function (json) {
                        grid.items = json;
                        grid.refreshItems();
                    });

                    $("#buyers").remove();
                    $(".canvas").html("<canvas id='buyers'></canvas>");
                    var labels = [], data = [];
                    for (var item in result) {
                        labels.push(result[item].date);
                        data.push(result[item].score);
                    }
                    var tempData = {
                        labels: labels,
                        datasets: [{
                            fillColor: "rgba(172,194,132,0.4)",
                            strokeColor: "#ACC26D",
                            pointColor: "#fff",
                            pointStrokeColor: "#9DB86D",
                            data: data
                        }]
                    };
                    var ctx = $("#buyers").get(0).getContext("2d");
                    var myChart = new Chart(ctx).Line(tempData, {
                        responsive: true
                    });

                }
            });
        }

        $('#add').click(function () {
            form.find(":input").val("");
            $('#id').val(0);
            $('#studentGroupId').val(0);
            $('#modal1').openModal();
        });
        form.submit(function () {
            save();
            return false;
        });
        $("#date").pickadate({
            format: 'yyyy-mm-dd',
            formatSubmit: undefined,
            hiddenPrefix: undefined,
            hiddenSuffix: '_submit',
            hiddenName: undefined
        });
    })
</script>
</body>
</html>