require 'user'
module Helper
  
=begin
  Helper file allows functions that do calculations, processing or modifying
  particular Array's / Hash
=end

  # add_price accepts products to access prices and appends the price of orders
  # from a particular user. It then returns the orders with the price
  def add_price(products, user_orders)
    user_orders.each do |k|
      coffee = products.find(k["drink"], k["size"])
      k["price"] = coffee.price[k["size"]]
    end
  end

  def process_users(orders, payments, users)
    # puts payments
    @user_balance ||= []
    users.each do |user|
      balance = 0
      order = orders.find(user)
      payment = payments.find(user)
      if !payment.nil?
        balance = order.get_total_price.round(2) - payment.get_total_payment.round(2)
        @user_balance << User.new(user, order.get_total_price.round(2), payment.get_total_payment.round(2), balance.round(2))
      else
        balance = order.get_total_price
        @user_balance << User.new(user, order.get_total_price.round(2), 0.0, balance.round(2))
      end
    end
    return @user_balance
  end

  def all_users(orders)
    users = []
    orders = JSON.parse(orders)
    @temp = orders.uniq {|k| k["user"] }

    @temp.map do |v|
      users = v["user"]
    end
  end

  def to_json(data)
    user_balance ||= []
    data.each do |v|
      user_balance << {"user": v.name, "order_total": v.order_total, "payment_total": v.payment_total, "balance": v.balance}
      # puts v.name
    end
    return user_balance.to_json
  end
  
end