class NotificationItems::MotionClosed < NotificationItem
  attr_accessor :notification

  delegate :url_helpers, to: 'Rails.application.routes'

  def initialize(notification)
    @notification = notification
  end

  def actor
    @notification.event.user
  end

  def action_text
    I18n.t('notifications.motion_closed.by_expiry') + ": "
  end

  def title
    @notification.eventable.name
  end

  def link
    url_helpers.motion_path(@notification.eventable)
  end

  def avatar
    if actor
      actor
    else
      @notification.eventable.author
    end
  end
end
