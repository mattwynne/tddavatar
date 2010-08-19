require 'spec_helper'

describe Practice do
  let(:owner)   { "Dave" }
  let(:account) { mock(Account) }
  before(:each) do
    Account.stub(:for).with(owner).and_return(account)
  end

  describe "#charge_for_visit" do
    let(:visit)   { Visit.new(owner, "Fluffy", ["injections", "check-up"]) }

    
    it "should charge the owner's account with the cost of each service" do
      subject.prices["injections"] = 10
      subject.prices["check-up"] = 20
      
      account.should_receive(:charge!).with("injections", 10)
      account.should_receive(:charge!).with("check-up", 20)
      subject.charge_for_visit(visit)
    end
  end
  
  describe "#receive_payment_from" do
    let(:receipt) { mock("Receipt") }
    
    it "asks the account to produce a receipt" do
      account.should_receive(:produce_receipt).with("cash").and_return(receipt)
      subject.receive_payment_from(owner, "cash").should == receipt
    end
  end
end