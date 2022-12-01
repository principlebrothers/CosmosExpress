require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success and check the correct text in placeholder' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('All specific user with all his/her posts')
    end
  end

  describe 'GET/show' do
    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Shows a specific post based on the id of a specific user')
    end
  end
end
