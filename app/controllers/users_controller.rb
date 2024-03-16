# frozen_string_literal: true

class UsersController < ApplicationController
  include Authentication

  before_action :authenticate_user!, except: %i[new create]
  before_action :unauthenticate_user!, only: %i[new create]

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(create_params)
    @user.save!

    redirect_to action: :show
  rescue ActiveRecord::RecordInvalid
    render action: :new, status: :unprocessable_entity
  end

  def update
    redirect_to action: :show
  end

  def destroy
    redirect_to action: :new
  end

  private

  def create_params
    params.require(:user).permit(*%i[username email password password_confirmation])
  end
end
