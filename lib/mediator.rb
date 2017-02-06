class Agency
  def initialize
    @house = []
  end

  def register house
    @house << house
  end

  def mediate_purchase house, buyer
    if conditions_are_met? house, buyer
      handle_money house, buyer
      house.owner = buyer
    end
  end
  
  def conditions_are_met? house, buyer
    @house.include?(house) &&
      buyer.budget >= house.price
  end

  def handle_money house, buyer
    house.owner.balance += house.price
    buyer.budget -= house.price
  end
end

class Buyer
  attr_accessor :budget

  def initialize budget: 0
    @budget = budget
  end

  def follow_agency agency
    @agency = agency
  end

  def buy house
    @agency.mediate_purchase house, self
  end
end

class Seller
  attr_accessor :balance

  def initialize balance: 0
    @balance = balance
  end
  
  def publish agency, house
    agency.register house
  end
end

class House
  attr_accessor :owner
  attr_reader :price

  def initialize rooms: 0, price: 0, owner: nil
    @rooms = rooms
    @price = price
    @owner = owner
  end
end
