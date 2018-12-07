=begin
  Payment class that represents a payment in the 
  CoffeeApp System
=end
class Payment

  attr_accessor :user, :amount

  def initialize(user, amount)
    @user    = user
    @amount  = amount
  end
end