require 'rubygems'
require 'httparty'

module HttpartyHelper
  include HTTParty


#include HttpartyHelper - Para adicionar no controller
  def PaymentJSON(name,amount,cardNumber,monthCard, yearCard,securityCode,holder,brand)
    @urlstring_to_post = "https://apisandbox.cieloecommerce.cielo.com.br/1/sales"
    @result = HTTParty.post(@urlstring_to_post.to_str,

                          :headers => { 'Content-Type' => 'application/json',
                                        'MerchantId' => '3b216cfc-f290-46d5-8480-16780990f21a',
                                        'MerchantKey' => 'WXFQVNAPIREVWZFKUCBSNIESRDEKDVLXLYRHTKRU'},
                          :body => {"MerchantOrderId" => "2014111703",
                              "Customer" =>{
                                  "Name" => "#{name}"
                              },
                              "Payment" =>{
                                  "Type" => "CreditCard",
                                  "Amount" => "#{amount}",
                                  ##PARCELAS
                                  "Installments" => 1,
                                  "SoftDescriptor" => "PrestMinuto",
                                  "RecurrentPayment" => {
                                      "AuthorizeNow" => "true",
                                      "Interval" => "Monthly"
                                  },
                                  "CreditCard" => {
                                      "CardNumber" => "#{cardNumber}",
                                      "Holder" => "#{holder}",
                                      "ExpirationDate" => "#{monthCard}/#{yearCard}",
                                      "SecurityCode" => "#{securityCode}",
                                      "Brand" => "#{brand}",
                                  }
                              }
                          }.to_json)

  @ans = JSON.parse(@result.body)
  @paymentId = @ans['Payment']['PaymentId']
  @recurrentPayment = @ans['Payment']['RecurrentPayment']['RecurrentPaymentId']
  @message = @ans['Payment']['ReturnMessage']


    puts @recurrentPayment
    puts '######################'
  puts @result

  end



 def reccurent
    @urlstring_to_post = "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/1d0a7c56-e077-400a-aaaf-8f45d3f39fa4"


    @request = HTTParty.get(@urlstring_to_post,

                           :headers => { 'Content-Type' => 'application/json',
                                         'MerchantId' => '3b216cfc-f290-46d5-8480-16780990f21a',
                                         'MerchantKey' => 'WXFQVNAPIREVWZFKUCBSNIESRDEKDVLXLYRHTKRU'},
                           :body => {"RecurrentPayment" => "1d0a7c56-e077-400a-aaaf-8f45d3f39fa4"})

    puts @request
  puts 'Oi'
  end

  def result_transactions
    #MerchantOrderId
    @urlstring_to_post = "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/2014111703"


    request = HTTParty.get(@urlstring_to_post,

                           :headers => { 'Content-Type' => 'application/json',
                                         'MerchantId' => '3b216cfc-f290-46d5-8480-16780990f21a',
                                         'MerchantKey' => 'WXFQVNAPIREVWZFKUCBSNIESRDEKDVLXLYRHTKRU'},
                            :body => {"MerchantOrderId" => "2014111703"})

    puts request
  end

end
