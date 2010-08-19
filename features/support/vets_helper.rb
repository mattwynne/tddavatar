module VetsHelper
  def register_operation_price(operation, price)
    practice.prices[operation] = price
  end
  
  def remember_owner(name, nickname)
    owners[nickname] = practice.create_owner(name)
  end
  
  def create_visit(owner_nickname, pet_name, operations)
    owner = owners[owner_nickname]
    @visit = practice.create_visit(owner, pet_name, operations)
  end
  
  def charge_for_visit
    practice.charge_for_visit(@visit)
  end
  
  def pay_with(payment_type, nickname)
    owner = owners[nickname]
    @receipt = practice.receive_payment_from(owner, payment_type)
  end
  
  def receipt
    @receipt.to_s
  end
  
  private
  
  def practice
    @practice ||= Practice.new
  end
  
  def owners
    @owners ||= {}
  end
end

World(VetsHelper)