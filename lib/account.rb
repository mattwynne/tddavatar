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
    <<-EOF
Operations:
#{format_entries}

Total to pay: $#{total}

Paid #{payment_type}, received with thanks
EOF
  end

private

  def total
    @entries.inject(0) { |total, entry| total + entry.price.to_i }
  end

  def format_entries
    @entries.map { |e| "  $#{e.price} (#{e.operation})"}.join("\n")
  end
end
