class RegisterUsersController < ApplicationController
  before_action :set_register_user, only: [:show, :edit, :update, :destroy]

  # GET /register_users
  # GET /register_users.json
  def index
    @register_users = Operator.all
  end

  # GET /register_users/1
  # GET /register_users/1.json
  def show
  end

  # GET /register_users/new
  def new
    @register_user = Operator.new
  end


  # GET /register_users/1/edit
  def edit
  end

  # POST /register_users
  # POST /register_users.json
  def create
    @register_user = Operator.new(register_user_params)

    respond_to do |format|
      if @register_user.save
        format.html { redirect_to @register_user, notice: 'Register user was successfully created.' }
        format.json { render :show, status: :created, location: @register_user }
      else
        format.html { render :new }
        format.json { render json: @register_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register_users/1
  # PATCH/PUT /register_users/1.json
  def update
    respond_to do |format|
      if @register_user.update(register_user_params)
        format.html { redirect_to @register_user, notice: 'Register user was successfully updated.' }
        format.json { render :show, status: :ok, location: @register_user }
      else
        format.html { render :edit }
        format.json { render json: @register_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register_users/1
  # DELETE /register_users/1.json
  def destroy
    @register_user.destroy
    respond_to do |format|
      format.html { redirect_to register_users_url, notice: 'Register user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_user
      @register_user = Operator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_user_params
      params.require(:operator).permit(:name)
    end
end
