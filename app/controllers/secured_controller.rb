class SecureApplicationController < ApplicationController
  before_filter :require_user
  
  def require_no_user
    if !current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
      return false
    end
  end

end
