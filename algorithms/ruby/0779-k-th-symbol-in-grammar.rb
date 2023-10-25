# frozen_string_literal: true

# 779. K-th Symbol in Grammar
# Medium
# https://leetcode.com/problems/k-th-symbol-in-grammar

=begin
We build a table of n rows (1-indexed). We start by writing 0 in the 1st row. Now in every subsequent row, we look at the previous row and replace each occurrence of 0 with 01, and each occurrence of 1 with 10.
* For example, for n = 3, the 1st row is 0, the 2nd row is 01, and the 3rd row is 0110.
Given two integer n and k, return the kth (1-indexed) symbol in the nth row of a table of n rows.

Example 1:
Input: n = 1, k = 1
Output: 0
Explanation: row 1: 0

Example 2:
Input: n = 2, k = 1
Output: 0
Explanation:
row 1: 0
row 2: 01

Example 3:
Input: n = 2, k = 2
Output: 1
Explanation:
row 1: 0
row 2: 01

Constraints:
1 <= n <= 30
1 <= k <= 2n - 1
=end

# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_grammar(n, k)
  r = 0
  while n > 1
    k.odd? ? k += 1 : r ^= 1
    k /= 2
    n -= 1
  end
  r
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_kth_grammar < Test::Unit::TestCase
  def test_
    assert_equal 0, kth_grammar(1, 1)
    assert_equal 0, kth_grammar(2, 1)
    assert_equal 1, kth_grammar(2, 2)
  end
end
