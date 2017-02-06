module Helper
  def capture
    output = StringIO.new
    $stdout = output
    yield
    output.string
  end
end
