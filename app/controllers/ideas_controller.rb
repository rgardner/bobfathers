class IdeasController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @idea = Idea.new
    @ideas_feed_items = Idea.order(sort_column + " " + sort_direction).page(params[:page])
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

  def destroy
    Idea.find(params[:id]).destroy
    flash[:success] = "Idea removed."
    redirect_to root_url
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description, :suggested_by)
    end

    def sort_column
      Idea.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[ asc desc ].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
