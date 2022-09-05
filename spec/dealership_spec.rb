require 'rspec'
require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do 
  before (:each) do
    @car_1 = Car.new("Ford Mustang", 1500, 36)
    @car_2 = Car.new("Toyota Prius", 1000, 48)
    @car_3 = Car.new("Toyota Tercel", 500, 48)
    @car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    @dealership = Dealership.new("Acme Auto", "123 Main Street")
  end

  describe '#initialize' do 
    it 'is an instance of dealership' do 
      expect(@dealership).to be_instance_of Dealership
    end

    it 'has a name' do 
      expect(@dealership.name).to eq("Acme Auto")
    end

    it 'has an address' do 
      expect(@dealership.address).to eq("123 Main Street")
    end

    it 'has no inventory by default' do 
      expect(@dealership.inventory).to eq([])
    end

    it 'has 0 cars by default' do 
      expect(@dealership.inventory_count).to eq(0)
    end
  end

  describe '#add_car' do 
    it "adds a car to the inventory" do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      
      expect(@dealership.inventory).to eq([@car_1, @car_2])
      expect(@dealership.inventory_count).to eq(2)
    end
  end

  describe '#has_inventory?' do 
    it 'is false when there is no inventory' do 
      expect(@dealership.inventory).to eq([])
      expect(@dealership.has_inventory?).to eq(false)
    end

    it 'is true when there is inventory' do
      expect(@dealership.has_inventory?).to eq(false)
      @dealership.add_car(@car_1)
      expect(@dealership.has_inventory?).to eq(true)
      @dealership.add_car(@car_2)
      expect(@dealership.has_inventory?).to eq(true)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      expect(@dealership.has_inventory?).to eq(true)
    end
  end

  describe '#cars_by_make' do
    it 'shows cars in the inventory by the make' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      car_makes_available = @dealership.cars_by_make("Toyota")
      expect(car_makes_available).to eq([@car_2, @car_3])
    end
  end

  describe '#total_value' do 
    it 'shows the total value' do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      expect(@dealership.total_value).to eq(156000)
    end
  end

  describe '#details' do
    it 'shows the total value and address of the dealership' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      dealership_details = {
        "total_value" => 156000, 
        "address" => "123 Main Street"
      }

      expect(@dealership.details).to eq(dealership_details)
    end
  end

  describe '#average_price_of_car' do 
    it 'shows the average price of cars at the dealership' do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      expect(@dealership.average_price_of_car).to eq("39,000")
    end
  end

  describe '#cars_sorted_by_price' do
    it 'outputs an array of cars sorted from lowest to highest price' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      expect(@dealership.cars_sorted_by_price).to eq([@car_3, @car_4, @car_2, @car_1])
    end
  end

  describe '#inventory_hash' do
    it 'returns a hash with cars sorted by make' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
    inv_hash = {
      "Ford" => [@car_1], 
      "Toyota" => [@car_2, @car_3],
      "Chevrolet" => [@car_4]
    }

    expect(@dealership.inventory_hash).to eq(inv_hash)
    end
  end
end