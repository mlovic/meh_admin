class Group < ActiveRecord::Base
  include IceCube

  IceCube.compatibility = 12 # ?

  serialize :schedule, IceCube::Schedule

  has_many :students
  has_many :weekly_classes
  belongs_to :teacher
  #has_one :schedule

  delegate :hours_per_week, to: :schedule


  # schedule could also be another model with has_one relationship

  def self.all_classes
    
  end

  #def hours_per_week
    #return 0 unless self.schedule
    #schedule
  #end

  def name
    "Group #{id}"
  end

  def name_with_level
    "Group #{id} - #{level}"
  end

  def schedule
    # TODO delegate methods
    read_attribute(:schedule).extend Timetable
    # how to avoid reading if already loaded? memoize to inst var?
  end

  #def schedule
    #IceCube::Schedule.new() do |s|
      #s.add_recurrence_rule Rule.weekly.day(1, 2)
    #end
  #end

  def add_biweekly_schedule(day1, day2, time, duration = 60*60)
    # TODO dont i need duration?
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

  class Klass
    @occurrence
  end

  def classes_between(start, finish)
    #self.schedule.occurrences_between Time.parse(start), Time.parse(finish)
    return [] unless self.schedule

    classes = self.schedule.occurrences_between start, finish

    # TODO don't know about this
    classes.each do |klass|
      klass.class.module_eval { attr_accessor :group} # m-patch IceCube::occurence?
      klass.group = self
    end

    return classes
  end

end
