# require 'coffee'

# Products Object that holds all the prices of Coffee's

# Note: This class should be able to hold other objects
# that are not coffee

class Menu

  def initialize(data)
    # @data = JSON.parse(data)
    @data = data
    @current = Array.new
    @data.each do |item|
      @current << Coffee.new(item["drink_name"], item["prices"])
    end
  end

  class << self
    def find_menu(name)
      
    end
  end
  # Print all items in the CoffeeApp System
  def print_items
    coffees = @current.map(&:name)
  end

  # Return a coffee object that the system is looking for
  def find(drink, size)
    return @current.find{|x| x.name == drink && x.price[size]}
  end

  # Add a product to the menu
  def add(drink_name, drink_prices)
    # Feature to be added
  end
end