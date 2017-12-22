require "spec_helper"
require_relative "../lib/money"
require_relative "../lib/money/money_conversion"


describe MoneyConversion do
  
  before do
  	
  	Money.configure do |config|
		config.default_currency = "EUR"
		config.conversions = {"USD" => 1.11, "BTC" => 0.0047, "BsF" => 144000}
	end

  	@currency = MoneyConversion.new(50, "EUR")
  	@currency2 = MoneyConversion.new(20, "EUR")
  	

  end

  it "Tiene atributo default_currency" do
  	expect(@currency).to respond_to(:convert_to)
  end

  it "Tiene atributo conversions" do
  	expect(@currency).to respond_to(:conversions)
  end

  it "Tiene atributo amount" do
  	expect(@currency).to respond_to(:amount)
  end

  it "Tiene atributo currency" do
  	expect(@currency).to respond_to(:currency)
  end

  it "Gema money tiene version" do
    expect(Money::VERSION).not_to be nil
  end

  it "Método amount retorna el monto" do
    expect(@currency.amount).to eq 50
  end

  it "Método currency retorna el tipo de moneda" do
    expect(@currency.currency).to eq "EUR"
  end

  it "Tiene método convert_to" do
  	expect(@currency).to respond_to(:convert_to)
  end

  
  it "Método convert_to devuelve un objecto MoneyConversion" do
  	@currency1 =  @currency.convert_to("USD")
  	@currency1.should be_a_kind_of(MoneyConversion)
  end

  it "Método convert_to cambia al tipo de moneda que s'pasa como parámetro" do
  	@currency1 =  @currency.convert_to("USD")
  	expect(@currency1.currency).to eq "USD"
  end

  it "La suma de 2 monedas de igual tipo devuelve la suma de ambas " do
  	
  	@currency3 = MoneyConversion.new(50, "EUR")
  	@currency4 = MoneyConversion.new(20, "EUR")
  	
  	@currency3 + @currency4 

  end

  it "La suma de 2 monedas de igual tipo el mismo tipo y la suma de sus montos" do
  	
  	@currency3 = MoneyConversion.new(50, "EUR")
  	@currency4 = MoneyConversion.new(20, "EUR")

  	@currency5 = @currency3 + @currency4 
  	expect(@currency5.amount).to eq 70

  end

   it "La suma de 2 monedas de distinto tipo devuelve una moneda" do
  	
  	@currency1 = MoneyConversion.new(50, "USD")
  	@currency2 = @currency + @currency1 
  	@currency2.should be_a_kind_of(MoneyConversion)

  end

  it "La resta de 2 monedas de distinto tipo devuelve una moneda" do
  	
  	@currency1 = MoneyConversion.new(50, "USD")
  	@currency2 = @currency - @currency1 
  	@currency2.should be_a_kind_of(MoneyConversion)

  end

  it "La resta de 2 monedas de distinto tipo devuelve el tipo de moneda de operando iquierda" do
  	
  	@currency1 = MoneyConversion.new(50, "USD")
  	@currency2 = @currency - @currency1 
  	expect(@currency2.currency).to eq "EUR"

  end

  it "La clase MoneyConversion permite la operación de división" do
  	
  	@currency1 = MoneyConversion.new(50, "USD")
  	@currency2 = @currency1 / 2
	expect(@currency2.amount).to eq 25  	

  end

  it "La clase MoneyConversion permite la operación de multiplicación" do
  	
  	@currency1 = MoneyConversion.new(50, "USD")
  	@currency2 = @currency1 * 3
	expect(@currency2.amount).to eq 150  	

  end

  it "La clase MoneyConversion permite la operación de multiplicación" do
  	
  	@currency1 = MoneyConversion.new(50, "USD")
  	@currency2 = @currency1 * 3
	expect(@currency2.amount).to eq 150  	

  end

  it "La clase MoneyConversion permite determinar si el valor de 2 monedas de distinto tipo son equivalentes" do
  	
  	@currency1 = MoneyConversion.new(1, "EUR")
  	@currency2 = MoneyConversion.new(1.11, "USD")

  	result = (@currency1 == @currency2)

	expect(result).to eq true  	

  end


  it "La clase MoneyConversion permite determinar si el valor de una moneda es mayor a otra moneda independiente del tipo" do
  	
  	@currency1 = MoneyConversion.new(1, "EUR")
  	@currency2 = MoneyConversion.new(1, "USD")

  	result = (@currency1 > @currency2)

	expect(result).to eq true  	

  end


end
 