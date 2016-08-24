class AccountKindsController < ApplicationController
  before_action :set_account_kind, only: [:show, :edit, :update, :destroy]

  # GET /account_kinds
  # GET /account_kinds.json
  def index
    @account_kinds = AccountKind.all
  end

  # GET /account_kinds/1
  # GET /account_kinds/1.json
  def show
  end

  # GET /account_kinds/new
  def new
    @account_kind = AccountKind.new
  end

  # GET /account_kinds/1/edit
  def edit
  end

  # POST /account_kinds
  # POST /account_kinds.json
  def create
    @account_kind = AccountKind.new(account_kind_params)

    respond_to do |format|
      if @account_kind.save
        format.html { redirect_to @account_kind, notice: 'Account kind was successfully created.' }
        format.json { render :show, status: :created, location: @account_kind }
      else
        format.html { render :new }
        format.json { render json: @account_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_kinds/1
  # PATCH/PUT /account_kinds/1.json
  def update
    respond_to do |format|
      if @account_kind.update(account_kind_params)
        format.html { redirect_to @account_kind, notice: 'Account kind was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_kind }
      else
        format.html { render :edit }
        format.json { render json: @account_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_kinds/1
  # DELETE /account_kinds/1.json
  def destroy
    @account_kind.destroy
    respond_to do |format|
      format.html { redirect_to account_kinds_url, notice: 'Account kind was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_kind
      @account_kind = AccountKind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_kind_params
      params.require(:account_kind).permit(:name)
    end
end
