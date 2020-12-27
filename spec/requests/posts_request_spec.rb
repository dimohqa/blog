# require 'rails_helper'

new_post_params = {
  title: 'new title',
  body: 'new body'
}

RSpec.describe 'Posts', type: :request do
  before do
    user = User.create!(email: 'test_user@yandex.ru', password: '1234567', firstName: 'firstName', lastName: 'lastName', id: 1)
    allow_any_instance_of(PostsController).to receive(:current_user).and_return(user)
  end

  describe 'GET /index' do
    it 'renders a successful response without id post' do
      Post.create!(title: 'test Title', body: 'test test test')
      get posts_url
      expect(response).to be_successful
    end

    it 'renders a successful response for post with id user' do
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

  describe 'PATCH /update' do
    it 'check correct change title' do
      post = Post.create!(title: 'test Title', body: 'test test test', author: 1)
      patch post_url(post.id), params: { post: { title: new_post_params[:title], body: new_post_params[:body] } }
      expect(post.reload[:title]).to eq new_post_params[:title]
    end

    it 'check correct change body' do
      post = Post.create!(title: 'test Title', body: 'test test test', author: 1)
      patch post_url(post.id), params: { post: { title: new_post_params[:title], body: new_post_params[:body] } }
      expect(post.reload[:body]).to eq new_post_params[:body]
    end

    it 'renders a error response' do
      Post.create!(title: 'test Title', body: 'test test test', author: 1)
      patch post_url(999), params: { post: { title: 'test Title', body: 'test test test', author: 1 } }
      expect(response).to redirect_to(posts_path)
    end
  end

  describe 'DELETE /destroy' do
    it 'destroy post a successful' do
      post = Post.create!(title: 'test Title', body: 'test test test', author: 1)
      delete post_url(post.id)
      expect { post.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'GET /myposts' do
    it 'renders a successful' do
      Post.create!(title: 'test Title', body: 'test test test', author: 1)
      get myposts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful' do
      post = Post.create!(title: 'test Title', body: 'test test test', author: 0)
      get edit_post_path(post.id)
      expect(response).to be_successful
    end
  end

  describe 'POST /up_rate_post' do
    it 'successes up rate post' do
      post = Post.create!(title: 'test Title', body: 'test test test', author: 0, up_rate: [0])
      get post_up_rate_path(post.id)
      expect(post.reload.up_rate).to eq %w[0 1]
    end
  end

  describe 'POST /down_rate_post' do
    it 'successes up rate post' do
      post = Post.create!(title: 'test Title', body: 'test test test', author: 0, up_rate: [0])
      get post_down_rate_path(post.id)
      expect(post.reload.down_rate).to eq ['1']
    end
  end

  describe 'GET /create' do
    it 'success create post, check title' do
      post posts_path, params: { post: { title: 'test Title', body: 'test test test' }, new_post: 'Save Post' }
      post = Post.all[0]
      expect(post.title).to eq 'test Title'
    end

    it 'success create post, check body' do
      post posts_path, params: { post: { title: 'test Title', body: 'test test test' }, new_post: 'Save Post' }
      post = Post.all[0]
      expect(post.body).to eq 'test test test'
    end

    it 'success create draft for post, check title' do
      post posts_path, params: { post: { title: 'test Title', body: 'test test test' }, new_draft: '' }
      draft = Draft.all[0]
      expect(draft.title).to eq 'test Title'
    end

    it 'success create draft for post, check body' do
      post posts_path, params: { post: { title: 'test Title', body: 'test test test' }, new_draft: '' }
      draft = Draft.all[0]
      expect(draft.body).to eq 'test test test'
    end
  end
end
