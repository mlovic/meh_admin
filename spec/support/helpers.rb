module Helpers
  def get_schedule
    IceCube::Schedule.new do |s|
      s.add_recurrence_rule IceCube::Rule.weekly
    end
  end

  def base_time
    Time.parse('2016-07-10 12:00:00') # arbitrary date picked for convenience. 
                                      # Monday is 11th
  end

  def next_monday
    Chronic.parse('next monday').to_time
  end

  def next_friday
    Chronic.parse('next friday').to_time
  end
end
