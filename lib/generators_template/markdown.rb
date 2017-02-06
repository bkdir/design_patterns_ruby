module Newsletter
  module GeneratorsTemplate
    class Markdown < GeneratorTemplate
      def header
        "#this is the header."
      end
      def content
        "content"
      end
    end
  end
end
