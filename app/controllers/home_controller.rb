class HomeController < ApplicationController

  def index
    @ads = Ad.all.page(params[:page]).per(2)
  end
end
