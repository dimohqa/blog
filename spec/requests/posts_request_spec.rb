# require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'renders a successful response without id post' do
      Post.create!(title: 'test Title', body: 'test test test')
      get posts_url
      expect(response).to be_successful
    end

    it 'renders a successful response for post with id user' do
      User.create!(email: 'test_user@yandex.ru', password: '1234567', firstName: 'firstName', lastName: 'lastName')
      Post.create!(title: 'test Title', body: 'test test test', author: 1)
      get posts_url
      expect(response).to be_successful
    end

    it 'renders a successful response for post with null id equal null user' do
      Post.create!(title: 'test Title', body: 'test test test', author: 0)
      get posts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      post = Post.create!(title: 'test Title', body: 'test test test', author: 1)
      get post_url(post.id)
      expect(response).to be_successful
    end
  end
end
