require 'spec_helper'
require_relative '../../lib/strategy.rb'
require_relative '../../lib/generators_strategy/html'
require_relative '../../lib/generators_strategy/markdown'

module Newsletter
  describe GeneratorStrategy do
    it "renders html header and content" do
      @generator = Newsletter::GeneratorStrategy.new(:html)
      test = "<h1>title</h1>"
      test += "<div class='content'><p>content</p></div>"
      expect(@generator.render).to eq test
    end
    
    it "renders markdown header and content" do
      test = "# title.content"
      @generator = Newsletter::GeneratorStrategy.new(:markdown)
      expect(@generator.render).to eq test
    end
  end
end



