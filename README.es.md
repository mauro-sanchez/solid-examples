# Principios SOLID
[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/mauro-sanchez/solid-examples/blob/master/README.md)
[![es](https://img.shields.io/badge/lang-es-yellow.svg)](https://github.com/mauro-sanchez/solid-examples/blob/master/README.es.md)

Ejemplos de uso de los principios SOLID en Ruby

## ¿Qué son los principios SOLID?

Los principios SOLID son un conjunto de cinco directrices enfocadas en ayudar a los devs a escribir código más flexible, mantenible y escalable. Fueron ideados por [Robert C. Martin](https://blog.cleancoder.com/) y son usados principalmente en programación orientada a objetos (POO).

SOLID es un acrónimo correspondiente a:

- **S**: Single Responsability Principle (SRP)
- **O**: Open/Closed Principle (OCP)
- **L**: Liskov Substitution Principle (LSP)
- **I**: Interface Segregation Principle (ISP)
- **D**: Dependency Inversion Principle (DIP)


### 1. SRP

Este principio indica que una clase debe tener una única razón para cambiar, es decir, debe tener una única responsabilidad o propósito. La idea de esto, es facilitar que el código sea implementado, y previene efectos secundarios inesperados en los cambios futuros. Es mucho más fácil mantener el código de una clase, componente o microservicio que sólo tenga una responsabilidad.

<a href="https://github.com/mauro-sanchez/solid-examples/blob/master/es/S.rb" target="_blank">Ejemplo</a>

```rb
# es/S.rb

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

```

### 2. OCP

Establece que las clases deben estar abiertas para extensión, pero cerradas para modificación. Es decir, las clases pueden ser extendidas sin tener que modificar su código. Esto previene situaciones en las que un cambio en una de tus clases hace que tengas que adaptar todas las clases dependientes. En el fondo, la idea es que si necesitas implementar algo nuevo, es posible crear una subclase que añada las nuevas funcionalidades, sin modificar la clase original.

<a href="https://github.com/mauro-sanchez/solid-examples/blob/master/es/O.rb" target="_blank">Ejemplo</a>

```rb
# es/O.rb

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

```

### 3. LSP

Este principio corresponde a que una subclase debería ser sustituible por su clase base sin alterar el comportamiento esperado. Por ejemplo, si heredas de una clase, la clase hijo o subclase deben poder usarse en lugar de la clase base sin causar errores. Es decir, si yo estoy usando una clase para una funcionalidad, yo debería ser capaz de utilizar cualquier subclase que herede de la clase sin romper la aplicación.

<a href="https://github.com/mauro-sanchez/solid-examples/blob/master/es/L.rb" target="_blank">Ejemplo</a>

```rb
# es/L.rb

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

```

### 4. ISP

Las clases no deberían depender de interfaces que no usan. Este principio puede complicarse en Ruby, debido a que no existen las interfaces explícitas. Pero es posible llevarlo a cabo evitando crear clases con métodos que otras clases no necesiten. Es decir, si necesitamos implementar una nueva funcionalidad a una clase, que una de sus subclases no puede utilizar, entonces lo mejor sería crear una subclase intermedia, que implemente los cambios necesarios.

### 5. DIP

Este principio establece que los módulos o clases de alto nivel no deberían depender de módulos de bajo nivel, ya que ambos deberían depender de abstracciones. Además, estas abstracciones no deberían depender de detalles; los detalles deberían depender de las abstracciones. 