# frozen_string_literal: true

class MinStack
  def initialize
    @mins, @stack = [], []
  end

  def push(x)
    @stack.push x
    @mins.push x if @mins.empty? || (x <= @mins.last)
  end

  def pop
    @mins.pop if @stack.pop == @mins.last
  end

  def top
    @stack.last
  end

  def get_min
    @mins.last
  end
end
