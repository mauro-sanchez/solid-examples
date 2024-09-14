# Mala práctica
class Artropodo
  def initialize(tipo)
    @tipo = tipo
  end

  def cantidad_patas
    if @tipo == 'arácnido'
      8
    elsif @tipo == 'insecto'
      6
    end
  end
end

# Buena práctica OCP

class Artropodo
  def cantidad_patas
    raise NotImplementedError, 'Este método debe ser implementado por una subclase'
  end
end

class Aracnido < Artropodo
  def cantidad_patas
    8
  end
end

class Insecto < Artropodo
  def cantidad_patas
    6
  end
end
