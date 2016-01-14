require 'rails_helper'

RSpec.describe CalendarsController do
  before(:all) { Timecop.freeze(base_time) }
  after(:all)  { Timecop.return }
  describe 'GET /all_classes' do
    before do
      create(:group).add_biweekly_schedule(:monday, :wednesday, '17:00')
      create(:group).add_biweekly_schedule(:tuesday, :wednesday, '17:00')
      get :all_classes, format: :json, 'start' => '2016-07-11', 
                                       'end'   => '2016-07-15'
    end

    it 'renders classes template' do
      expect(response).to render_template("application/classes")
      # TODO share classes template 
    end

    it 'returns json' do
      body = JSON.parse(response.body)
      expect(body.size).to eq 4
    end

  end
end
