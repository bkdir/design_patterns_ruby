require 'forwardable'

module Newsletter
  module GeneratorsStrategy
    class Markdown
      extend Forwardable

      def_delegators :@context, :text, :title

      def initialize context
        @context = context
      end

      def execute
        "#{header}#{content}"
      end

      def header
        "# #{title}."
      end

      def content
       "#{text}"
      end
    end
  end
end
