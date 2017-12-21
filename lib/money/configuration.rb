module Money
  class Configuration
    attr_accessor :default_currency, :conversions

    def initialize
      @default_currency = nil
      @conversions      = nil
    end
  end
end