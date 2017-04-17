module ApplicationHelper
  def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
      !current_user.nil?
  end

  def flash_class(level)
      case level
          when :notice then "alert alert-info"
          when :success then "alert alert-success"
          when :error then "alert alert-error"
          when :alert then "alert alert-error"
      end
  end
end
