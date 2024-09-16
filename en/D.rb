# Bad practice
class ElectricMotor
  def start
    'Electric motor started'
  end
end

class Car
  def initialize
    @motor = ElectricMotor.new
  end

  def start
    @motor.start
  end
end

# Here, Car directly depends on ElectricMotor. If we wanted to change the type of motor, we would have to modify the Car class.

# Good practice DIP

class Motor
  def start
    raise NotImplementedError
  end
end

class ElectricMotor < Motor
  def start
    'Electric motor started'
  end
end

class Car
  def initialize(motor)
    @motor = motor
  end

  def start
    @motor.start
  end
end

# Using the class
# Now, the Car depends on an abstraction (Motor), and you can easily switch to another type of motor without modifying the Car class.
electric_motor = ElectricMotor.new
car = Car.new(electric_motor)
car.start # "Electric motor started"
