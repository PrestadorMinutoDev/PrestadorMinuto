class AccountResourcesController < ApplicationController
  before_action :set_account_resource, only: [:show, :edit, :update, :destroy]

  # GET /account_resources
  # GET /account_resources.json
  def index
    @account_resources = AccountResource.all
  end

  # GET /account_resources/1
  # GET /account_resources/1.json
  def show
  end

  # GET /account_resources/new
  def new
    @account_resource = AccountResource.new
  end

  # GET /account_resources/1/edit
  def edit
  end

  # POST /account_resources
  # POST /account_resources.json
  def create
    @account_resource = AccountResource.new(account_resource_params)

    respond_to do |format|
      if @account_resource.save
        format.html { redirect_to @account_resource, notice: 'Account resource was successfully created.' }
        format.json { render :show, status: :created, location: @account_resource }
      else
        format.html { render :new }
        format.json { render json: @account_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_resources/1
  # PATCH/PUT /account_resources/1.json
  def update
    respond_to do |format|
      if @account_resource.update(account_resource_params)
        format.html { redirect_to @account_resource, notice: 'Account resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_resource }
      else
        format.html { render :edit }
        format.json { render json: @account_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_resources/1
  # DELETE /account_resources/1.json
  def destroy
    @account_resource.destroy
    respond_to do |format|
      format.html { redirect_to account_resources_url, notice: 'Account resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_resource
      @account_resource = AccountResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_resource_params
      params.require(:account_resource).permit(:parameter, :account_kind_id, :resource_id)
    end
end
