$(document).ready(function () {

    var form = $('#detailsForm');
    var source = '/ajax/user/timetable/';
    var calendar = $('#calendar');
    var studentGroup = $(".student-group");
    var subjects = $(".subjects");
    calendar.fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        eventClick: function (event, jsEvent, view) {
            $.getJSON("/ajax/user/timetable/" + event.id, function (data) {
                $.each(data, function (key, val) {
                    form.find("input[name='" + key + "']").val(val);
                    if (key == 'group' || key == 'subject') {
                        form.find("input[name='" + key + "']").val(val.name);
                    }
                });
                $('#modal1').openModal();
            })
        },
        events: source,
        eventDataTransform: function (rawEventData) {
            return {
                id: rawEventData.id,
                title: rawEventData.title,
                start: rawEventData.start,
                end: rawEventData.end
            };
        }
    });

    studentGroup.change(function () {
        var name = $(".student-group li.active").text();
        var newSource = '/ajax/user/timetable/timetableTo/' + name;
        calendar.fullCalendar('removeEventSource', source);
        calendar.fullCalendar('refetchEvents');
        calendar.fullCalendar('addEventSource', newSource);
        calendar.fullCalendar('refetchEvents');
        source = newSource;
    });

    $.getJSON("/ajax/user/group", function (data) {
        var optionsGroup = '<option value="' + 0 + '">' + "" + '</option>';
        for (var i = 0; i < data.length; i++) {
            optionsGroup += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
        }
        studentGroup.html(optionsGroup);
        studentGroup.material_select();
    });

    $.getJSON("/ajax/user/subjects/", function (data) {
        var optionsSubject = '<option value="' + 0 + '">' + "" + '</option>';
        for (var i = 0; i < data.length; i++) {
            optionsSubject += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
        }
        subjects.html(optionsSubject);
        subjects.material_select();
    });

    $(document).on("click", ".delete", function (event) {
        var id = $("#id").val();
        $.ajax({
            url: "/ajax/user/timetable/" + id,
            type: "DELETE",
            success: function () {
                $('#calendar').fullCalendar('refetchEvents');
                $('#modal1').closeModal();
            }
        })
    });
    $(document).on("click", ".edit", function (event) {
        var id = this.name;
        $.getJSON("/ajax/user/timetable" + id, function (data) {
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
            url: "/ajax/user/timetable",
            data: form.serialize(),
            success: function (result) {
                $('#calendar').fullCalendar('refetchEvents');
                $('#modal1').closeModal();
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
    $('.date').bootstrapMaterialDatePicker({
        format: 'YYYY-MM-DD\\THH:mm',
        lang: navigator.browserLanguage || navigator.language || navigator.userLanguage
    });
    $.validate({
        modules: 'location, date, security, file, html5, toggleDisabled',
        disabledFormFilter: 'form.toggle-disabled'
    });
});




