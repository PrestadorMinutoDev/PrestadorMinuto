class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_filter :login_required, :only => ['my_ads']

  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.all
  end

  def index_by_profession
    @ads = Ad.search(params[:search])
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    @ads = Ad.find(params[:id])
  end

  # GET /ads/new
  def new
    @ad = Ad.new
    @ad.build_profession
    @ad.build_user
    @ad.images.build
  end

  # GET /ads/1/edit
  def edit

    params[:id] = current_user
    @ad = Ad.find_by(user_id: params[:id])
    puts @ad.profession_id

  end

  # POST /ads
  # POST /ads.json
  def create

    @ad = Ad.new(ad_params)
    @profession = Profession.find(params[:profession][:profession_id])

    ##Need pass a param with having a user_id
    params[:user_id] = current_user
    @user = User.find_by(id: params[:user_id])
    @ad.profession = @profession
    @ad.user = @user


    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render :show, status: :created, location: @ad }
      else
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    respond_to do |format|
      @profession = Profession.find(params[:profession][:profession_id])
      @ad.profession = @profession
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_ads
    @ads = Ad.all.where(user_id: current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:description, :rating_avg, :search ,profession_attributes: [:name_m, :name_f], image_attributes: [:pictures])
    end
end
