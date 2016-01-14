module Helpers
  def get_schedule
    IceCube::Schedule.new do |s|
      s.add_recurrence_rule IceCube::Rule.weekly
    end
  end

  def base_time
    Time.parse('2016-07-10 12:00:00')
  end
end
