$(document).ready ->	
  calendar = $('#calendar')
  $('#calendar').fullCalendar
    defaultDate: getMonday().format('YYYY MM DD'),
    minTime: '09:00:00',
    maxTime: '22:00:00',
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
      url: '/all_classes'
      color: 'blue',
      textColor: 'black',
      ignoreTimezone: true,
      data: {
        start: getMonday().format('YYYY-MM-DD'),
        anotherData: 'up'
      }
    }],
    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5"

  console.log(moment(getMonday().format('YYYY MM DD')).date())

getMonday = ->
  d = new Date()
  day = d.getDay()
  diff = d.getDate() - day + (if day == 0 then -6 else 1)
  # adjust when day is sunday
  date = new Date(d.setDate(diff))
  moment(date)
  # should just return moment object?

