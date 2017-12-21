# encoding: utf-8
require "pry"
class MoneyConversion
  attr_accessor :default_currency, :conversions, :amount, :currency
  
  def initialize(amount = nil, currency = nil)
      @default_currency =  currency || Money.configuration.default_currency
      @conversions      =  {"USD" => 1.11, "BTC" => 0.0047, "BsF" => 144000} || Money.configuration.conversions 
      @amount           = amount
  end
  
  def amount
    @amount
  end

  def currency
    @default_currency
  end

  def inspect
    "#{@amount.to_f} #{@default_currency}"
  end

  def convert_to(to_currency)
     
      begin
        
        if @conversions[to_currency]
          
          result = self.amount * @conversions[to_currency].to_f
        else

          result = self.amount.to_f / @conversions[self.default_currency]
        end

      
        MoneyConversion.new(result, to_currency)
      rescue ZeroDivisionError => e
        puts "Excepción de division entre 0"
      end
  end
  
  def + (currency_object)
      
      MoneyConversion.new(self.amount + currency_object.convert_to(self.default_currency).amount, self.default_currency)
  end

  def - (currency_object)
    
    MoneyConversion.new(self.amount - currency_object.convert_to(self.default_currency).amount, self.default_currency)
  end

end
