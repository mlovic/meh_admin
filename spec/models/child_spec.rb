require 'rails_helper'

RSpec.describe Child do
  it 'inherits Student' do
    child = Child.new
    expect(child).to respond_to(:age)
  end
end
