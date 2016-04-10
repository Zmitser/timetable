var ajaxUrl = 'http://localhost:8080/ajax/user/teachers/';
var ajaxAdminUrl = 'http://localhost:8080/ajax/admin/teachers/';
var grid = grid || document.querySelector('vaadin-grid');
form = $('#detailsForm');


function updateRow(id) {
    $.get(ajaxUrl + id, function (data) {
        $.each(data, function (key, value) {
            form.find("input[name='" + key + "']").val(value);
            form.find("textarea[name='" + key + "']").val(value);
        });
        $('#modal1').openModal();
    });
}
$('#add').click(function () {
    form.find(":input").val("");
    $('#id').val(0);
    $('#modal1').openModal();
});

grid.columns[3].renderer = function (cell) {
    cell.element.innerHTML = '';
    var button = document.createElement('a');
    button.setAttribute('href', '/teacher/' + grid.items[cell.row.index]['id']);
    button.innerHTML = "Подробнее";
    button.setAttribute("class", " deep-orange waves-effect waves-light btn");
    cell.element.appendChild(button);
};





