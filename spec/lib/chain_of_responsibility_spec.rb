require 'chain_of_responsibility'

describe Employee do
  it "knows his name" do
    expect(Employee.new).to respond_to :name
  end

  it "needs to go to the chief and ask for the department name" do
    department = Department.new "Software Development"
    chief = Chief.new department: department

    expect(Employee.new(chief: chief).department_name).to eq("Software Development")
  end

  it "needs to go to the chief and ask for the department count" do
    department = Department.new "Software Development", 50
    chief = Chief.new department: department

    expect(Employee.new(chief: chief).department_count).to eq 50
  end
end
