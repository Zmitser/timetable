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
function deleteRow(id) {
    $.ajax({
        url: ajaxAdminUrl + id,
        type: "DELETE",
        success: function () {
            getUsersJSON();
        }
    })
}






$(document).on("click", ".delete", function (event) {
    var id = this.name;
    deleteRow(id);
});


$(document).on("click", ".edit", function (event) {
    var id = this.name;
    updateRow(id);
});


$('#dropzone').dmUploader({
    url: ajaxAdminUrl + "fileUpload",
    dataType: 'json',
    allowedTypes: 'image/*',
    onUploadSuccess: function (id, response) {
        form.find("input[name='photo']").val(response)
    }
});

function save() {
    $.ajax({
        type: "POST",
        url: ajaxAdminUrl,
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
        button.innerHTML = "Подробнее";
        button.setAttribute("class", "orange waves-effect waves-light btn info");
        button.setAttribute("name", grid.items[cell.row.index]['id']);
        cell.element.appendChild(button);
    };

    grid.columns[4].renderer = function (cell) {
        cell.element.innerHTML = '';
        var button = document.createElement('a');
        button.innerHTML = "Изменить";
        button.setAttribute("class", "blue waves-effect waves-light btn edit");
        button.setAttribute("name", grid.items[cell.row.index]['id']);
        cell.element.appendChild(button);
    };
    grid.columns[5].renderer = function (cell) {
        cell.element.innerHTML = '';
        var button = document.createElement('a');
        button.innerHTML = "Удалить";
        button.setAttribute("class", "red waves-effect waves-light btn delete");
        button.setAttribute("name", grid.items[cell.row.index]['id']);
        cell.element.appendChild(button);
    };
});
