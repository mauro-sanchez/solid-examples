# Mala práctica
class Auto
  def cantidad_pasajeros
    5
  end
end

class AutoJuguete < Auto
  def cantidad_pasajeros
    raise 'Los autos de juguete no llevan pasajeros'
  end
end

# Buena práctica LSP

class Auto
  def cantidad_pasajeros
    5
  end
end

class Juguete
  def jugar
    # Lógica de juego
  end
end

class AutoJuguete < Juguete
  # No necesita el método cantidad de pasajeros
end
