class PaymentController < ApplicationController
  before_filter :login_required

  include HttpartyHelper

  def index
  end

  def new
    @payment = Payment.new
    @payment.build_user
  end

  def show
    @payment = Payment.find_by(user_id: current_user.id)
  end

  def create_transaction
    @payment = Payment.new(payment_params)

    PaymentJSON(@payment.name, @payment.amount,@payment.cardNumber,@payment.monthCard,
                @payment.yearCard,params[:securityCode],@payment.holder,@payment.brand)

    @payment.user = current_user
    @payment.paymentId = @paymentId
    @payment.recurrentPayment = @recurrentPayment



    respond_to do |format|
      if @payment.save
        #redirect_to action: 'show', id:@user.id
        format.html { redirect_to payment_index_path, notice: @message }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :cardNumber, :monthCard, :yearCard, :securityCode, :holder, :brand, :recurrentPayment)
  end


end
