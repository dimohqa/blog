require 'rails_helper'

RSpec.describe 'drafts/new', type: :view do
  before do
    assign(:draft, Draft.new)
  end

  it 'renders new draft form' do
    render

    assert_select 'form[action=?][method=?]', drafts_path, 'post' do
    end
  end
end
