=begin
  Coffee class that represents a coffee product in the 
  CoffeeApp System
=end

class Coffee

  attr_accessor :name, :price

  def initialize(name, price)
    @name   = name
    @price  = price
  end

  class << self 
    def find_price(coffees, drink, size)
      price = coffees.find{|x| x['drink_name'] == drink && x['prices'][size]}
      price['prices'][size]

    end
  end
end