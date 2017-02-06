require 'singleton'
class ProductController
  include Singleton
end

class Product2
  def initialize name, type
    @name = name
    @type = type
  end
end
