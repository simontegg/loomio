class BaseController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!, :check_browser, :check_for_invitation, :get_notifications
  helper_method :time_zone

  private
  def time_zone
    if user_signed_in?
      current_user.time_zone
    else
      'Wellington'
    end
  end

  def check_browser
    if browser.ie6? # || browser.ie7?
      redirect_to browser_not_supported_url
    end
  end

  def check_for_invitation
    if session[:invitation_token] and user_signed_in?
      redirect_to invitation_path(session[:invitation_token])
    end
  end

  def get_notifications
    if user_signed_in?
      @unviewed_notifications = current_user.unviewed_notifications
      @notifications = current_user.recent_notifications
    end
  end

end
