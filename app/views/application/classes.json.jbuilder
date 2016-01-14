#json.extract! @group, :id, :level, :created_at, :updated_at

# application/classes.jbuilder
#
json.array! @classes do |klass|
  json.title klass.group.level + ' ' + klass.group.id.to_s # self.title,
  json.description 'desc here'
  json.start klass.start_time.rfc822
  json.end klass.end_time.rfc822
  json.allDay false
  json.recurring false
  json.color klass.group.teacher.color
  #:url => Rails.application.routes.url_helpers.event_path(id)
end
