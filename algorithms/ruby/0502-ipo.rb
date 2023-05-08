# frozen_string_literal: true

# 502. IPO
# https://leetcode.com/problems/ipo

# @param {Integer} k
# @param {Integer} w
# @param {Integer[]} profits
# @param {Integer[]} capital
# @return {Integer}
def bs_insert(a, item)
  a.insert(a.bsearch_index { item <= _1 } || a.size, item)
end

def find_maximized_capital(k, w, profits, costs)
  tasks = costs.zip(profits).sort
  sorted_profits = []

  k.times.reduce(w) do |capital, _|
    while tasks[0] && capital >= tasks[0][0]
      bs_insert(sorted_profits, tasks.shift[1])
    end

    capital + (sorted_profits.pop || 0)
  end
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_find_maximized_capital < Test::Unit::TestCase
  def test_
    assert_equal 4, find_maximized_capital(2, 0, [1, 2, 3], [0, 1, 1])
    assert_equal 6, find_maximized_capital(3, 0, [1, 2, 3], [0, 1, 2])
  end
end
