class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      flash.now[:success] = "Welcome from sample app"
      log_in user       # from app/controllers/help log_in
      redirect_to current_user    # from app/controller/help current_user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination or Invalid User Account'   # flash[:success]
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
