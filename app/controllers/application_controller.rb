class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :time_of_day
	
	def time_of_day
	time = Time.now.hour
	if time<6
		"night"
	elsif time < 11
		"morning"
	elsif time < 16
		"day"
	elsif time < 20
		"evening"
	else
		"night"
	end
  end
  
  def color_by_time
	period = time_of_day
	case period
		when "night" 
			"black"
		when "evening" 
			"#0A1451"
		when "day" 
			"#66296E"
		when "morning"
			"#8F0100"
	end
  end
end
