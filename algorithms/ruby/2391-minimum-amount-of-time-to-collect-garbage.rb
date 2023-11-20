# frozen_string_literal: true

# 2391. Minimum Amount of Time to Collect Garbage
# Medium
# https://leetcode.com/problems/minimum-amount-of-time-to-collect-garbage

=begin
You are given a 0-indexed array of strings garbage where garbage[i] represents the assortment of garbage at the ith house. garbage[i] consists only of the characters 'M', 'P' and 'G' representing one unit of metal, paper and glass garbage respectively. Picking up one unit of any type of garbage takes 1 minute.
You are also given a 0-indexed integer array travel where travel[i] is the number of minutes needed to go from house i to house i + 1.
There are three garbage trucks in the city, each responsible for picking up one type of garbage. Each garbage truck starts at house 0 and must visit each house in order; however, they do not need to visit every house.
Only one garbage truck may be used at any given moment. While one truck is driving or picking up garbage, the other two trucks cannot do anything.
Return the minimum number of minutes needed to pick up all the garbage.

Example 1:
Input: garbage = ["G","P","GP","GG"], travel = [2,4,3]
Output: 21
Explanation:
The paper garbage truck:
1. Travels from house 0 to house 1
2. Collects the paper garbage at house 1
3. Travels from house 1 to house 2
4. Collects the paper garbage at house 2
Altogether, it takes 8 minutes to pick up all the paper garbage.
The glass garbage truck:
1. Collects the glass garbage at house 0
2. Travels from house 0 to house 1
3. Travels from house 1 to house 2
4. Collects the glass garbage at house 2
5. Travels from house 2 to house 3
6. Collects the glass garbage at house 3
Altogether, it takes 13 minutes to pick up all the glass garbage.
Since there is no metal garbage, we do not need to consider the metal garbage truck.
Therefore, it takes a total of 8 + 13 = 21 minutes to collect all the garbage.

Example 2:
Input: garbage = ["MMM","PGM","GP"], travel = [3,10]
Output: 37
Explanation:
The metal garbage truck takes 7 minutes to pick up all the metal garbage.
The paper garbage truck takes 15 minutes to pick up all the paper garbage.
The glass garbage truck takes 15 minutes to pick up all the glass garbage.
It takes a total of 7 + 15 + 15 = 37 minutes to collect all the garbage.

Constraints:
2 <= garbage.length <= 105
garbage[i] consists of only the letters 'M', 'P', and 'G'.
1 <= garbage[i].length <= 10
travel.length == garbage.length - 1
1 <= travel[i] <= 100
=end

# @param {String[]} garbage
# @param {Integer[]} travel
# @return {Integer}
def garbage_collection(garbage, travel)
  sum = 0
  mul = 0
  p = 0
  g = 0
  m = 0

  (garbage.length - 1).downto(1) do |i|
    sum += garbage[i].length

    if mul < 3
      garbage[i].each_char do |ch|
        case ch
        when "P"
          mul = p == 0 ? mul + 1 : mul
          p += 1
        when "G"
          mul = g == 0 ? mul + 1 : mul
          g += 1
        when "M"
          mul = m == 0 ? mul + 1 : mul
          m += 1
        end
      end
    end

    sum += mul * travel[i - 1]
  end

  sum += garbage[0].length
  sum
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_garbage_collection < Test::Unit::TestCase
  def test_
    assert_equal 21, garbage_collection(["G", "P", "GP", "GG"], [2, 4, 3])
    assert_equal 37, garbage_collection(["MMM", "PGM", "GP"], [3, 10])
  end
end
