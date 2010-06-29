class StatusesController < ApplicationController
  
  before_filter :login_required, :only => [:destroy]
  @@per_page = APP_CONFIG[:statuses]['per_page']
  
  # GET /statuses
  def index
    @statuses = Status.paginate(:page => params[:page], :per_page => @@per_page, :order => 'created_at DESC')
  end
  
  # GET /statuses/timeline.json
  def timeline
    @statuses = Status.paginate(:page => params[:page], :per_page => @@per_page, :order => 'created_at DESC')
    data = {
      :pagination => render_to_string(:template => '/statuses/_more.html.haml', :locals => {:next_page => @statuses.next_page}),
      :timeline => render_to_string(:template => '/statuses/_timeline.html.haml', :locals => {:statuses => @statuses}),
    }
    respond_to do |format|
      format.json { render :json => data }
    end
  end
  
  # GET /statuses/1
  def show
    @status = Status.find_by_uuid(params[:uuid])
  end

  # POST /statuses
  def create
    @status = Status.new(params[:status])
    @status.signature = signature
    @statuses = Status.paginate(:page => params[:page], :per_page => @@per_page, :order => 'created_at DESC')
    
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

end
