class SecretsController < ApplicationController
  cattr_reader :per_page
  @@per_page = 10
  def index
    @messages = Message.paginate(:page => params[:page], :order => 'created_at DESC') 
  end

end
