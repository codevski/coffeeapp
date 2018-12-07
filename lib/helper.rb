require 'user'
module Helper
  
=begin
  Helper file allows functions that do calculations, processing or modifying
  particular Array's / Hash
=end

  def find_all_uniq_users(orders)
    users = []
    orders = JSON.parse(orders)
    @temp = orders.uniq {|k| k["user"] }

    @temp.map do |v|
      users = v["user"]
    end
  end

  def convert_to_string(users)
    user_balance ||= []
    users.each do |user|
      user_balance << {"user": user.name, "order_total": user.order_total, "payment_total": user.payment_total, "balance": user.balance}
      # puts v.name
    end
    user_balance.to_json
  end
  
end