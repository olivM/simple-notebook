class AccountController < ApplicationController
  before_filter :login_required
  
  def index
    
  end
  
  def notebooks
    @notebooks = User.find(session[:user_id]).notebooks
  end
  
end
