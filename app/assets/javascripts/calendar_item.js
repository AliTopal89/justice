var initialize_calendar;
initialize_calendar = function() {
  $('.event').each(function(){
    var event = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title body',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      calendars: '/calendar_items.json',

      select: function(start, end) {
        $.getScript('/calendar_items/new', function() {});

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(calendar, delta, revertFunc) {
        event_data = { 
          calendar: {
            id: calendar_items.id,
            start: calendar_items.start.format(),
            end: calendar_items.end.format()
          }
        };
        $.ajax({
            url: calendar_items.update_url,
            data: calendar_items_data,
            type: 'PATCH'
        });
      },
      
      eventClick: function(calendar_item jsEvent, view) {
        $.getScript(calendar_item.edit_url, function() {});
      }
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);