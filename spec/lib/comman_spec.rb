require 'command'
require 'helper'

describe Button do
  include Helper
  it "triggers something" do
    button = Button.new(
      label: "Click me!",
      action: ShowMessage
    )

    expect(capture{ button.click }).to include "Button was clicked!"
  end
end
