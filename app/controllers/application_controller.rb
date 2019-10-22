# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protected

  def authenticate_admin_user!
    authenticate_user!

    redirect_to root_path, alert: 'Only admins' unless current_user.admin?
  end

  def set_admin_locale
    locale = params[:locale] || cookies[:locale] || I18n.default_locale

    cookies[:locale] = I18n.locale = locale
  end
end
