#$(document).ready ->	
  #$('#calendar').fullCalendar
    #defaultDate: getMonday().format('YYYY MM DD'),
    #editable: true,        
    #weekends: false,
    #minTime: '09:00:00',
    #maxTime: '22:00:00',
    #header:
      #left: 'prev,next today',
      #center: 'title',
      #right: 'month,agendaWeek,agendaDay'
    #defaultView: 'week'
    #height: 500,
    #slotMinutes: 15,
    #eventSources: [{
      #url: '/all_classes',
      #color: 'blue',
      #textColor: 'black',
      #ignoreTimezone: true,
      ##rendering: 'background'
    #}],
    #timeFormat: 'h:mm t{ - h:mm t} '
    #dragOpacity: "0.5"

  #$('#calendar').fullCalendar 'renderEvent', 
    #start: "Tue, 01 Dec 2015 19:00:00 -0000",
    #end: "Tue, 01 Dec 2015 20:00:00 -0000",
    #render: 'inverse-background'
    
    ##eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      ##updateEvent(event);
    ##eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      ##updateEvent(event);

      
##updateEvent = (the_event) ->
  ##$.update "/events/" + the_event.id,
    ##event: 
      ##title: the_event.title,
      ##starts_at: "" + the_event.start,
      ##ends_at: "" + the_event.end,
      ##description: the_event.description
