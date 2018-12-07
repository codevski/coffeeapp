=begin
  User class that represents a user in the 
  CoffeeApp System
=end

class User

  attr_accessor :name, :orders, :payments, :add_order
  attr_accessor :name, :order_total, :payment_total, :balance

  def initialize(name)
    @name = name
    @orders = []
    @payments = []
    @balance = 0.00
    @order_total = 0.00
    @payment_total = 0.00
  end

  def add_order(order)
    # Update Order Total
    @order_total += order.price

    # Append order object to the orders array
    @orders << order

    # Recalculate outstanding balance
    calc_outstanding_balance
  end

  def add_payment(payment)
    # Update Payment Total
    @payment_total += payment.amount

    # Append payment object to the payments array
    @payments << payment

    # Recalculate outstanding balance
    calc_outstanding_balance
  end

  def calc_outstanding_balance
    # after each order added calculate total outstanding balance
    @balance = @order_total - @payment_total
    @balance = 0 if @balance < 0

    # round all balances to two decimal positions
    @order_total = @order_total.round(2)
    @payment_total = @payment_total.round(2)
    @balance = @balance.round(2)
  end

  class << self
    def find_by_name users, name
      users.find{|x| x.name == name }
    end
  end

end