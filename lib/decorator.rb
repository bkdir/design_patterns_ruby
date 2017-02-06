require 'forwardable'

class Product
  attr_reader :name, :category, :tags
  def initialize name, category, tags = []
    @name = name
    @category = category
    @tags = tags
  end
  
end

class ProductDecorator
  extend Forwardable
  def_delegators :@context, :name, :category, :tags

  def initialize context
    @context = context
  end

  def as_html_row
    "<tr><th>#{name}</th><td>#{category}</td><td>" + 
    tags_list  + 
    "</td></tr>"
  end

  def tags_list
    "<ul>" + 
      tags.map{ |tag| "<li>#{tag}</li>" }.join('') +
    "</ul>"
  end
end
