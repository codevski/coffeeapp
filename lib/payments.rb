require 'user_payment'

class Payments

  def initialize(payments)
    @payments = JSON.parse(payments)
    @users ||= []

    @temp = @payments.uniq {|k| k["user"] }

    @temp.each do |k, v|
      user_payments ||= []
      current_user = k["user"]
      user_payments = @payments.select {|k| k["user"] == current_user && k.delete("user")}

      # puts user_payments
  
      # Add price to each item
      @users << User_Payment.new(current_user, user_payments)
    end

  end

  def find(user)
    return @users.find{|x| x.name == user}
  end
end