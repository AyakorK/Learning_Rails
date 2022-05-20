# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:article) { create(:article) }
  let(:user) { create(:user) }
  let(:comment) { create(:comment, article:, user:, status:) }
  let(:status) { 'public' }
  let(:params) { { commenter: comment.commenter, body: comment.body, stars: comment.stars, status: comment.status, user_id: user.id } }

  describe 'Creating a comment' do
    context 'when the user is not logged in' do
      it 'Redirect and return a status 302' do
        post article_comments_path(article), params: { comment: params }
        expect(response).to have_http_status(:found)
      end
    end

    context 'when user is logged in' do
      before do
        login_as(user)
      end

      context 'when all infos are good' do
        it 'Launch a status 200 if the user is logged in and datas are correct' do
          post article_comments_path(article), params: { comment: params }
          expect(response).to have_http_status(:ok)
        end
      end

      context 'when the user is giving a wrong id' do
        let(:params) { { commenter: comment.commenter, body: comment.body, stars: comment.stars, status: comment.status, user_id: 3000 } }

        it 'Launch an error 404 if the user tries to publish with an other id than his id' do
          post article_comments_path(article), params: { comment: params }
          expect(response).to have_http_status(:not_found)
        end
      end

      context 'when user tries to send fake datas' do
        let(:params) { { commenter: comment.commenter, body: comment.body, stars: comment.stars, status: 'fake', user_id: user.id } }

        it 'Launches an error 422' do
          post article_comments_path(article), params: { comment: params }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe 'Deleting a comment' do
    context 'when the user is not logged in' do
      it 'Redirect and return a status 302' do
        delete article_comment_path(article, user.id, comment)
        expect(response).to have_http_status(:found)
      end
    end

    context 'when user is logged in' do
      before do
        login_as(user)
      end

      context 'when the user is the author of the comment' do
        it 'Launch a status 200 if the user is logged in and datas are correct' do
          delete article_comment_path(article, comment)
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
