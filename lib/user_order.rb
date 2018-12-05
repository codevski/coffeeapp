class User_Order

  attr_accessor :name, :orders

  def initialize(name, orders)
    @name = name
    @orders = orders
    # order_total
    # oayment_total
    # balance
  end

  def get_total_price
    # Get total price of the current user
    # puts "Total spending on User!"
    amount = 0

    @orders.select {|x| amount += x["price"]}

    return amount
  end
end