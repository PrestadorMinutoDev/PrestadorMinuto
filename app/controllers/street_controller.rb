class StreetController < ApplicationController

  def show
  end

  def new
    @street = Street.new
  end

  def edit
  end

  # POST /phones
  # POST /phones.json
  def create
    @street = Street.new(street_params)

    respond_to do |format|
      if @street.save
        format.html { redirect_to @street, notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: @street }
      else
        format.html { render :new }
        format.json { render json: @street.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_street
    @street = Street.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def street_params
    params.require(:street).permit(:id,:name)
  end
end
