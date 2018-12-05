require 'user_order'
require 'helper'

=begin
  Collection of oders in the CoffeeApp System
=end
  
class Orders

  include Helper

  # attr_accessor :drink, :size

  def initialize(products, orders)
    @products = products
    @orders = JSON.parse(orders)
    @users ||= []
    @temp = @orders.uniq {|k| k["user"] }


    # retrieve orders from particular user
    @temp.each do |k, v|
      user_orders ||= []
      current_user = k["user"]
      user_orders = @orders.select {|k| k["user"] == current_user && k.delete("user")}
  
      # Add price to each item
      user_orders = add_price(@products, user_orders)

      @users << User_Order.new(current_user, user_orders)
    end
  end

  def find(user)
    return @users.find{|x| x.name == user}
  end
end