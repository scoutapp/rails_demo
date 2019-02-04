class ApplicationController < ActionController::Base
  before_action :current_user

  # Since we are not implementing auth for the app,
  # this is current_user helper whenever request is under user resource.
  def current_user
    @user ||=
      if params[:user_id]
        User.find_by(id: params[:user_id])
      elsif params[:id]
        User.find_by(id: params[:id])
      else
        nil
      end
  end
  helper_method :current_user
end
