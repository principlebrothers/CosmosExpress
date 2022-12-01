require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Here is the list of all users')
    end
  end

  describe 'GET/show' do
    it 'returns http success' do
      get '/users/1'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('A specific user based on the id')
    end
  end
end
