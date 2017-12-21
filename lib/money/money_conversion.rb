class MoneyConversion
  attr_accessor :default_currency, :conversions, :amount, :currency
  
  def initialize(amount = nil, currency = nil)
      @default_currency = Money.configuration.default_currency || currency
      @conversions      = Money.configuration.conversions || {"USD" => 1.11, "BTC" => 0.0047, "BsF" => 144000}
      @amount           = amount
      @currency         = currency
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

end
