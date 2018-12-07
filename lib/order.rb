=begin
  Order class that represents a order in the 
  CoffeeApp System
=end
  
class Order

  attr_accessor :user, :product, :size, :price

  def initialize(user, product, size, price)
    @user    = user
    @product = product
    @size    = size
    @price   = price
  end
end