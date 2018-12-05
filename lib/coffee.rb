class Coffee

  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def sizes_available
    # loop @prices to list size available for
    # this coffee
  end
end