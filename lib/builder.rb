class RentalPlan
  attr_reader :ranges

  def self.build name
    build_meta name
    build_list_of_ranges
    new @metadata, @ranges
  end

  def self.build_meta name
    @metadata = Metadata.new name
  end

  def self.build_list_of_ranges
    @ranges = [ DayRange.build ]
  end

  def initialize metadata, ranges
    @metadata = metadata
    @ranges = ranges
  end

  def name
    @metadata.name
  end
end

class DayRange
  attr_reader :start, :hourranges

  def initialize hourranges, start = 1, finish = 9999
    @start = start
    @finish = finish
    @hourranges = hourranges
  end

  def self.build
    build_hour_ranges
    new @hourranges
  end

  def self.build_hour_ranges
    @hourranges = [ HourRange.new ]
  end
end

class HourRange
  attr_reader :start, :finish
  def initialize start = 1, finish = 24
    @start = start
    @finish = finish
  end
end

class Metadata
  attr_reader :name
  def initialize name
    @name = name
  end
end
