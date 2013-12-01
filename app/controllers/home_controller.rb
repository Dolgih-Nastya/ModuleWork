class HomeController < ApplicationController
   # GET /news
  # GET /news.json
  def index
	@newses = News.all.order(created_at: :desc)
	@period = time_of_day
  end
end
