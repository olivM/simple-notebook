class AccountController < ApplicationController
  before_filter :login_required
  before_filter :user_info
  before_filter :notebooks_info
  
  layout 'main'
  
  def index
    
  end
  
end
