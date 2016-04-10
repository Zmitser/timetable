var grid = grid || document.querySelector('vaadin-grid');
var ajaxUrl = 'http://localhost:8080/ajax/user/users/';
form = $('#detailsForm');

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



function deleteRow(id) {
    $.ajax({
        url: ajaxUrl + id,
        type: "DELETE",
        success: function () {
            getUsersJSON();
        }
    })
}

function updateRow(id) {
    $.getJSON(ajaxUrl + id, function (data) {
        $.each(data, function (key, val) {
            form.find("input[name='" + key + "']").val(val);
            form.find("textarea[name='" + key + "']").val(val);
            if (key == 'studentGroup') {
                form.find("input[name='studentGroupId']").val(val.id);
                form.find("input[name='studentGroupName']").val(val.name);
            }
        });
        $('#modal1').openModal();
    });
}



function save() {
    $.ajax({
        type: "POST",
        url: ajaxUrl,
        data: form.serialize(),
        success: function () {
            $('#modal1').closeModal();
            getJSON(function (json) {
                grid.items = json;
                grid.refreshItems();
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
        button.setAttribute('href', '/student/' + grid.items[cell.row.index]['id']);
        button.innerHTML = "Подробнее";
        button.setAttribute("class", " deep-orange waves-effect waves-light btn");
        cell.element.appendChild(button);
    };
    grid.columns[4].renderer = function (cell) {
        cell.element.innerHTML = '';
        var button = document.createElement('a');
        button.setAttribute('onclick', 'updateRow("' + grid.items[cell.row.index]['id'] + '");');
        button.innerHTML = "Изменить";
        button.setAttribute("class", "blue waves-effect waves-light btn");
        cell.element.appendChild(button);
    };
    grid.columns[5].renderer = function (cell) {
        cell.element.innerHTML = '';
        var button = document.createElement('a');
        button.setAttribute('onclick', 'deleteRow("' + grid.items[cell.row.index]['id'] + '");');
        button.innerHTML = "Удалить";
        button.setAttribute("class", "red waves-effect waves-light btn");
        cell.element.appendChild(button);
    };
});


