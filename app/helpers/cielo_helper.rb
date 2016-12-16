require 'rubygems'
require 'httparty'

module CieloHelper
  include HTTParty


#include CieloHelper -- Adding in controller
  def Pagando(name,cardNumber,monthCard, yearCard,securityCode,holder,brand,time)

    ## PAGAMENTOS MENSAIS
    if(time == 'Mensal')

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
                                          "Amount" => 15000,
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

    ans = JSON.parse(@result.body)
    @amount = 15000
    @endDate = ans['Payment']['RecurrentPayment']['NextRecurrency']
    @paymentId = ans['Payment']['PaymentId']
    #<%= f.select_tag :timeAccount, options_for_select([['Mensal', 1, {:amount => 60}], ['Anual'], 1, {:amount => 240}]) %>
    @recurrentPayment = ans['Payment']['RecurrentPayment']['RecurrentPaymentId']
    @message = ans['Payment']['ReturnMessage']


    puts @result

      ##PAGAMENTO ANUAL
    else
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
                                            "Amount" => 24000,
                                            ##PARCELAS
                                            "Installments" => 5,
                                            "SoftDescriptor" => "PrestMinuto",
                                            "RecurrentPayment" => {
                                                "AuthorizeNow" => "true",
                                                "Interval" => "Annual"
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

      ans = JSON.parse(@result.body)
      @amount = 24000
      @paymentId = ans['Payment']['PaymentId']
      @endDate = ans['Payment']['RecurrentPayment']['NextRecurrency']
      @recurrentPayment = ans['Payment']['RecurrentPayment']['RecurrentPaymentId']
      @message = ans['Payment']['ReturnMessage']


    end
end




 def recurrent(recurrentId)
    @urlstring_to_get = "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/#{recurrentId}"


    @request = HTTParty.get(@urlstring_to_get.to_str,

                           :headers => { 'Content-Type' => 'application/json',
                                         'MerchantId' => '3b216cfc-f290-46d5-8480-16780990f21a',
                                         'MerchantKey' => 'WXFQVNAPIREVWZFKUCBSNIESRDEKDVLXLYRHTKRU'},
                           :body => {"RecurrentPayment" => "#{recurrentId}"}.to_json)

    ans = JSON.parse(@request.body)
    @endDate = ans['Payment']['RecurrentPayment']['EndDate']

  end

  def result_transactions(paymentId)
    #MerchantOrderId
    @urlstring_to_post = "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/#{paymentId}"


    request = HTTParty.get(@urlstring_to_post,

                           :headers => { 'Content-Type' => 'application/json',
                                         'MerchantId' => '3b216cfc-f290-46d5-8480-16780990f21a',
                                         'MerchantKey' => 'WXFQVNAPIREVWZFKUCBSNIESRDEKDVLXLYRHTKRU'},
                            :body => {"MerchantOrderId" => "2014111703"})

    ans = JSON.parse(request.body)
    @name = ans['Customer']['Name']
    puts request
  end

end
