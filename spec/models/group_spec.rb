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

  it 'saves only valid level' do
    group.level = 'B1'
    expect(group).to     be_valid
    group.level = 'D1'
    expect(group).to_not be_valid
  end

  describe '.all_classes' do
    #create(:group).add_biweekly_schedule(:monday, :wednesday, '17:00')
    #create(:group).add_biweekly_schedule(:tuesday, :wednesday, '17:00')
    #Group.all_classes

    
  end

  describe '#schedule' do
    let(:group) { build(:group_with_schedule) }
    it 'returns an IceCube::Schedule' do
      expect(group.schedule).to be_a IceCube::Schedule
    end
    it 'mixes in Timetable' do
      #expect(group.schedule).to be_extend Timetable 
      expect(group.schedule).to respond_to :hours_per_week
    end
  end

  describe '#add_biweekly_schedule' do
    # TODO consider removing save or making optional
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
      #ActiveRecord::Base.logger = Logger.new(STDOUT)
      group = create(:group)
      group.add_biweekly_schedule(:monday, :wednesday, '17:00')
      expect(group.schedule.start_time.hour).to eq 17
    end
  end

  describe '#classes_between' do
    #let(:group) { create(:group, :with_schedule). }
    let(:group) { build(:group) }

    it 'returns both classes in week' do
      group.add_biweekly_schedule(:monday, :wednesday, '17:00')
      expect(group.classes_between(next_monday, next_friday).size).to eq 2
    end

    it 'accepts duration' do
      group.add_biweekly_schedule(:monday, :wednesday, '17:00', 90*60)
      klass = group.schedule.next_occurrence
      duration = klass.end_time - klass.start_time
      expect(duration).to eq 90*60
    end

    it 'adds attr to return obj' do
      group.add_biweekly_schedule(:monday, :wednesday, '17:00')
      klass = group.classes_between(next_monday, next_friday).first
      expect(klass).to respond_to(:group)
      expect(klass.group).to be_a Group
      expect(klass.group.id).to eq group.id
    end

    it 'when schedule is nil' do
      expect(group.classes_between(next_monday, next_friday)).to eq []
    end

  end
end
