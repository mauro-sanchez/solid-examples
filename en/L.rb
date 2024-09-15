# Bad practice
class Car
  def passenger_capacity
    5
  end
end

class ToyCar < Car
  def passenger_capacity
    raise "Toy cars can't have passengers"
  end
end

# Good LSP practice

class Car
  def passenger_capacity
    5
  end
end

class Toy
  def play
    # Play logic here
  end
end

class ToyCar < Toy
  # Doesn't need passenger_capacity method
end
