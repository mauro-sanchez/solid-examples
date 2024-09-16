# Mala práctica
class Camara
  def sacar_fotografia
    raise NotImplementedError
  end

  def grabar_video
    raise NotImplementedError
  end
end

# Acá esta cámara no necesita el método grabar_video, pero está obligada a implementalo

class CamaraFotografica < Camara
  def sacar_fotografia
    'Capturando imagen...'
  end
end

# Buena práctica ISP

class Camara
  def sacar_fotografia
    raise NotImplementedError
  end
end

class Videocamara
  def grabar_video
    raise NotImplementedError
  end
end

class CamaraFotografica < Camara
  def sacar_fotografia
    'Capturando imagen...'
  end
end
