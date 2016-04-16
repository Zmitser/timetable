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




