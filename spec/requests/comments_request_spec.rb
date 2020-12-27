#require 'rails_helper'

new_comment_params = {
  author_id: '1',
  username: 'Иван Иваныч',
  body: 'new body'
}

RSpec.describe 'Comments', type: :request do
  describe 'GET /index' do
    it 'renders a successful response without id post' do
      comment = Comment.create!(author_id: '1', username: 'Иван Иваныч', body: 'new body')
      get post_comments_url
      expect(response).to be_successful
    end
  end
end
