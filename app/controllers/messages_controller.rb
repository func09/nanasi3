class MessagesController < ApplicationController
  
  def index
    @message = Message.new
    @messages = Message.find(:all, :order => 'created_at DESC')
  end
  
  def create
    @message = Message.new params[:message]
    if @message.save
      redirect_to '/'
    else
      render :action => 'index'
    end
  end

end
