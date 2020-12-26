require 'rails_helper'

RSpec.describe "drafts/show", type: :view do
  before(:each) do
    @draft = assign(:draft, Draft.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
