class Account
  def self.for(owner)
    @accounts ||= {}
    @accounts[owner] = new(owner)
  end
  
  def initialize(owner)
    @owner = owner
  end
  
  def charge!(operation, price)
    
  end
  
  def produce_receipt(payment_type)
    
  end
end
