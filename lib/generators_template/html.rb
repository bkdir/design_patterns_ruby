module Newsletter
  module GeneratorsTemplate
    class HTML < GeneratorTemplate
      def header
        "<h1>This is the header</h1>"
      end
      def content
        content = "<div class='content'>"
        content += "<p>content</p>"
        content += "</div>"
      end
    end
  end
end
