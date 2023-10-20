# frozen_string_literal: true

# 341. Flatten Nested List Iterator
# Medium
# https://leetcode.com/problems/flatten-nested-list-iterator

=begin
You are given a nested list of integers nestedList. Each element is either an integer or a list whose elements may also be integers or other lists. Implement an iterator to flatten it.

Implement the NestedIterator class:
* NestedIterator(List<NestedInteger> nestedList) Initializes the iterator with the nested list nestedList.
* int next() Returns the next integer in the nested list.
* boolean hasNext() Returns true if there are still some integers in the nested list and false otherwise.
Your code will be tested with the following pseudocode:
```
initialize iterator with nestedList
res = []
while iterator.hasNext()
    append iterator.next() to the end of res
return res
```
If res matches the expected flattened list, then your code will be judged as correct.

Example 1:
Input: nestedList = [[1,1],2,[1,1]]
Output: [1,1,2,1,1]
Explanation: By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,1,2,1,1].

Example 2:
Input: nestedList = [1,[4,[6]]]
Output: [1,4,6]
Explanation: By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,4,6].

Constraints:
1 <= nestedList.length <= 500
The values of the integers in the nested list is in the range [-106, 106].
=end

# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
#
# class NestedInteger
#    def is_integer()
#        """
#        Return true if this NestedInteger holds a single integer, rather than a nested list.
#        @return {Boolean}
#        """
#
#    def get_integer()
#        """
#        Return the single integer that this NestedInteger holds, if it holds a single integer
#        Return nil if this NestedInteger holds a nested list
#        @return {Integer}
#        """
#
#    def get_list()
#        """
#        Return the nested list that this NestedInteger holds, if it holds a nested list
#        Return nil if this NestedInteger holds a single integer
#        @return {NestedInteger[]}
#        """

class NestedIterator
  # @param {NestedInteger[]} nested_list
  def initialize(nested_list)
    # p nested_list.class
    @a = []
    nested_list.each do |x|
      fill(x)
    end
    # p @a
    @i = -1
  end
  def fill(x)
    # p x.class
    if x.is_integer()
      # p "this is integer."
      # p [x.get_integer().class,x.get_integer()]
      @a.push(x.get_integer())
    else
      # p "this is a list."
      x.get_list().each do |el|
        fill(el)
      end
    end
  end

  # @return {Boolean}
  def has_next
    (@i + 1).between?(0, @a.size - 1)
  end

  # @return {Integer}
  def next
    @i += 1
    @a[@i]
  end
end

# Your NestedIterator will be called like this:
# i, v = NestedIterator.new(nested_list), []
# while i.has_next()
#    v << i.next
# end
