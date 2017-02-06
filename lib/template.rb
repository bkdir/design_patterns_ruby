module Newsletter
  class GeneratorTemplate
    def render
      html = "#{header}"
      html += "#{content}"
    end

    def header
      raise NotImplementedError
    end

    def content
      raise NotImplementedError
    end
  end
end
