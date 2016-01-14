#json.extract! @group, :id, :level, :created_at, :updated_at

puts 'jbuilder here'
json.array! @classes do |klass|
  json.title @group.level + ' ' + @group.id.to_s # self.title,
  json.description 'desc here'
  json.start klass.start_time.rfc822
  json.end klass.end_time.rfc822
  json.allDay false
  json.recurring false
  json.color @group.teacher.color
  #:url => Rails.application.routes.url_helpers.event_path(id)
end
