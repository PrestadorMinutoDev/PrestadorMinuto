class StreetController < ApplicationController
  before_action :set_street, only: [:show, :edit, :update, :destroy]


  def new
    @street = Street.new
  end

  def create

    @street = Street.new(street_param)


    respond_to do |format|
      if @street.save
        #redirect_to action: 'show', id:@user.id
        format.html { redirect_to @street, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @street }
      else
        format.html { render :register_user }
        format.json { render json: @street.errors, status: :unprocessable_entity }
      end
    end


  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_street
    @street = Street.find(params[:id])
  end

  def street_param
    params.require(:street).permit(:name)
  end
end
