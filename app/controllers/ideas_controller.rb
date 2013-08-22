class IdeasController < ApplicationController
  def index
    @idea = Idea.new
    @ideas_feed_items = Idea.paginate(page: params[:page])
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "Thanks for the idea!"
      redirect_to root_url
    else
      @ideas_feed_items = Idea.paginate(page: params[:page])
      render 'index' 
    end
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description, :suggested_by)
    end
end
