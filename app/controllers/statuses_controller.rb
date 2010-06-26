class StatusesController < ApplicationController
  # GET /statuses
  def index
    @status = Status.new
    @statuses = Status.find(:all, :order => 'created_at DESC')
  end

  # GET /statuses/1
  def show
    @status = Status.find_by_uuid(params[:uuid])
  end

  # POST /statuses
  def create
    @status = Status.new(params[:status])
    @statuses = Status.find(:all, :order => 'created_at DESC')
    
    if logged_in?
      @status.user = current_user
      @status.anonymous = false
    end
    
    if @status.save
      flash['success'] = '匿名ツイートに成功しました'
      redirect_to :action => 'index'
    else
      flash['error'] = '匿名ツイートに失敗しました'
      render :action => "index"
    end
  end

  # DELETE /statuses/1
  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    redirect_to(statuses_url)
  end
end
