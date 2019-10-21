class ApplicationController < ActionController::Base
  protected

  def authenticate_admin_user!
    authenticate_user!

    redirect_to root_path, alert: 'Only admins' unless current_user.admin?
  end
end
