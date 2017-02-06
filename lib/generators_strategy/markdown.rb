require 'forwardable'

module Newsletter
  module GeneratorsStrategy
    class Html
      extend Forwardable

      def_delegators :@context, :text, :title

      def initialize context
        @context = context
      end

      def execute
        "#{header}#{content}"
      end

      def header
        "<h1>#{title}</h1>"
      end

      def content
        content = "<div class='content'>"
        content += "<p>#{text}</p>"
        content += "</div>"
      end
    end
  end
end
