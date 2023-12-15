# frozen_string_literal: true

# 1436. Destination City
# Easy
# https://leetcode.com/problems/destination-city

=begin
You are given the array paths, where paths[i] = [cityAi, cityBi] means there exists a direct path going from cityAi to cityBi. Return the destination city, that is, the city without any path outgoing to another city.
It is guaranteed that the graph of paths forms a line without any loop, therefore, there will be exactly one destination city.

Example 1:
Input: paths = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
Output: "Sao Paulo"
Explanation: Starting at "London" city you will reach "Sao Paulo" city which is the destination city. Your trip consist of: "London" -> "New York" -> "Lima" -> "Sao Paulo".

Example 2:
Input: paths = [["B","C"],["D","B"],["C","A"]]
Output: "A"
Explanation: All possible trips are:
"D" -> "B" -> "C" -> "A".
"B" -> "C" -> "A".
"C" -> "A".
"A".
Clearly the destination city is "A".

Example 3:
Input: paths = [["A","Z"]]
Output: "Z"

Constraints:
1 <= paths.length <= 100
paths[i].length == 2
1 <= cityAi.length, cityBi.length <= 10
cityAi != cityBi
All strings consist of lowercase and uppercase English letters and the space character.
=end

# @param {String[][]} paths
# @return {String}
def dest_city(paths)
  path_hash = paths.to_h
  (path_hash.values - path_hash.keys).first
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_dest_city < Test::Unit::TestCase
  def test_
    assert_equal "Sao Paulo", dest_city([["London", "New York"], ["New York", "Lima"], ["Lima", "Sao Paulo"]])
    assert_equal "A", dest_city([["B", "C"], ["D", "B"], ["C", "A"]])
    assert_equal "Z", dest_city([["A", "Z"]])
  end
end
