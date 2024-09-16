# SOLID Principles
[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/mauro-sanchez/solid-examples/blob/master/README.md)
[![es](https://img.shields.io/badge/lang-es-yellow.svg)](https://github.com/mauro-sanchez/solid-examples/blob/master/README.es.md)

Usage examples of SOLID principles in Ruby

## What are SOLID principles?

SOLID principles are a set of five guidelines aimed at helping developers write more flexible, maintainable, and scalable code. They were created by [Robert C. Martin](https://blog.cleancoder.com/) and are mainly used in object-oriented programming (OOP).

SOLID is an acronym corresponding to:

- **S**: Single Responsibility Principle (SRP)
- **O**: Open/Closed Principle (OCP)
- **L**: Liskov Substitution Principle (LSP)
- **I**: Interface Segregation Principle (ISP)
- **D**: Dependency Inversion Principle (DIP)

### 1. SRP

This principle states that a class should have only one reason to change, meaning it should have a single responsibility or purpose. The idea behind this is to make the code easier to implement and prevent unexpected side effects in future changes. It's much easier to maintain the code of a class, component, or microservice that has only one responsibility.

<a href="https://github.com/mauro-sanchez/solid-examples/blob/master/en/S.rb" target="_blank">Example</a>

```rb
# en/S.rb

# Bad practice
class User
  def initialize(name, last_name, email)
    @name = name
    @last_name = last_name
    @email = email
  end

  def full_name
    "#{@name} #{@last_name}"
  end

  def send_welcome_email
    # Logic to send a welcome email
  end
end

# SRP practices

class User
  def initialize(name, last_name, email)
    @name = name
    @last_name = last_name
    @email = email
  end

  def full_name
    "#{@name} #{@last_name}"
  end
end

class EmailService
  def send_welcome_email(user)
    # Logic to send a welcome email
  end
end

```

### 2. OCP

It states that classes should be open for extension but closed for modification. In other words, classes can be extended without modifying their code. This prevents situations where a change in one class requires adapting all dependent classes. The core idea is that if you need to implement something new, it's possible to create a subclass that adds new functionalities without modifying the original class.

<a href="https://github.com/mauro-sanchez/solid-examples/blob/master/en/O.rb" target="_blank">Example</a>

```rb
# en/O.rb

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

```

### 3. LSP

This principle states that a subclass should be substitutable for its base class without altering the expected behavior. For example, if you inherit from a class, the child class or subclass should be usable in place of the base class without causing errors. In other words, if I'm using a class for a functionality, I should be able to use any subclass that inherits from it without breaking the application.

<a href="https://github.com/mauro-sanchez/solid-examples/blob/master/en/L.rb" target="_blank">Example</a>

```rb
# en/L.rb

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

```

### 4. ISP

Classes should not depend on interfaces they do not use. This principle can be tricky in Ruby because explicit interfaces do not exist in this language. However, it can still be applied by avoiding the creation of classes with methods that other classes do not need. For instance, if you need to implement a new functionality in a class that one of its subclasses cannot use, it would be best to create an intermediate subclass that implements the necessary changes.

<a href="https://github.com/mauro-sanchez/solid-examples/blob/master/en/I.rb" target="_blank">Example</a>

```rb
# en/I.rb

# Bad practice
class Camera
  def take_picture
    raise NotImplementedError
  end

  def record_video
    raise NotImplementedError
  end
end

# Here this camera doesn't need the record_video method, but it is required to implement it

class PhotographyCamera < Camera
  def take_picture
    'Taking picture...'
  end
end

# Good practice ISP

class Camera
  def take_picture
    raise NotImplementedError
  end
end

class VideoRecorder
  def record_video
    raise NotImplementedError
  end
end

class PhotographyCamera < Camera
  def take_picture
    'Taking picture...'
  end
end

```

### 5. DIP

This principle states that high-level modules or classes should not depend on low-level modules; both should depend on abstractions. Additionally, abstractions should not depend on details; details should depend on abstractions.
