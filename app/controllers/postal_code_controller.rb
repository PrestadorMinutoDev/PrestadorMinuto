class PostalCodeController < ApplicationController

  def show
  end

  # GET /phones/new
  def new
    @postal_code = PostalCode.new
  end

  # GET /phones/1/edit
  def edit
  end

  # POST /phones
  # POST /phones.json
  def create
    @postal_code = PostalCode.new(postal_code_params)

    respond_to do |format|
      if @postal_code.save
        format.html { redirect_to @postal_code, notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: @postal_code }
      else
        format.html { render :new }
        format.json { render json: @postal_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1
  # PATCH/PUT /phones/1.json
  def update
    respond_to do |format|
      if @postal_code.update(phone_params)
        format.html { redirect_to @postal_code, notice: 'Phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @postal_code }
      else
        format.html { render :edit }
        format.json { render json: @postal_code.errors, status: :unprocessable_entity }
      end
    end
  end
  def postal_code_params
    params.require(:postal_code).permit(:id,:number)
  end
end
