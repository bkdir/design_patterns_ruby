module Newsletter
  module Adapters
    class Json
      def initialize source
        @source = source
      end

      def parse 
        JSON.parse @source
      end
    end

    class Xml
      def initialize source
        @source = source
      end

      def parse 
        xml = Nokogiri::XML @source
        title = xml.xpath("//item/title")[0].children[0].text
        body = xml.xpath("//item/body")[0].children[0].text
        { "title" => title, "body" => body }
      end
    end
  end
end
module Newsletter
  class Content
    attr_reader :body, :title

    def self.parse(source, format)
      adapter = Newsletter::Adapters::const_get(format.to_s.capitalize).new source
      content = adapter.parse
      Content.new(content["title"], content["body"])
    end

    def initialize(title, body)
      @title = title
      @body = body
    end
  end
end

=begin
# Initial implementation without adapter pattern

module Newsletter
  class Content
    attr_reader :body, :title

    def self.parse(source, format)
      content = if format == :json
                  parse_json source
                elsif format == :xml
                  parse_xml source
                end
                  
      Content.new(content["title"], content["body"])
    end

    def self.parse_json source
      json = JSON.parse source
    end

    def self.parse_xml source
      xml = Nokogiri::XML source
      title = xml.xpath("//item/title")[0].children[0].text
      body = xml.xpath("//item/body")[0].children[0].text
      { "title" => title, "body" => body }
    end

    def initialize(title, body)
      @title = title
      @body = body
    end
  end
end
=end
