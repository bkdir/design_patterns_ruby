require 'spec_helper'

require 'decorator.rb'

describe Product do
  let(:product) { Product.new("Tomato", :fruit, %w(red salad sour))  }
  let(:expected_result) {
    File.read( File.expand_path(
        "../fixtures/products.html", 
        File.dirname(__FILE__)
    )).gsub!(/\s+/, "")
  }

  it "can be printed as html row" do
    expect(ProductDecorator.new(product).as_html_row).to eq expected_result
  end

end
