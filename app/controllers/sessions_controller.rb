class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    user = User.find_and_authenticate_by!(**session_params.to_h.symbolize_keys)

    reset_session
    session[:user_id] = user.id

    redirect_to user_url
  rescue Deckshare::Errors::AuthenticationError
    @session = Session.new(session_params)
    render action: :new, status: :unauthorized
  end

  def destroy
    reset_session

    redirect_to action: :new
  end

  private

  def session_params
    params.require(:session).permit(*%i[email password])
  end
end
