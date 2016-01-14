class Group < ActiveRecord::Base
  include IceCube

  IceCube.compatibility = 12 # ?

  serialize :schedule, IceCube::Schedule

  has_many :students
  has_many :weekly_classes
  belongs_to :teacher
  #has_one :schedule


  # schedule could also be another model with has_one relationship

  def name
    "Group #{id}"
  end

  def name_with_level
    "Group #{id} - #{level}"
  end

  #def schedule
    #IceCube::Schedule.new() do |s|
      #s.add_recurrence_rule Rule.weekly.day(1, 2)
    #end
  #end

  def add_biweekly_schedule(day1, day2, time, duration = 60)
    # TODO dont i need duration?
    duration *= 60
    hour, minute = time.split(':')
    time = Time.now.change(hour: hour, minute: minute)
    #p time
    self.schedule = IceCube::Schedule.new(time, duration: duration) do |s|
                      s.add_recurrence_rule Rule.weekly.day(day1, day2)
                    end
    #pp self.schedule
    save!
    self
  end

  def classes_between(start, finish)
    #self.schedule.occurrences_between Time.parse(start), Time.parse(finish)
    self.schedule.occurrences_between start, finish
  end

end
