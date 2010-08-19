Given /^the following operations are available:$/ do |table|
  table.hashes.each do |row|
    register_operation_price(row["operation"], row["price"])
  end
end

Given /^there is an owner (.*), let's call him "([^"]*)"$/ do |name, nickname|
  remember_owner(name, nickname)
end

Given /^(.*) brings his pet named (.*) into the clinic for the following operations:$/ do |owner_nickname, pet_name, operations|
  create_visit(owner_nickname, pet_name, operations.raw.flatten)
end

When /^the veterinarian charges him for the visit$/ do
  charge_for_visit
end

When /^(.*) pays (.*)$/ do |nickname, payment_type|
  pay_with(payment_type, nickname)
end

Then /^Dave is given a receipt which looks like this:$/ do |string|
  receipt.should == string
end
