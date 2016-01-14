require 'rails_helper'

RSpec.describe Adult do
  it 'inherits Student' do
    adult = Adult.new
    expect(adult).to respond_to(:age)
  end
end
