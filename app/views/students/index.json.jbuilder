json.array!(@students) do |student|
  json.extract! student, :id, :name, :date_of_birth, :phone, :level, :notes
  json.url student_url(student, format: :json)
end
