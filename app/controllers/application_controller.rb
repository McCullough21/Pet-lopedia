# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @user ||= User.find_by(id: session[:id])
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to '/', alert: 'You must log in or sign up' unless logged_in?
  end
end
