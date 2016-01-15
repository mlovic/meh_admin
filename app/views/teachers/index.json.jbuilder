json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :color
  json.url teacher_url(teacher, format: :json)
end
