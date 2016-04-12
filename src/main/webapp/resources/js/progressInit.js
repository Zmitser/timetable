$(document).ready(function () {
    var grid = document.querySelector('vaadin-grid');
    var ajaxUrl = 'ajax/user/progress/';
    var ajaxAdminUrl = 'ajax/admin/progress/';
    var form = $('#detailsForm');
    var statistic = $('#statistic-form');
    var students = $(".students");
    var subjects = $(".subjects");
    var byers = $("#buyers");

    $.getJSON("/ajax/user/students/", function (data) {
        var options = '<option value="' + 0 + '">' + "" + '</option>';
        for (var i = 0; i < data.length; i++) {
            options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
        }
        students.html(options);
        students.material_select();
    });

    $.getJSON("/ajax/user/subjects/", function (data) {
        var options = '<option value="' + 0 + '">' + "" + '</option>';
        for (var i = 0; i < data.length; i++) {
            options += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
        }
        subjects.html(options);
        subjects.material_select();
    });
    $("#find-progress").click(function () {
        var student = $(".students .initialized").val();
        var subject = $(".subjects .initialized").val();
        $.ajax({
            type: "GET",
            url: "/ajax/user/progress/student?student=" + student + "&subject=" + subject,
            data: form.serialize(),
            success: function (result) {
                byers.remove();
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
            byers.remove();
            $(".canvas").html("<canvas id='buyers'></canvas>");
            var labels = [], data = [];
            for (var item in json) {
                labels.push(json[item].date);
                data.push(json[item].score);
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
            success: function () {
                $('#modal1').closeModal();
                getUsersJSON();
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
    $('#date').bootstrapMaterialDatePicker({
        format: 'YYYY-MM-DD',
        time: false,
        lang: navigator.browserLanguage || navigator.language || navigator.userLanguage
    });
    $.validate({
        modules: 'location, date, security, file, html5, toggleDisabled',
        disabledFormFilter: 'form.toggle-disabled'
    });

});

