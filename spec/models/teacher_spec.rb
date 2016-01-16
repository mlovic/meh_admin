require 'rails_helper'

RSpec.describe Teacher, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:teacher) { build(:teacher) }
  describe '#hours_per_weeek' do
    it 'works' do
      build(:group, teacher: teacher).add_biweekly_schedule(:monday, :wednesday, '19:00', 60*90)
      build(:group, teacher: teacher).add_biweekly_schedule(:monday, :wednesday, '17:00')
      expect(teacher.hours_per_week).to eq 5
    end
  end
end
