#require 'support/helpers'

FactoryGirl.define do

  factory :group do
    level 'B2'
    #schedule
    factory :group_with_schedule do
      after(:build) { |g| group.add_biweekly_schedule(:monday, :wednesday, '17:00')}
    end
     
    teacher
  end

  #factory :schedule do
    #ice_cube_data IceCube::Schedule.new(Time.now, duration: 3600) { |s| s.add_recurrence_rule IceCube::Rule.weekly.day(1, 3) }
  #end

  factory :teacher do
    name 'Izzy'
    color 'red'
  end

end
