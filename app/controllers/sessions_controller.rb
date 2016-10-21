class SessionsController < ApplicationController

  before_action :block_access, except: [:destroy]
  before_action :authorize, except: [:new, :create]

  def new
  end

  def create
    ##If exist in parameter @ = Login with Email.
    if params[:session][:login].include? "@"
      @user = User.find_by(email: params[:session][:login].downcase)

    ##Else login with phone
    else
    p = Phone.find_by_number(params[:session][:login])
    ##UserPhone = Phone_id with parameter NUMBER
    up = UserPhone.find_by_phone_id(p.id)
    #UserFind = UserPhone.user with parameter ID
    uf = up.user
    @user = uf

    end

    if @user.nil?
      render 'new'
    else
      if @user || @user.authentic(params[:login],params[:session][:password])
        ## Cookie Encrypt
        cookies.signed[:guest_id] = @user.id
        sign_in(@user)
        redirect_to show_register_user_path(current_user)
      else
        render 'new'
      end
    end
  end

  def destroy
    sign_out
    cookies.delete :guest_id
    redirect_to root_url
  end
end
