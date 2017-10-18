require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  describe 'GET /posts' do
    let!(:posts) { create_list(:post, 3) }

    before { get '/posts' }

    it 'returns all posts' do
      posts = JSON.parse(response.body)
      expect(posts.size).to eq(3)
    end
  end

  describe 'POST /posts' do
    context 'valid' do
      let!(:post_item) { build(:post) }

      it 'creates post' do
        post '/posts', params: { category: post_item.category, content: post_item.content }
        expect(response).to have_http_status(:created)
      end
    end

    context 'invalid' do
      it 'creates post' do
        post '/posts', params: {}
        response_json = JSON.parse(response.body)

        expect(response_json['errors']).to be_present
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
