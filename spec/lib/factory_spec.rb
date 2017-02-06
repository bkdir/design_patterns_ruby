require "spec_helper"

require "factory.rb"

describe PaymentServiceFactory do
  let(:user) { User.new "John Doe" }
  let(:manager) { Manager.new "The Boss" }

  it "allows manager to perform payments" do
    service = PaymentServiceFactory.for manager
    service.pay user, 500
  end

  it "forbids a regular user to perform payments" do
    service = PaymentServiceFactory.for user
    expect{ service.pay manager, 500 }.to raise_error(ForbiddenAccessError)
  end
end
