require 'rails_helper'

RSpec.describe Teacher, type: :model do
  let(:teacher) { build(:izzy) }
  before do
    create(:group, teacher: teacher).add_biweekly_schedule!(:monday, :wednesday, '19:00', 60*90)
    create(:group, teacher: teacher).add_biweekly_schedule!(:monday, :wednesday, '17:00')
  end

  describe '#hours_per_weeek' do

    it 'works' do
      expect(teacher.hours_per_week).to eq 5
    end
  end

  describe '#classes_between' do
    it 'returns classes of all groups' do
      expect(teacher.classes_between(next_monday, next_friday).size).to eq 4
    end
  end
end
