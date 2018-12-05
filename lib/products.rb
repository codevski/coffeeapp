require 'coffee'

# Products Object that holds all the prices of Coffee's

# Note: This class should be able to hold other objects
# that are not coffee

class Products

  def initialize(data)
    @data = JSON.parse(data)
    @current = Array.new
    @data.each do |item|
      @current << Coffee.new(item["drink_name"], item["prices"])
    end
  end

  def print_items
    coffees = @current.map(&:name)
  end

  # Return a coffee object that the system is looking for
  def find(drink, size)
    return @current.find{|x| x.name == drink && x.price[size]}
  end
end