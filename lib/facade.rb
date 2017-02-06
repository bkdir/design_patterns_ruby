class ProductController2
  attr_reader :product
  def show id
    @product = ProductFinder.find id
  end
end

class Product3
  def initialize name, type
    @name = name
    @type = type
  end
end


class ProductFinder
  def self.find id
    PRODUCT
  end
end
