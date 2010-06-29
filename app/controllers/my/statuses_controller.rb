class My::StatusesController < ApplicationController
  
  before_filter :login_required
  @@per_page = APP_CONFIG[:statuses]['per_page']
  
  def index
    @statuses = current_user.statuses.paginate(
                  :page => params[:page], 
                  :per_page => @@per_page, 
                  :order => 'created_at DESC')
  end

  def timeline
    @statuses = current_user.statuses.paginate(:page => params[:page], :per_page => @@per_page, :order => 'created_at DESC')
    data = {
      :pagination => render_to_string(:template => '/my/statuses/_more.html.haml', :locals => {:next_page => @statuses.next_page}),
      :timeline => render_to_string(:template => '/my/statuses/_timeline.html.haml', :locals => {:statuses => @statuses}),
    }
    respond_to do |format|
      format.json { render :json => data }
    end
  end
  
  def destroy
    @status = current_user.statuses.find(params[:id])
    @status.destroy
    redirect_back_or_default(my_root_path)
  end

  
end
