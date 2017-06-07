class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private
	  def current_user
	    user_id = params.dig('events').first.dig('source','userId')
      User.create!(line_user_id: user_id) if !User.exists?(line_user_id: user_id)
      @current_user ||= User.find_by(line_user_id: user_id)
	  end
end
