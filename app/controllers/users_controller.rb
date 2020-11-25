class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create

    @user = User.new(first_name: params[:first_name], 
                    last_name: params[:last_name],
                    email: params[:mail])
    if params[:password] != params[:confirmpassword]
      flash.now[:danger] = "Passwords must match !"
      render :action => 'new' 
    end
    if @user.save # essaie de sauvegarder en base @gossip
        flash[:success] = "You successfuly created your account"
        UserMailer.with(user: @user).welcome_email.deliver_now
        redirect_to :controller => 'users', :action => 'index'
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      flash.now[:danger] = "Error with the account creation"
      render :action => 'new'
    end
  end

end
