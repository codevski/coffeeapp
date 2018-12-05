require 'user_order'

class User

  attr_accessor :name, :order_total, :payment_total, :balance

  def initialize(name, order_total, payment_total, balance)
    @name = name
    @order_total = order_total
    @payment_total = payment_total
    @balance = balance
  end

  def print_user
    puts @name
  end

end