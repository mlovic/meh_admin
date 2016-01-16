module Timetable
  def hours_per_week
    rules = recurrence_rules
    pp rules
    rules.first.validations[:day].count * (duration / 3600)
  end
end
