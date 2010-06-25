class MypagesController < ApplicationController
  
  before_filter :login_required
  
  def show
    @statuses = current_user.statuses
  end

end
