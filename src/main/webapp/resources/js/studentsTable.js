var ajaxUrl = 'ajax/user/students/';
var ajaxAdminUrl = 'ajax/admin/students/';
var grid = grid || document.querySelector('vaadin-grid');
form = $('#detailsForm');


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
$('#add').click(function () {
    form.find(":input").val("");
    $('#id').val(0);
    $('#studentGroupId').val(0);
    $('#modal1').openModal();
});
grid.columns[3].renderer = function (cell) {
    cell.element.innerHTML = '';
    var button = document.createElement('a');
    button.setAttribute('href', '/student/' + grid.items[cell.row.index]['id']);
    button.innerHTML = "Подробнее";
    button.setAttribute("class", " deep-orange waves-effect waves-light btn");
    cell.element.appendChild(button);
};



