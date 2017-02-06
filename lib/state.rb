class CarProductionLine
  attr_accessor :state
  def initialize
    @state = EngineInstallationState.new self
  end

  def move_to! state
    @state.next state
  end
end

class State
  def initialize context
    @context = context
  end

  def next_state
  end

  def next state
   if next_state == state
     state_class = Object.const_get(state.to_s.capitalize + "InstallationState")
     @context.state = state_class.new @context
   else
      raise IllegalStateJumpError
   end

  end
end

class EngineInstallationState < State
  def next_state
    :hood
  end
end

class HoodInstallationState < State
  def next_state
    :wheel
  end
end

class WheelInstallationState < State
end

class IllegalStateJumpError < StandardError; end
