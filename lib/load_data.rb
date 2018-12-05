require 'products'
require 'user'
module Load_Data

  def load_orders(menu, orders)
    @current = Array.new
    @unique_users = Hash.new(0)
    data = JSON.parse(orders)
    puts menu
    # puts orders
    data.each do | order |
      # puts order["user"]
      @unique_users[order["user"]] += menu.find(order["drink"], order["size"]).price[order["size"]]
      @current << menu.find(order["drink"], order["size"]).price[order["size"]]
    end

    puts @current
    puts @unique_users

    @unique_users.each do |user, value|
      @testing = User.new(user, value)
    end

    puts @testing.balance = 1
  end
    

end