# frozen_string_literal: true

class MyQueue
  def initialize
    @in, @out = [], []
  end

  def push(x)
    @in << x
  end

  def pop
    peek
    @out.pop
  end

  def peek
    @out << @in.pop until @in.empty? if @out.empty?
    @out.last
  end

  def empty
    @in.empty? && @out.empty?
  end
end

# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()
