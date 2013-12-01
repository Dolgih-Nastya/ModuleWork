class HomeController < ApplicationController
   # GET /news
  # GET /news.json
  def index
	@newses = News.all
	@period = time_of_day
  end
end
