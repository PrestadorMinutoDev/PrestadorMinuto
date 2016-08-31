
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    tmpcryp =::Decrypter.new
    @user = User.find(params[:id])
    @user.doc =  tmpcryp.decrypt @user.doc, @user.slt
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
    @user.phones.build
  end

  # POST /register_user/create
  def create_register_user

    @user = User.new(register_user_params)


    #@user.slt = tmpcryp.get_cipher_salt
    #@user.doc = tmpcryp.encrypt @user.doc, @user.slt
    #@user.pwd = tmpcryp.creatHash @user.pwd
    #@user.save


    respond_to do |format|
      if @user.save
        #redirect_to action: 'show', id:@user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :register_user }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end


    end

  # POST /users
  # POST /users.json
  def create

    puts "Entrou no Users"
    tmpcryp =::Decrypter.new
    @user = User.new(user_params)

    ##Criando o Operador
    @operator = Operator.find(1)

    ##Criando o Phone
    @phone = Phone.new
    #@phone.number = @user.mobile
    @phone = Phone.find_or_create_by(number: @user.mobile)
    @phone.operator_id = @operator.id
    @phone.save
    @user.slt = tmpcryp.get_cipher_salt
    @user.doc = tmpcryp.encrypt @user.doc, @user.slt
    @user.pwd = tmpcryp.creatHash @user.pwd
    @user.mobile = nil

    @user.save
    ##Criando o User_phone
    @user_phone = UserPhone.new
    @user_phone.user_id = @user.id
    @user_phone.phone_id = @phone.id
    @user_phone.save

    ##Insert User
    @user.mobile = @user_phone.id
    @user.last_logon = Time.now
    @user.save




    respond_to do |format|
      if @user.save

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
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
    params.require(:user).permit(:name,:doc, :birthdate, :email, :last_logon, :certdate,:pwd,:pwd_confirmation,
                                  phones_attributes: [:number,:haswp])
  end
end