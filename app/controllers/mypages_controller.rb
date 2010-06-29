class MypagesController < ApplicationController
  
  before_filter :login_required
  
  @@per_page = 20
  
  def show
    @statuses = current_user.statuses.paginate(:page => params[:page], :per_page => @@per_page, :order => 'created_at DESC')
  end

end
