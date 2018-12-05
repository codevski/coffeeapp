# Put your code here!
require 'orders'
require 'user'
require 'products'
require 'load_data'
require 'payments'
require 'helper'

include Helper

class CoffeeApp

  def initialize
    
  end

  def self.call(prices, orders, payments)
    # data = JSON.parse(prices)
    # puts prices

    # Load the list of prices
    products = Products.new(prices)

    # puts products.print_items

    # coffee = products.find("latte", "large")
    # puts coffee[0].name
    # puts coffee.name
    # puts coffee.price['small']

    # Load the orders
    user_orders = Orders.new(products, orders)

    # - Calculate the total cost of each user's orders
    # puts coach = user_orders.find("coach")
    # puts coach.get_total_price

    # Load the payments
    user_payments = Payments.new(payments)

    # bill = user_payments.find("bill")
    # puts bill.get_total_payment
      # - Calculate the total payment for each user
      # - Calculate what each user now owes
    all_users = all_users(orders)

    # puts all_users
    testing = process_users(user_orders, user_payments, all_users)

    # construct JSON
    user_balance ||= []
    testing.each do |v|
      user_balance << {"user": v.name, "order_total": v.order_total, "payment_total": v.payment_total, "balance": v.balance}
      # puts v.name
    end

    return user_balance.to_json

    
    # Return a JSON string containing the results of this work.
    end
end