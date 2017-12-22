# Money

Gema que permite calcular el conversion enre distintos tipos de moneda. 
La Gema permite, establecer una moneda por defecto y establecer el valor del cambio  con respecto a otras monedas. Par ello, es necesario agregar el archivo money.rb con las conversiones en la ruta  config/initializers/money.rb de la aplicación.




Ej.:



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'money'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install money

## Usage

TODO: 

Establecer los parámetros iniciales que va utlizar la gema, setearlos en config/initializers/money.rb de moneda por defecto y tipos de cambio

Money.configure do |config|
	config.default_currency = "EUR"
	config.conversions = {"USD" => 1.11, "BTC" => 0.0047, "BsF" => 144000}
end

ó abrir una consola y pegar el bloque.


fifty_eur = MoneyConversion.new(50, 'EUR')
fifty_eur.amount # => 50
fifty_eur.currency # => "EUR"
fifty_eur.inspect # => "50.00 EUR"

Para convertir a otra moneda

fifty_eur.convert_to('USD') # => 55.50 USD

## Operaciones aritméticas

twenty_dollars = MoneyConversion.new(20, 'USD')

fifty_eur + twenty_dollars # => 68.02 EUR
fifty_eur - twenty_dollars # => 31.98 EUR
fifty_eur / 2 # => 25 EUR
twenty_dollars * 3 # => 60 USD

### Comparación entre distintas monedas

twenty_dollars == MoneyConversion.new(20, 'USD') # => true
twenty_dollars == MoneyConversion.new(30, 'USD') # => false
fifty_eur_in_usd = fifty_eur.convert_to('USD')
fifty_eur_in_usd == fifty_eur # => true
twenty_dollars > MoneyConversion.new(5, 'USD') # => true
twenty_dollars < fifty_eur # => true





fifty_eur = Money

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/money.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

