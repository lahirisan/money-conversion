module Money
  class Configuration
    attr_accessor :default_currency, :conversions

    def initialize
      @default_currency = ''
      @conversions      = {}
    end
  end
end