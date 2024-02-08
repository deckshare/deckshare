class UsersController < ApplicationController
  def new
  end

  def create
    redirect_to action: :show
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
end
