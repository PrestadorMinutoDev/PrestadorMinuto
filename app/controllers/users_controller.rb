
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
 # before_filter :login_required, :except => ['new', 'register_user', 'create_register_user']
 # before_filter :block_access, :only =>['register_user']

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show

    @user = User.find(params[:id])

  end

  # GET /users/new
  def new
    @user = User.new
    @user.phones.build

  end

  # GET /users/1/edit
  def edit
  end



  # GET /register_user/new
  def register_user
    @user = User.new
    @user.build_address
    @user.phones.build
    @user.address.build_postal_code
    @user.address.build_street
    @user.address.build_city

  end


  # POST /register_user/create
  def create_register_user

   @user = User.new(register_user_params)
   @user.last_logon = Time.now

    respond_to do |format|
      if @user.save
        #redirect_to action: 'show', id:@user.id
        format.html { redirect_to home_index_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :register_user }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end


  end

  def update_register_users
    respond_to do |format|
      @user = User.find(cookies.signed[:guest_id])
      if @user.update(register_user_params)
        format.html { redirect_to show_register_user_path, notice: 'User was successfully updated.' }
        format.json { render :show_register_users, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /users
  # POST /users.json

  def show_register_users

    params[:id] = current_user
    @user = User.find(params[:id])

  end

  def edit_register_user
    params[:id] = current_user
    @user = User.find(params[:id])
    @phone = Phone.find_by(id: params[:id])
    @address = Address.find(params[:id])
  end


  def index_register_users
      @users = User.all
      @phones = Phone.all
      @addresses = Address.all
  end



  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(register_user_params)
        format.html { redirect_to show_register_user_path, notice: 'User was successfully updated.' }
        format.json { render :show_register_users, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :mobile, :doc, :birthdate, :email, :last_logon, :certdate)
    end

  def register_user_params
    params.require(:user).permit(:id,:name,:gender,:doc, :birthdate, :email, :last_logon, :certdate,:pwd,:pwd_confirmation, :avatar,
                                 phones_attributes: [:id,:number,:haswp],
                                 accounts_attributes:[:account_status],
                                 address_attributes: [:number, :complement, :geolocate, :state_id, :country_id,
                                                      postal_code_attributes: [:zip_number],street_attributes: [:name],
                                                      city_attributes: [:name]])
  end
end