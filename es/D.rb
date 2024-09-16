# Mala práctica
class MotorElectrico
  def encender
    'Motor eléctrico encendido'
  end
end

# Aquí, el vehículo depende directamente del MotorElectrico. Si quisiéramos cambiar el tipo de motor, tendríamos que modificar la clase Vehiculo

class Automovil
  def initialize
    @motor = MotorElectrico.new
  end

  def arrancar
    @motor.encender
  end
end

# Buena práctica DIP

class Motor
  def encender
    raise NotImplementedError
  end
end

class MotorElectrico < Motor
  def encender
    'Motor eléctrico encendido'
  end
end

class Automovil
  def initialize(motor)
    @motor = motor
  end

  def arrancar
    @motor.encender
  end
end

# Usando la clase
# Ahora, el Automovil depende de una abstracción (Motor), y puedes cambiar fácilmente a otro tipo de motor sin modificar la clase Automovil.
motor_electrico = MotorElectrico.new
coche = Automovil.new(motor_electrico)
coche.arrancar # "Motor eléctrico encendido"
