class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :check_account, :set_locale, :login_required
  
  def set_locale
    I18n.locale = 'es-AR'
  end
  
  def check_account
    @account = Account.current = Account.find_by_subdomain(request.subdomain)
    if !@account
      redirect_to "/invalid_account.html"
      return false
    end
  end
  
  def login_required
    if !current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
      return false
    end
  end
  
  helper_method :current_user
  helper_method :is_admin
  helper_method :add_default

  def add_default(items)
    items.insert(0, [t("drop_select"),''])
  end

  def is_admin
    return @is_admin if defined?(@is_admin)
    @is_admin = current_user_session && current_user_session.record.user_type.is_admin
  end

	private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

end