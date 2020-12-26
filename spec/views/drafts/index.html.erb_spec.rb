require 'rails_helper'

RSpec.describe 'drafts/index', type: :view do
  before do
    assign(:drafts, [
             Draft.create!,
             Draft.create!
           ])
  end

  it 'renders a list of drafts' do
    render
  end
end
