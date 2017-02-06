class PaymentServiceFactory
  def self.for entity
    if entity.is_a? User
      UserPaymentService.new
    elsif entity.is_a? Manager
      ManagerPaymentService.new
    end
  end
end

class User
  def initialize name
    @name = name
  end
end

class UserPaymentService
  def pay user, amount
    raise ForbiddenAccessError, "This user cannot perform payments"
  end
end

class ManagerPaymentService
  def pay user, amount
  end
end

class Manager
  def initialize name
    @name = name
  end
end

class ForbiddenAccessError < StandardError; end
