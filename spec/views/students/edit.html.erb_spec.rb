require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, create(:student))
  end

  it "renders the edit student form" do
    pending
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do
    end
  end
end
