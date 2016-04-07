class UsersController < ApplicationController

  def show
    @user = GithubUser.new(current_user)
    # view => @user.followers.each { |follower| follower.blah }

  #   @user = current_user
  #   @followers = current_user.followers
  #   @starred = current_user.starred
  #   @following = current_user.following
  #   @orgs = current_user.orgs
  #   @repositories = current_user.repositories
  #
  end

  def create
  end
end
