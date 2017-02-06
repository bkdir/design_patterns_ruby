require 'state'

describe CarProductionLine do
  let(:production_line) { CarProductionLine.new }

  it "starts with the engine" do
    expect(production_line.state.class).to eq (EngineInstallationState)
  end

  it "installs the hood after the engine" do
    production_line.move_to! :hood
    expect(production_line.state.class).to eq (HoodInstallationState)
  end

  it "cant't jump to wheels right after the engine" do
    expect{ production_line.move_to! :wheels }.to raise_error IllegalStateJumpError
  end

  it "installs the wheels after the hood" do
    production_line.move_to! :hood
    production_line.move_to! :wheel
    expect(production_line.state.class).to eq (WheelInstallationState)
  end
end
