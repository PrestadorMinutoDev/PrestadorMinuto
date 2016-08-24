class UserPhonesController < ApplicationController
  before_action :set_user_phone, only: [:show, :edit, :update, :destroy]

  # GET /user_phones
  # GET /user_phones.json
  def index
    @user_phones = UserPhone.all
  end

  # GET /user_phones/1
  # GET /user_phones/1.json
  def show
  end

  # GET /user_phones/new
  def new
    @user_phone = UserPhone.new
  end

  # GET /user_phones/1/edit
  def edit
  end

  # POST /user_phones
  # POST /user_phones.json
  def create
    @user_phone = UserPhone.new(user_phone_params)

    respond_to do |format|
      if @user_phone.save
        format.html { redirect_to @user_phone, notice: 'User phone was successfully created.' }
        format.json { render :show, status: :created, location: @user_phone }
      else
        format.html { render :new }
        format.json { render json: @user_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_phones/1
  # PATCH/PUT /user_phones/1.json
  def update
    respond_to do |format|
      if @user_phone.update(user_phone_params)
        format.html { redirect_to @user_phone, notice: 'User phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_phone }
      else
        format.html { render :edit }
        format.json { render json: @user_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_phones/1
  # DELETE /user_phones/1.json
  def destroy
    @user_phone.destroy
    respond_to do |format|
      format.html { redirect_to user_phones_url, notice: 'User phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_phone
      @user_phone = UserPhone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_phone_params
      params.require(:user_phone).permit(:user_id, :phone_id)
    end
end
