class UserSessionsController < ApplicationController
  skip_before_filter :login_required

  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])

   if @user_session.save
      redirect_to(root_url, :notice =>  t('success_login'))
   else
      render :action => "new"
   end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    
    redirect_to(root_url, :notice =>  t('sucess_logout'))
  end
end
