# Incomplete
require 'singleton_pattern'

describe ProductController do
  let(:product) { Product2.new "Tomato", :fruit }

  it "cannot be accessed more than once" do
    expect{ ProductController.new }.to raise_error NoMethodError
  end

  it "retrieves a product" do
  end
end
