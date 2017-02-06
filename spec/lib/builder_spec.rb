require 'builder.rb'

describe RentalPlan do
  before { @plan = RentalPlan.build("My First Plan") }

  it 'has metadata' do
    expect(@plan.name).to eq "My First Plan"
  end

  it 'has a list of date range items' do
    expect(@plan.ranges.first.start).to eq 1
  end

  describe "each range item" do
    it "has its own list of hour range items" do
      expect(@plan.ranges.first.hourranges.first.finish).to eq 24
    end
  end
end
