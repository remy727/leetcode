# frozen_string_literal: true

# 2305. Fair Distribution of Cookies
# Medium
# https://leetcode.com/problems/fair-distribution-of-cookies

=begin
You are given an integer array cookies, where cookies[i] denotes the number of cookies in the ith bag. You are also given an integer k that denotes the number of children to distribute all the bags of cookies to. All the cookies in the same bag must go to the same child and cannot be split up.
The unfairness of a distribution is defined as the maximum total cookies obtained by a single child in the distribution.
Return the minimum unfairness of all distributions.

Example 1:
Input: cookies = [8,15,10,20,8], k = 2
Output: 31
Explanation: One optimal distribution is [8,15,8] and [10,20]
- The 1st child receives [8,15,8] which has a total of 8 + 15 + 8 = 31 cookies.
- The 2nd child receives [10,20] which has a total of 10 + 20 = 30 cookies.
The unfairness of the distribution is max(31,30) = 31.
It can be shown that there is no distribution with an unfairness less than 31.

Example 2:
Input: cookies = [6,1,3,2,2,4,1,2], k = 3
Output: 7
Explanation: One optimal distribution is [6,1], [3,2,2], and [4,1,2]
- The 1st child receives [6,1] which has a total of 6 + 1 = 7 cookies.
- The 2nd child receives [3,2,2] which has a total of 3 + 2 + 2 = 7 cookies.
- The 3rd child receives [4,1,2] which has a total of 4 + 1 + 2 = 7 cookies.
The unfairness of the distribution is max(7,7,7) = 7.
It can be shown that there is no distribution with an unfairness less than 7.

Constraints:
* 2 <= cookies.length <= 8
* 1 <= cookies[i] <= 105
* 2 <= k <= cookies.length
=end

# @param {Integer[]} cookies
# @param {Integer} k
# @return {Integer}
def distribute_cookies(cookies, k)
  return cookies.max if k == cookies.length
  cookies.sort!

  if cookies.length < 2 * k
    diff = 2 * k - cookies.length
    test = simple_cookies(cookies[0...cookies.length - diff], k - diff)
    return [test, cookies.max].max
  end

  simple_cookies(cookies.dup, k)
end

def simple_cookies(c, k)
  return c.max if c.length == k
  return c.sum if k == 1

  arrs = [Array.new(k, 0)]
  arrs[0][0] = c.shift

  until c.empty?
    ele = c.shift
    new_arrs = []
    arrs.each do |arr|
      (0...k).each do |i|
        new_arr = arr.dup
        new_arr[i] += ele
        new_arrs << new_arr
      end
      arrs = new_arrs
    end
  end

  arrs.map! { |arr| arr.max }
  arrs.min
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_distribute_cookies < Test::Unit::TestCase
  def test_
    assert_equal 31, distribute_cookies([8, 15, 10, 20, 8], 2)
    assert_equal 7, distribute_cookies([6, 1, 3, 2, 2, 4, 1, 2], 3)
  end
end
