class ApplicationController < ActionController::Base
  before_action :current_user

  # Since we are not implementing auth for the app,
  # this is current_user helper whenever request is under user resource.
  def current_user
    @user ||= User.find(params[:id])
  end
  helper_method :current_user
end
