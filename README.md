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

### 2. OCP

It states that classes should be open for extension but closed for modification. In other words, classes can be extended without modifying their code. This prevents situations where a change in one class requires adapting all dependent classes. The core idea is that if you need to implement something new, it's possible to create a subclass that adds new functionalities without modifying the original class.

### 3. LSP

This principle states that a subclass should be substitutable for its base class without altering the expected behavior. For example, if you inherit from a class, the child class or subclass should be usable in place of the base class without causing errors. In other words, if I'm using a class for a functionality, I should be able to use any subclass that inherits from it without breaking the application.

### 4. ISP

Classes should not depend on interfaces they do not use. This principle can be tricky in Ruby because explicit interfaces do not exist in this language. However, it can still be applied by avoiding the creation of classes with methods that other classes do not need. For instance, if you need to implement a new functionality in a class that one of its subclasses cannot use, it would be best to create an intermediate subclass that implements the necessary changes.

### 5. DIP

This principle states that high-level modules or classes should not depend on low-level modules; both should depend on abstractions. Additionally, abstractions should not depend on details; details should depend on abstractions.
