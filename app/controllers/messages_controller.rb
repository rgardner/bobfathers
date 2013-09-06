class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      UserMailer.feedback_email(@message).deliver
      redirect_to root_url, notice: "Message Sent! Thanks for the feedback."
    else
      render 'new'
    end
  end
end
