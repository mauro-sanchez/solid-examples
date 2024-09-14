# Bad practive
class Arthropod
  def initialize(type)
    @type = type
  end

  def legs_quantity
    if @tipo == 'arachnid'
      8
    elsif @tipo == 'insect'
      6
    end
  end
end

# OCP practice

class Arthropod
  def legs_quantity
    raise NotImplementedError, 'This method must be implemented in a subclass'
  end
end

class Arachnid < Arthropod
  def legs_quantity
    8
  end
end

class Insect < Arthropod
  def legs_quantity
    6
  end
end
