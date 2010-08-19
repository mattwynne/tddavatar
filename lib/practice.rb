class Visit < Struct.new(:owner, :pet, :operations)
end

class Practice
  def prices
    @prices ||= {}
  end
  
  def create_owner(name)
    name
  end
  
  def create_visit(owner, pet, operations)
    Visit.new(owner, pet, operations)
  end
  
  def charge_for_visit(visit)
  end
  
  def receive_payment_from(owner, payment_type)
  end
end