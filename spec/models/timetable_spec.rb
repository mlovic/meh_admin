require 'rails_helper'

describe Timetable do
  describe '#hours_per_week' do
    let(:group) { build(:group_with_schedule) }

    it 'works with 2 hours' do
      expect(group.schedule.hours_per_week).to eq 2
    end

    it 'works with 3 hours' do
      gr = build(:group).add_biweekly_schedule(:monday, :wednesday, '17:00', 90*60)
      expect(gr.schedule.hours_per_week).to eq 3
    end
  end
end
