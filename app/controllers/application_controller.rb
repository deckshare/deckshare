class ApplicationController < ActionController::Base
  helper_method :current_user

  before_action :current_user

  protected

  def current_user
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to new_session_url, status: :unauthorized
  end

  def no_current_user
    redirect_to user_url if session.has_key?(:user_id)
  end
end
