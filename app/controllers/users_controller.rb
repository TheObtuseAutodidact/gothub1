class UsersController < ApplicationController

  def show
    # binding.pry
    @user = current_user
    @followers = current_user.followers
    @starred = current_user.starred
    @following = current_user.following
    @orgs = current_user.orgs
    @repositories = current_user.repositories

    # @repos = Repo.all(current_user)
    # user = User.find(session[:user_id])
    # @service = GithubService.new(@user)
    # @user = GithubService.new(@user) I could call this @user - @user.followers should work in

  end

  def create
  end
end
