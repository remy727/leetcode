# frozen_string_literal: true

# Problem: 622. Design Circular Queue
# URL: https://leetcode.com/problems/design-circular-queue

class MyCircularQueue
  #     :type k: Integer
  def initialize(k)
    @queue = [-1] * k
    @size = k
    @len = 0
    @head = 0
  end

  #     :type value: Integer
  #     :rtype: Boolean
  def en_queue(value)
    if @len < @size
      @queue[(@head + @len) % @size] = value
      @len += 1

      return true
    end

    false
  end

  #     :rtype: Boolean
  def de_queue
    return false if is_empty

    @queue[@head] = -1
    @head = (@head + 1) % @size
    @len -= 1

    true
  end

  #     :rtype: Integer
  def front
    is_empty ? -1 : @queue[@head]
  end

  #     :rtype: Integer
  def rear
    is_empty ? -1 : @queue[(@head + @len - 1) % @size]
  end

  #     :rtype: Boolean
  def is_empty
    @len.zero?
  end

  #     :rtype: Boolean
  def is_full
    @len == @size
  end
end

# Your MyCircularQueue object will be instantiated and called as such:
# obj = MyCircularQueue.new(k)
# param_1 = obj.en_queue(value)
# param_2 = obj.de_queue()
# param_3 = obj.front()
# param_4 = obj.rear()
# param_5 = obj.is_empty()
# param_6 = obj.is_full()

# **************** #
#       TEST       #
# **************** #

# TODO: Write tests
