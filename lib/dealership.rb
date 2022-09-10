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
    @inventory.find_all do |car|
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
    # average_price = (total_value / @inventory_count)
    # reverse_arr = average_price.to_s.chars.reverse
    # reverse_arr.each_slice(3).map(&:join).join(",").reverse

    average_price = (total_value / @inventory_count)
    average_price.to_s.insert(2, ",")
  end

  def cars_sorted_by_price
    @inventory.sort_by do |car|
      # car.monthly_payment * car.loan_length
      car.total_cost
    end
  end

  def inventory_hash
    inventory = {
      "Ford" => [],
      "Toyota" => [],
      "Chevrolet" => []
    }

    @inventory.each do |car|
      if car.make == "Ford"
        inventory["Ford"] << car
      elsif car.make == "Toyota"
        inventory["Toyota"] << car
      elsif car.make == "Chevrolet"
        inventory["Chevrolet"] << car
      end
    end
  inventory
  end
end