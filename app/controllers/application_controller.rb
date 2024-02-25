class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :current_user

  protected

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
