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
end