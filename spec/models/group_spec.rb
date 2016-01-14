require 'rails_helper'

RSpec.describe Group do
  before(:all) { Timecop.freeze(base_time) }
  after(:all)  { Timecop.return }
  let(:group) { Group.new }
  it 'can save an IceCube schedule' do
    sched = IceCube::Schedule.new do |s|
              s.add_recurrence_rule IceCube::Rule.weekly
            end
    group.schedule = sched
    expect(group.save).to be true
    expect(group.schedule).to be_a IceCube::Schedule
    #expect(group.schedule).to == sched
  end

  describe '#add_biweekly_schedule' do
    it 'works' do
      group.add_biweekly_schedule(:monday, :wednesday, '17:00')
      #p group
      expect(group.schedule).to be_a IceCube::Schedule
    end

    #it 'try sched', focus: false do
      #ActiveRecord::Base.logger = Logger.new(STDOUT)
      #Teacher.create(name: 'tets')
      #puts 'asdf'
      #pp Teacher.all.size
      #pp Teacher.find(1)
      #group = create(:group)
      #group.schedule
    #end
    
    it 'uses time given', focus: false do
      require 'pp'
      #ActiveRecord::Base.logger = Logger.new(STDOUT)
      group = create(:group)
      pp group.schedule
      group.add_biweekly_schedule(:monday, :wednesday, '17:00')
      pp group.schedule
      expect(group.schedule.start_time.hour).to eq 17
    end
  end

  describe '#classes_between' do
    it 'returns both classes in week' do
      group.add_biweekly_schedule(:monday, :wednesday, '17:00')
      mon = Chronic.parse('next monday').to_time
      fri = Chronic.parse('next friday').to_time
      expect(group.classes_between(mon, fri).size).to eq 2
    end

    it 'anotehr' do
      group.add_biweekly_schedule(:monday, :wednesday, '17:00')

      classes = group.classes_between Time.parse('2016-07-11'), 
                                      Time.parse('2016-07-15')
      expect(classes.size).to eq 2
    end

    it 'works' do
      pending
      #sched = IceCube::Schedule.new(Time.now, duration: 3600) do |s|
                #s.add_recurrence_rule IceCube::Rule.weekly
              #end
      group.add_biweekly_schedule(:monday, :wednesday, '17:00')
      future_time = DateTime.now.change(day: 30)
      p sched.occurrences(future_time).last.start_time
      p sched.occurrences(future_time).last.end_time
      p sched.occurrences(future_time).last.to_json
    end
    
  end
end
