class Account
  class Entry < Struct.new(:operation, :price)
  end
  
  def self.for(owner)
    @accounts ||= {}
    @accounts[owner] = new(owner)
  end
  
  def initialize(owner)
    @owner = owner
    @entries = []
  end
  
  def charge!(operation, price)
    @entries << Entry.new(operation, price)
  end
  
  def produce_receipt(payment_type)
    @entries.map { |e| "  $#{e.price} (#{e.operation})"}.join("\n")
  end
end
