class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_teacher!


 rescue_from Warden::NotAuthenticated, with: :user_not_authenticated

  def after_sign_in_path_for(resource)
    super(resource)
  end

  protected

  def user_not_authenticated
    flash[:alert] = "You need to sign in or sign up before continuing."
    redirect_to new_teacher_session_path
  end
end
