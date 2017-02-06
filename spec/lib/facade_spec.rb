require 'facade'

describe ProductController2 do
  it "finds a product" do
    PRODUCT = Product3.new "Tomato", :fruit
    controller = ProductController2.new
    controller.show(1)

    expect(controller.product).to eq PRODUCT
  end
end
