require 'rails_helper'

test_draft = {
  title: 'title',
  body: 'test',
  id: 1,
  author: 1
}

test_draft_updated = {
  title: 'title2',
  body: 'test2'
}

RSpec.describe '/drafts', type: :request do
  before do
    user = User.create!(email: 'test_user@yandex.ru', password: '1234567', firstName: 'firstName', lastName: 'lastName', id: 1)
    allow_any_instance_of(DraftsController).to receive(:current_user).and_return(user)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Draft.create!
      get drafts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      draft = Draft.create!
      get draft_url(draft)
      expect(response).to be_successful
    end

    it 'redirects if draft not found' do
      get draft_url(999)
      expect(response).to redirect_to(drafts_url)
    end
  end

  describe 'POST /create' do
    it 'redirects if draft created' do
      post drafts_path, params: { draft: test_draft }
      created_draft = Draft.all[0]
      expect(response).to redirect_to(draft_path(created_draft[:id]))
    end
  end

  describe 'PATCH /update' do
    it 'redirects if draft updated' do
      draft = Draft.create!(test_draft)
      patch draft_url(draft[:id]), params: { draft: test_draft_updated }
      expect(response).to redirect_to(draft_url(draft[:id]))
    end
  end

  describe 'Delete /destroy' do
    it 'destroy draft a successful' do
      draft = Draft.create!(test_draft)
      delete draft_url(draft[:id])
      expect { draft.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'POST /publish' do
    it 'redirect post if draft publish' do
      draft = Draft.create!(test_draft)
      post drafts_publish_url(draft)
      expect(response).to redirect_to(posts_path(1))
    end
  end
end
