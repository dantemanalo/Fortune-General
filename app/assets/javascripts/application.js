//= require jquery
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
$(function () {
    $('#datetimepicker6').datetimepicker({format: 'DD-MMM-YYYY'});
    $('#datetimepicker7').datetimepicker({format: 'DD-MMM-YYYY'});
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
});

$(function () {
    $('#datetimepicker8').datetimepicker({format: 'DD-MMM-YYYY'});
    $('#datetimepicker9').datetimepicker({format: 'DD-MMM-YYYY'});
    $("#datetimepicker8").on("dp.change", function (e) {
        $('#datetimepicker9').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker9").on("dp.change", function (e) {
        $('#datetimepicker8').data("DateTimePicker").maxDate(e.date);
    });
});
