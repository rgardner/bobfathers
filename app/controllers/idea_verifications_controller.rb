class IdeaVerificationsController < ApplicationController

  def edit
    @idea = Idea.find_by_verification_token!(params[:id])
  end

  def update
    @idea = Idea.find_by_verification_token!(params[:id])
    if @idea.update_attributes(idea_params)
      @idea.verified = true
      @idea.save!
      flash[:success] = "Thanks for verifying your idea."
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private
    def idea_params
      params.require(:idea).permit(:title, :description)
    end
end
