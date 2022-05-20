# frozen_string_literal: true

# HomeHelper
module UsersHelper
  def redirect_connection(user)
    redirect_to users_path if user.nil?
  end

  def user_has_commented(article_id, user_id)
    Comment.where(article_id:, user_id:).any?
  end
end
