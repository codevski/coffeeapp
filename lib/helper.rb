module Helper
  
=begin
  Helper file allows functions that do calculations, processing or modifying
  particular Array's / Hash
=end

  def find_all_uniq_users(orders)
    # puts orders
    users = []
    orders.each {|k| users << k['user'] }
    # puts users.uniq
    users.uniq
  end

  def convert_to_string(users)
    user_balance ||= []
    users.each {|user| user_balance << {'user': user.name, "order_total": user.order_total, "payment_total": user.payment_total, "balance": user.balance} }
    user_balance.to_json
  end
  
end