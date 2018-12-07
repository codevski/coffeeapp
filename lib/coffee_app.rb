# Put your code here!
require 'order'
require 'user'
require 'payment'
require 'helper'
require'coffee'

include Helper

class CoffeeApp

  def self.call(prices, orders, payments)
    # Parse all files
    @prices   = JSON.parse(prices)
    @orders   = JSON.parse(orders)
    @payments = JSON.parse(payments)
    @users    = []

    # Construct User's to assign Orders and Payments
   find_all_uniq_users(orders).each { |user| @users << User.new(user)}

    # Load the list of prices as an Menu Object of coffee's    
    @coffees = @prices.each { |item| Coffee.new(item["drink_name"], item["sizes"]) }


    # Load the orders & Calculate the total cost of each user's orders
    @orders.each do |order_data|
      user    = order_data['user']
      product = order_data['drink']
      size    = order_data['size']

      # Create new order object
      order = Order.new(user, product, size, Coffee.find_price(@coffees, product, size))

      # find the right user here based on name from our user database
      User.find_by_name(@users, user).add_order(order)
    end

    # Load the payments & Calculate the total repayments of each user's orders
    @payments.each do |payment_data|
      user   = payment_data['user']
      amount = payment_data['amount']

      # Create new payment object
      payment = Payment.new(user, amount)

      # find the right user here based on name from our user database
      User.find_by_name(@users, user).add_payment(payment)
    end

    # Return a JSON string containing the results of this work.
    convert_to_string(@users)
    end
end