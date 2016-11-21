class PaymentController < ApplicationController

  include HttpartyHelper

  def index
  end

  def new
    @payment = Payment.new
  end

  def create_transaction
    @payment = Payment.new(payment_params)

    PaymentJSON(@payment.name, @payment.amount,@payment.cardNumber,@payment.monthCard,
                @payment.yearCard,@payment.securityCode,@payment.holder,@payment.brand)


    respond_to do |format|
      if @payment.save
        #redirect_to action: 'show', id:@user.id
        format.html { redirect_to payment_index_path, notice: 'Payment successfully.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :cardNumber, :monthCard, :yearCard, :securityCode, :holder, :brand)
  end


end
