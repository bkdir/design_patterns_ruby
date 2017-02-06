require 'spec_helper'
require_relative '../../lib/template.rb'
require_relative '../../lib/generators_template/html'
require_relative '../../lib/generators_template/markdown'

module Newsletter
  describe GeneratorTemplate do
    it "renders html header and content" do
      @generator = GeneratorsTemplate::HTML.new
      test = "<h1>This is the header</h1>"
      test += "<div class='content'><p>content</p></div>"
      expect(@generator.render).to eq test
    end
    
    it "renders markdown header and content" do
      test = "#this is the header.content"
      @generator = GeneratorsTemplate::Markdown.new
      expect(@generator.render).to eq test
    end

    it "fails to render if calling the base generator class" do
      expect{GeneratorTemplate.new.header}.to raise_error(NotImplementedError)
      expect{GeneratorTemplate.new.content}.to raise_error(NotImplementedError)
    end

  end
end



