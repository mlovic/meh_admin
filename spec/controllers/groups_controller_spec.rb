require 'rails_helper'

RSpec.describe GroupsController do
  describe 'GET classes' do
    before(:all) { Timecop.freeze(base_time) }
    after(:all)  { Timecop.return }
    before do
      group = create(:group)
      group.add_biweekly_schedule(:monday, :wednesday, '17:00')
      get :classes, format: :json, :id => '1', 'start' => '2016-07-11', 
                                                'end'   => '2016-07-15'
      # crap. the url is GET /groups/id/classes
    end

    it 'asdf' do
      group = Group.find 1
      mon = Chronic.parse('next monday').to_time
      fri = Chronic.parse('next friday').to_time
      expect(group.classes_between(mon, fri).size).to eq 2
    end
    it 'renders classes template' do
      expect(response).to render_template("classes")
    end

    it 'returns json' do
      pending
      body = JSON.parse(response.body)
      expect(body.size).to eq 2
    end

  end
end
