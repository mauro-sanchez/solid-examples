# Mala práctica
class Usuario
  def initialize(nombre, apellido, email)
    @nombre = nombre
    @apellido = apellido
    @email = email
  end

  def nombre_completo
    "#{@nombre} #{@apellido}"
  end

  def enviar_correo_bienvenida
    # Lógica de enviar un correo de bienvenida
  end
end

# SRP practices

class Usuario
  def initialize(nombre, apellido, email)
    @nombre = nombre
    @apellido = apellido
    @email = email
  end

  def nombre_completo
    "#{@nombre} #{@apellido}"
  end
end

class EmailService
  def enviar_correo_bienvenida(user)
    # Lógica de enviar un correo de bienvenida
  end
end
