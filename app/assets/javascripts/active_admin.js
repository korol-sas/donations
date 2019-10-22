//= require jquery
//= require jquery_ujs
//= require chartkick
//= require Chart.bundle
//= require moment
//= require active_admin/base
//= require libs/fullcalendar.min
//= require libs/fullcalendar.locale-all

$(document).ready(function() {
   $("#donations-calendar").fullCalendar({
     left: "prev,next today",
     center: "title",
     right: "month,agendaWeek,agendaDay",
     defaultView: "month",
     height: 545,
     slotMinutes: 15,
     events: "/admin/donations/calendar",
     timeFormat: "h:mm t",
     locale: $('html').attr('lang'),
     eventClick: function(event) {
      showDonationsDialog('Donations on ' + event.start.format(), '/admin/donations/list?date=' + event.start.format())
    }
  });
});

function showDonationsDialog(title, url) {
  $('<div>').dialog({
      modal: true,
      open: function () {
        $(this).load(url);
      },
      close: function(event, ui) {
        $(this).remove();
      },
      height: 400,
      width: 300,
      title: title
  });

  return false;
}
