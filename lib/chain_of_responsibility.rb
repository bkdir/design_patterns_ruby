class Employee
  attr_reader :name
  def initialize options = {}
    @chief = options[:chief]
  end

  def method_missing *args, &block
    method = args.shift
    if method.to_s.include? "department_"
      @chief.send method, *args, &block
    else
      super method,*args, &block
    end
  end
end

class Department
  attr_reader :name, :count
  def initialize name, count = 0
    @name = name
    @count = count
  end
end

class Chief
  attr_reader :department
  def initialize options
    @department = options[:department]
  end

  def method_missing *args, &block
    method = args.shift
    if method.to_s.include? "department_"
      correct_method = method.to_s.gsub("department_", "")
      @department.send correct_method, *args, &block
    else
      super method,*args, &block
    end
  end
end
