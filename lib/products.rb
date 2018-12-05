require 'coffee'

class Products

  def initialize(data)
    # data.each do |order|
    #   puts order['drink_name']
    # end
    @data = JSON.parse(data)
    @current = Array.new
    @data.each do |item|
      @current << Coffee.new(item["drink_name"], item["prices"])
    end
  end

  def print_items
    coffees = @current.map(&:name)
  end

  def find(drink, size)
    return @current.find{|x| x.name == drink && x.price[size]}
    # puts coffee[0].price
  end
end