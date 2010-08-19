require File.dirname(__FILE__) + '/account'

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
    account = Account.for(visit.owner)
    visit.operations.each do |operation|
      account.charge!(operation, price_of(operation))
    end
  end
  
  def receive_payment_from(owner, payment_type)
    Account.for(owner).produce_receipt(payment_type)
  end
  
private

  def price_of(operation)
    @prices[operation]
  end
end