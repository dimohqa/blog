require 'rails_helper'

RSpec.describe 'drafts/edit', type: :view do
  before do
    @draft = assign(:draft, Draft.create!)
  end

  it 'renders the edit draft form' do
    render

    assert_select 'form[action=?][method=?]', draft_path(@draft), 'post' do
    end
  end
end
