class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      UserMailer.feedback_email(@message).deliver
      flash[:success] = "Message sent! Thanks for the feedback."
      redirect_to root_url
    else
      render 'new'
    end
  end
end
