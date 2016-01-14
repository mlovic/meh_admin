$(document).ready ->	
  calendar = $('#single-group-calendar')
  $('#single-group-calendar').fullCalendar
    #year: 
    #var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    #
    #date: getMonday().date(),
    #month: getMonday().month(),
    #year: 2015,
    defaultDate: getMonday().format('YYYY MM DD'),
    #defaultDate: '2015-12-01', 
    #defaultDate: getMonday(), 
    editable: true,        
    weekends: false,
    header:
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    defaultView: 'agendaWeek',
    height: 500,
    slotMinutes: 15,
    eventSources: [{
      #url: '/weekly_classes?group_id=' + $(@).data('group-id') ,
      #url: '/weekly_classes?group_id=' + calendar.data('group-id') ,
      url: '/groups/' + calendar.data('group-id') + '/classes' ,
      color: 'blue',
      textColor: 'black',
      ignoreTimezone: true,
      #startParam: moment(getMonday()).format('YYYY-MM-DD'),
      data: {
        start: getMonday().format('YYYY-MM-DD'),
        anotherData: 'up'
      }
      #rendering: 'background'
    }],
    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5"

  # Hack
  #$('#single-group-calendar').fullCalendar( 'gotoDate', getMonday())
  console.log(moment(getMonday().format('YYYY MM DD')).date())
  #$(".fc-today").removeClass("fc-today");
  #$(".fc-center").remove();

getMonday = ->
  d = new Date()
  day = d.getDay()
  diff = d.getDate() - day + (if day == 0 then -6 else 1)
  # adjust when day is sunday
  date = new Date(d.setDate(diff))
  moment(date)
  # should just return moment object?

