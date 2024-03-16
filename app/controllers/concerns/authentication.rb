# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  def authenticate_user!
    redirect_to(new_session_url, status: :unauthorized) unless current_user
  end

  def unauthenticate_user!
    redirect_to(user_url, status: :forbidden) if current_user
  end
end
