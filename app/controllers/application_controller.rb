class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :github_service

  before_action :prepare_github_service

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def prepare_github_service
    current_user.set_service_with_user(current_user) unless current_user.nil?
  end

  # def github_service
  #   @github_service ||= GithubService.new(current_user) if current_user
  # end
end
