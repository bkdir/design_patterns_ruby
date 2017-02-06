module Newsletter
  class GeneratorStrategy
    attr_reader :format, :title, :text
    def initialize format
      @format = format
      @text = "content"
      @title = "title"
    end

    def render
      format = @format.to_s.capitalize
      strategy = Newsletter::GeneratorsStrategy.const_get(format).new self
      strategy.execute
    end

    def header
      raise NotImplementedError
    end

    def content
      raise NotImplementedError
    end
  end
end
