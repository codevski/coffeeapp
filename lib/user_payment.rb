class User_Payment

  attr_accessor :name, :payments

  def initialize(name, payments)
    @name = name
    @payments = payments
  end

  def get_total_payment
    # puts "My Total Payments"
    amount = 0
    @payments.select {|x| amount += x["amount"]}
    # puts @payments

    return amount
  end
end