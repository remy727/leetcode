# frozen_string_literal: true

# 946. Validate Stack Sequences
# https://leetcode.com/problems/validate-stack-sequences/
# Medium

=begin

Given two integer arrays pushed and popped each with distinct values, return true if this could have been the result of a sequence of push and pop operations on an initially empty stack, or false otherwise.

### Example 1:
Input: pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
Output: true
Explanation: We might do the following sequence:
push(1), push(2), push(3), push(4),
pop() -> 4,
push(5),
pop() -> 5, pop() -> 3, pop() -> 2, pop() -> 1

### Example 2:
Input: pushed = [1,2,3,4,5], popped = [4,3,5,1,2]
Output: false
Explanation: 1 cannot be popped before 2.

### Constraints:
* 1 <= pushed.length <= 1000
* 0 <= pushed[i] <= 1000
* All the elements of pushed are unique.
* popped.length == pushed.length
* popped is a permutation of pushed.

=end

# @param {Integer[]} pushed
# @param {Integer[]} popped
# @return {Boolean}
def validate_stack_sequences(pushed, popped)
  stack = []
  for x in pushed
    stack << x
    while stack.last && stack.last == popped.first
      stack.pop
      popped.shift
    end
  end
  popped.empty?
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_validate_stack_sequences < Test::Unit::TestCase
  def test_
    assert_equal true, validate_stack_sequences([1, 2, 3, 4, 5], [4, 5, 3, 2, 1])
    assert_equal false, validate_stack_sequences([1, 2, 3, 4, 5], [4, 3, 5, 1, 2])
  end
end
