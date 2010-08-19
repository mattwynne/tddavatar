require 'spec_helper'

describe Account do
  context "when a couple of operations have been performed" do
    let(:owner) { "Dave" }
    subject { Account.new(owner) }
    
    before(:each) do
      subject.charge! "foo", 15
      subject.charge! "bar", 20
    end
    
    let(:receipt) { subject.produce_receipt("cash") }
    
    it "shows those operations in the output" do
      receipt.should =~ /foo/
      receipt.should =~ /bar/
      receipt.should =~ /15/
      receipt.should =~ /20/
    end
    
  end
end
