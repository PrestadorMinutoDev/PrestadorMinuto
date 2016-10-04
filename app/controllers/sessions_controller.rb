class SessionsController < ApplicationController

  before_action :block_access, except: [:destroy]
  before_action :authorize, except: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authentic(@user.email,params[:session][:password])
      ## Cookie Encrypt
      cookies.signed[:guest_id] = @user.id
      sign_in(@user)
      redirect_to show_register_user_path(current_user)
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    cookies.delete :user_id
    redirect_to root_url
  end
end
