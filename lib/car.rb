class Car 
  attr_reader :car, :monthly_payment, :loan_length, :color

  def initialize(car, monthly_payment, loan_length)
    @car = car
    @monthly_payment = monthly_payment
    @loan_length = loan_length
    @color = nil
  end

  def make 
    @car.split[0]
  end

  def model 
    @car.split[1]
  end
  
  def total_cost
    @loan_length * @monthly_payment
  end

  def paint!(paint_color)
    @color = paint_color
  end

end