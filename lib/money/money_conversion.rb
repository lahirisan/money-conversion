# encoding: utf-8

class MoneyConversion
  attr_accessor :default_currency, :conversions, :amount, :currency
  
  def initialize(amount = nil, currency = nil)
      @default_currency =  Money.configuration.default_currency
      @conversions      =  Money.configuration.conversions 
      @amount           =  amount
      @currency         =  currency
  end
  
  def amount
    @amount
  end

  def currency
    @currency
  end

  def inspect
    "#{@amount.to_f} #{@currency}"
  end

  def convert_to(to_currency)
      
    if self.amount == 0
      result = 0
    else
      
      if self.currency == self.default_currency                         # El cambio es directo por las conversiones
        result  = self.amount * @conversions[to_currency]                 
      elsif to_currency == self.default_currency                          # EL cambio es inverso
        result = self.amount.to_f  / @conversions[self.currency]
      else                                                                   #EL cambio es entre monedas de la conversion
        change_to_default = self.amount.to_f  / @conversions[self.currency]
        result            = change_to_default * @conversions[to_currency]
      end

    end
      
    MoneyConversion.new(result, to_currency)
      
  end

  def + (currency_object)
      
      if self.currency == currency_object.currency
        MoneyConversion.new(self.amount + currency_object.amount, self.currency)
      else     
        MoneyConversion.new(self.amount + currency_object.convert_to(self.currency).amount, self.currency)
      end

  end

  def - (currency_object)
    
    if self.currency == currency_object.currency
      MoneyConversion.new(self.amount - currency_object.amount, self.currency)  
    else
      MoneyConversion.new(self.amount - currency_object.convert_to(self.currency).amount, self.currency)
    end

  end

  def / (divisor)

    begin

      if divisor.class.name == self.class.name
        if  (divisor.currency == self.currency)
          div = self.amount.to_f / divisor.amount
          result = MoneyConversion.new(div, self.currency)
        else
          converted = divisor.convert_to(self.currency)
          result = MoneyConversion.new(self.amount.to_f / converted.amount, self.currency)
        end
      else
        amount = self.amount.to_f / divisor
        result = MoneyConversion.new(amount, self.currency)
      end
      result
    
    rescue ZeroDivisionError => b
      puts "Excepción de division entre 0"
    end

  end

  def * (factor)
    if factor.class.name == self.class.name
      if  (factor.currency == self.currency)
        div = self.amount.to_f * factor.amount
        result = MoneyConversion.new(div, self.currency)
      else
        converted = factor.convert_to(self.currency)
        result = MoneyConversion.new(self.amount.to_f * converted.amount, self.currency)
      end
    else
      amount = self.amount.to_f * factor
      result = MoneyConversion.new(amount, self.currency)
    end
  end


  def == (currency_object)

    if (currency_object.currency == self.currency)
      result = (currency_object.amount == self.amount)
    else
      converted = currency_object.convert_to(self.currency)
      result    = converted.amount == self.amount
    end
    result  
  end

  def > (currency_object)
    
    if (currency_object.currency == self.currency)
      result = ( self.amount  > currency_object.amount)
    else
      converted = currency_object.convert_to(self.currency)
      result    = self.amount > converted.amount
    end
    result
  end

  def < (currency_object)
    
    if (currency_object.currency == self.currency)
      result = ( self.amount  < currency_object.amount)
    else
      converted = currency_object.convert_to(self.currency)
      result    = self.amount < converted.amount
    end
    result
    
  end

end
