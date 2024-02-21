class UsersController < ApplicationController
  include Authentication

  before_action :authenticate!, except: %i[new create]
  before_action :unauthenticate!, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)
    @user.save!

    redirect_to action: :show
  rescue ActiveRecord::RecordInvalid
    render action: :new, status: :unprocessable_entity
  end

  def show
  end

  def edit
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
