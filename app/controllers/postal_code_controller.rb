class PostalCodeController < ApplicationController
  before_action :set_postal_code, only: [:show, :edit, :update, :destroy]


  def new
    @postalcode = PostalCode.new
  end

  def create

    @postalcode = PostalCode.new(postal_code_params)


    respond_to do |format|
      if @postalcode.save
        #redirect_to action: 'show', id:@user.id
        format.html { redirect_to @postalcode, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @postalcode }
      else
        format.html { render :register_user }
        format.json { render json: @postalcode.errors, status: :unprocessable_entity }
      end
    end


  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @postalcode = PostalCode.find(params[:id])
  end

  def postal_code_params
    params.require(:postal_code).permit(:zip_number)
  end
end
