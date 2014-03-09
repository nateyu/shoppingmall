class SessionsController < ApplicationController
  skip_before_filter :login_required

  def login
    authorized = set_current_user ? 'success' : 'failed'
    render :text => authorized
  end

  def logout
    reset_session
    redirect_to root_path
  end

  def welcome
    if current_user
      redirect_to customer_types_path
    else
      render layout: false
    end
  end
end
