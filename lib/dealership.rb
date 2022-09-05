class Dealership
  attr_reader :name, :address, :inventory, :inventory_count

  def initialize(name, address)
    @name = name 
    @address = address
    @inventory = []
    @inventory_count = 0
  end

  def add_car(car)
    @inventory << car
    @inventory_count += 1
  end

  def has_inventory?
    if @inventory == []
      false
    else 
      true
    end
  end

  def cars_by_make(make)
    make_of_car = inventory.find_all do |car|
      car.make == make
    end
  end

  def total_value
    @inventory.sum do |car|
      car.total_cost
    end
  end

  def details
    dealership_details = {
      "total_value" => total_value, 
      "address" => @address
    }
  end

  def average_price_of_car
    average_price = (total_value / @inventory_count)
    reverse_arr = average_price.to_s.chars.reverse
    reverse_arr.each_slice(3).map(&:join).join(",").reverse
  end

  def cars_sorted_by_price
    @inventory.sort_by do |car|
      car.monthly_payment * car.loan_length
    end
  end
end