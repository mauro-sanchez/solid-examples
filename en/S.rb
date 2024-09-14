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
