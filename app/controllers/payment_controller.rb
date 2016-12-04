class PaymentController < ApplicationController
  before_filter :login_required

  include CieloHelper

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

    Pagando(@payment.name,@payment.cardNumber,@payment.monthCard,
                @payment.yearCard,params[:securityCode],@payment.holder,@payment.brand, @payment.timeAccount)


    @payment.user = current_user
    @payment.paymentId = @paymentId
    @payment.recurrentPayment = @recurrentPayment
    @payment.endDate = @endDate
    @payment.amount = @amount




    respond_to do |format|

      ##Condition Operation Sucessful
      if @message == 'Operation Successful'
        ## IF Operation Sucessful save the payment
        if @payment.save

          @user = User.find(current_user)
          @user.account.account_kind_id = 2


          #redirect_to action: 'show', id:@user.id
          format.html { redirect_to payment_index_path, notice: @message }
          format.json { render :show, status: :created, location: @payment }
        else
          format.html { render :new }
          format.json { render json: @payment.errors, status: :unprocessable_entity }
        end

        ## Operation Failed.
      else
        format.html { redirect_to new_payment_path, notice: @message }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :cardNumber, :monthCard, :yearCard,
                                    :securityCode, :holder, :brand, :recurrentPayment, :timeAccount,:endDate)
  end


end
