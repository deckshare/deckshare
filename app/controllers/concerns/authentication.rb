# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  def authenticate!
    redirect_to(new_session_url, status: :unauthorized) unless current_user
  end

  def unauthenticate!
    redirect_to(user_url, status: :forbidden) if current_user
  end
end
