require 'rails_helper'

RSpec.describe "teachers/index", type: :view do
  before(:each) do
    assign(:teachers, [create(:izzy), create(:stefan)])
  end

  it "renders a list of teachers" do
    render
    assert_select "tr>td", :text => "Izzy".to_s, :count => 1
    assert_select "tr>td", :text => "Stefan".to_s, :count => 1
    #assert_select "tr>td", :text => "red".to_s, :count => 2
  end
end
