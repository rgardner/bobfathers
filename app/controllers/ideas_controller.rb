class IdeasController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  def index
    @idea = Idea.new
    if signed_in?
      @idea.suggested_by = current_user.email
    end
    @ideas_feed_items = Idea.where("verified = ?", true).order(sort_column +
                                   " " + sort_direction).page(params[:page])
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "Thanks for the idea! Email sent with verification " +
                        "instructions."
      @idea.send_verification_token
      redirect_to root_url
    else
      @ideas_feed_items = Idea.paginate(page: params[:page])
      render 'index' 
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(idea_params)
      flash[:success] = "Idea updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    Idea.find(params[:id]).destroy
    flash[:success] = "Idea removed."
    redirect_to root_url
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description, :suggested_by, :status,
                                   :event_url)
    end

    def sort_column
      Idea.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[ asc desc ].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
