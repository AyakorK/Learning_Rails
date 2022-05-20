# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  describe 'GET /articles' do
    it 'returns http success' do
      get articles_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /articles/new' do
    context 'when we log to create a new article' do
      it 'returns http success' do
        login_as(user)
        get new_article_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET /articles/:id' do
    context 'when we want to show an article' do
      it 'returns http success' do
        login_as(user)
        get article_path(article)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET /articles/:id/edit' do
    context 'when we want to edit an article' do
      it 'returns http success' do
        login_as(user)
        get edit_article_path(article)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST /articles' do
    context 'when user is not logged in' do
      let(:article) { create(:article) }

      it 'Redirect if user is not logged in' do
        post articles_path params: { article: { title: article.title, body: article.body, status: article.status, id: 1, user_id: 3 } }
        expect(response).to have_http_status(:found)
      end
    end

    context 'when user is logged in' do
      let(:user) { create(:user) }
      let(:article) { create(:article, user:, status: 'public') }
      let(:article_params) { { title: article.title, body: article.body, status: article.status, user_id: user.id } }

      before do
        login_as(user)
      end

      context 'when user tries to create an article with a fake id' do
        let(:article_params) { { title: article.title, body: article.body, status: article.status, user: create(:user).id } }

        it 'Launch an error 404 if the user tries to publish with an other id than his id' do
          post articles_path, params: { article: article_params }
          expect(response).to have_http_status(:not_found)
        end
      end

      context 'when user tries to create an article with a fake status' do
        let(:article_params) { { title: article.title, body: article.body, status: 'fake', user_id: user.id } }

        it 'Launches an error 422' do
          post articles_path, params: { article: article_params }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when user tries to create an article with correct datas' do
        it 'Launch a status 302' do
          post articles_path, params: { article: article_params }
          expect(response).to have_http_status(:found)
        end
      end
    end
  end

  describe 'DELETE /articles/:id' do
    context 'when user is not logged in' do
      let(:article) { create(:article) }

      it 'Redirect if user is not logged in' do
        delete article_path(article)
        expect(response).to have_http_status(:found)
      end
    end

    context 'when user is logged in' do
      let(:article) { create(:article, status:, user:) }
      let(:user) { create(:user) }
      let(:status) { 'public' }

      before do
        login_as(user)
      end

      context 'when user tries to delete an article with correct datas' do
        it 'Launches a status 302' do
          delete article_path(article)
          expect(response).to have_http_status(:found)
        end
      end
    end
  end
end
