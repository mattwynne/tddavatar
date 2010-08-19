require 'spec_helper'

describe Practice do
  describe "#charge_for_visit" do
    let(:account) { mock(Account) }
    let(:owner)   { "Dave" }
    let(:visit)   { Visit.new(owner, "Fluffy", ["injections", "check-up"]) }

    before(:each) do
      Account.stub(:for).with(owner).and_return(account)
    end
    
    it "should charge the owner's account with the cost of each service" do
      subject.prices["injections"] = 10
      subject.prices["check-up"] = 20
      
      account.should_receive(:charge!).with("injections", 10)
      account.should_receive(:charge!).with("check-up", 20)
      subject.charge_for_visit(visit)
    end
  end
end
