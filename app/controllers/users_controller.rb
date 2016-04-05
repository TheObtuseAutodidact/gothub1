class UsersController < ApplicationController
  def show
    @user = User.first
  end

  def create
  end
end
