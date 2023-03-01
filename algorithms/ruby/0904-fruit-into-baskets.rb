# frozen_string_literal: true

# Problem: 904. Fruit Into Baskets
# URL: https://leetcode.com/problems/fruit-into-baskets

# @param {Integer[]} fruits
# @return {Integer}
def total_fruit(fruits)
  left = 0
  max_fruit = 0
  hash = {}
  hash.default = 0

  fruits.each_with_index do |fruit, right|
    hash[fruit] += 1

    while hash.length > 2
      hash[fruits[left]] -= 1

      hash.delete(fruits[left]) if hash[fruits[left]].zero?

      left += 1
    end

    max_fruit = [max_fruit, right - left + 1].max
  end

  max_fruit
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_total_fruit < Test::Unit::TestCase
  def test_
    assert_equal 3, total_fruit([1, 2, 1])
    assert_equal 3, total_fruit([0, 1, 2, 2])
    assert_equal 4, total_fruit([1, 2, 3, 2, 2])
  end
end
