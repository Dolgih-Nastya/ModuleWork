class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
	@newses = News.all.order(created_at: :desc)
	if	s = params[:section]
		ns = NewsSection.where(section_id: s)
		if ns
			@ns.each do |n|
				@newses.where(id: n.news_id).destroy
			end
		end	
	end
  end

  # GET /news/1
  # GET /news/1.json
  def show
    puts params
    unless @news=News.where(id: params[:id]).first
      render text: "Page not found", :status => 404
    end
	unless @news.views_number
		@news.views_number=0
	end
	@news.views_number+=1
	@news.save
	@section_num = NewsSection.where(news_id: @news.id).first.section_id
	@section = Section.where(id: @section_num).first.name
  end

  # GET /news/new
  def new
    @news = News.new
	@section_num = NewsSection.new
  end

  # GET /news/1/edit
  def edit
    @news =News.find(params[:id])
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)
    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render action: 'show', status: :created, location: @news }
      else
        format.html { render action: 'new' }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
	@section_num = NewsSection.new(news_id:@news.id, section_id:params[:section_id])
	  if @section_num.save
		format.html { redirect_to @section_num, notice: 'News was successfully related with section.' }
        format.json { render action: 'show', status: :created, location: @section_num }
	  else
		format.html { render action: 'new' }
        format.json { render json: @section_num.errors, status: :unprocessable_entity }
	  end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
     @news =News.find(params[:id])
    respond_to do |format|
      if @news.update_attributes(news_params)
        puts 'news_params', news_params
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
	  
	@section_num = NewsSection.where(news_id:@news.id).first
	@section_num.update_attributes(section_id:params[:section_id])
	  if @section_num.save
		format.html { redirect_to @section_num, notice: 'News was successfully related with section.' }
        format.json { render action: 'show', status: :created, location: @section_num }
	  else
		format.html { render action: 'new' }
        format.json { render json: @section_num.errors, status: :unprocessable_entity }
	  end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
	@section_num = NewsSection.where(news_id:@news.id).first
	if @section_num
		@section_num.destroy()
	end
    @news.destroy()
    respond_to do |format|
      format.html { redirect_to news_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:header, :news)
    end
end
