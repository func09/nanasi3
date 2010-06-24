class MessagesController < ApplicationController
  
  def index
    @message = Message.new
    @messages = Message.find(:all, :order => 'created_at DESC', :limit => 10)
  end
  
  def create
    @message = Message.new params[:message]
    @messages = Message.find(:all, :order => 'created_at DESC', :limit => 10)
    if @message.save
      flash[:success] = 'あなたに代わって内緒のつぶやきをしました！'
      redirect_to '/'
    else
      flash[:error] = '内緒のつぶやきに失敗しました'
      render :action => 'index'
    end
  end

end
