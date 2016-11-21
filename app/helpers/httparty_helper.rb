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
                                  "Id" => 'b50644f0-4725-4db8-a0ff-1ebb56afc678',
                                  "Type" => "CreditCard",
                                  "Amount" => "#{amount}",
                                  "Installments" => 1,
                                  "CreditCard" => {
                                      "CardNumber" => "#{cardNumber}",
                                      "Holder" => "#{holder}",
                                      "ExpirationDate" => "#{monthCard}/#{yearCard}",
                                      "SecurityCode" => "#{securityCode}",
                                      "Brand" => "#{brand}",
                                  }
                              }
                          }.to_json)

  puts @result
  end



  @urlstring_to_post = "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/09d67fd2-70b6-469a-b3bc-3ca3f678e20f"

  request = HTTParty.get(@urlstring_to_post,

                          :headers => { 'Content-Type' => 'application/json',
                                        'MerchantId' => '3b216cfc-f290-46d5-8480-16780990f21a',
                                        'MerchantKey' => 'WXFQVNAPIREVWZFKUCBSNIESRDEKDVLXLYRHTKRU'})

  puts request
end
