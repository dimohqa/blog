require 'rails_helper'

RSpec.describe 'hello/index.html.erb', type: :view do
  it 'renders "Hello World"' do
    render
    expect(rendered).to match(/Hello World/)
  end
end
