class Family
  attr_reader :father, :mother, :children
  def initialize surname
    @surname = surname
    @children = []
  end

  def add_father firstname
    @father = Parent.new firstname, "M"
  end

  def add_mother firstname
    @mother = Parent.new firstname, "F"
  end

  def add_child firstname, gender
    @children << Child.new(firstname,gender)
  end

  def each_member
    [ @father, @mother, @children ].flatten.each do |member|
      yield member
    end
  end

  def full_name member
    "#{member.firstname} #@surname"
  end
end

class Person
  attr_reader :firstname
  def initialize firstname, gender
    @firstname = firstname
    @gender = gender
  end
end

class Parent < Person
end

class Child < Person
end
