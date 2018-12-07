require 'spec_helper'
require 'coffee_app'

RSpec.describe "user_class_integration" do
  let(:users_json) {
    <<-JSON
      [
        { "name": "user1" },
        { "name": "user1" }
      ]
    JSON
  }
  let(:prices_json) {
    <<-JSON
      [
        { "drink_name": "short espresso", "prices": { "small": 3.03 } },
        { "drink_name": "latte", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "flat white", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "long black", "prices": { "small": 3.25, "medium": 3.50 } },
        { "drink_name": "mocha", "prices": { "small": 4.00, "medium": 4.50, "large": 5.00 } },
        { "drink_name": "supermochacrapucaramelcream", "prices": { "large": 5.00, "huge": 5.50, "mega": 6.00, "ultra": 7.00 } }
      ]
    JSON
  }

  let(:orders_json) {
    <<-JSON
      [
        { "user": "coach", "drink": "long black", "size": "medium" },
        { "user": "ellis", "drink": "long black", "size": "small" },
        { "user": "rochelle", "drink": "flat white", "size": "large" },
        { "user": "coach", "drink": "flat white", "size": "large" },
        { "user": "zoey", "drink": "long black", "size": "medium" },
        { "user": "zoey", "drink": "short espresso", "size": "small" }
      ]
    JSON
  }
  
  describe CoffeeApp do
    subject(:result) do
      json_result = CoffeeApp.call(prices_json, orders_json, payments_json)
      JSON.load(json_result)
    end

    it "creates a user" do
      expect(User.new('user').name).to eq "user"
    end

    it "finds a user" do 
      all_users = []
      users = JSON.parse(users_json)
      users.each { |user| all_users << User.new(user['name'])}

      expect(User.find_by_name(all_users, 'user1').name).to eq 'user1'
    end

    it "finds a price" do
      @prices = JSON.parse(prices_json)
      @coffees = @prices.each { |item| Coffee.new(item["drink_name"], item["sizes"]) }

      expect(Coffee.find_price(@coffees, 'latte', 'small')).to eq 3.50
    end

    it "creates a order" do
      expect(Order.new('user', 'latte', 'small', 2.0).user).to eq 'user'
      expect(Order.new('user', 'latte', 'small', 2.0).product).to eq 'latte'
      expect(Order.new('user', 'latte', 'small', 2.0).size).to eq 'small'
      expect(Order.new('user', 'latte', 'small', 2.0).price).to eq 2.0
    end

    it "creates a payment" do
      expect(Payment.new('user', 20).user).to eq 'user'
      expect(Payment.new('user', 20).amount).to eq 20
    end

    it "returns unique users" do
      orders = JSON.parse(orders_json)
      
      expect(find_all_uniq_users(orders)).to eq ["coach", "ellis", "rochelle", "zoey"]
    end
  end
end