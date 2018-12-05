# Put your code here!
require 'orders'
require 'user'
require 'products'
require 'payments'
require 'helper'

include Helper

class CoffeeApp

  def initialize
    
  end

  def self.call(prices, orders, payments)
    # Load the list of prices as an object of coffee's
    products = Products.new(prices)

    # Load the orders & Calculate the total cost of each user's orders
    user_orders = Orders.new(products, orders)

    # Load the payments
    # Calculate the total payment for each user
    # Calculate what each user now owes
    user_payments = Payments.new(payments)

    # Construct JSON structure
    all_users = all_users(orders)
    user_balance = to_json(process_users(user_orders, user_payments, all_users))

    # Return a JSON string containing the results of this work.
    return user_balance
    end
end