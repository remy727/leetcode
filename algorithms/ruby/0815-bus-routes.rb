# frozen_string_literal: true

# 815. Bus Routes
# https://leetcode.com/problems/bus-routes/
# Hard
# TODO: Implement

=begin
You are given an array routes representing bus routes where routes[i] is a bus route that the ith bus repeats forever.

For example, if routes[0] = [1, 5, 7], this means that the 0th bus travels in the sequence 1 -> 5 -> 7 -> 1 -> 5 -> 7 -> 1 -> ... forever.
You will start at the bus stop source (You are not on any bus initially), and you want to go to the bus stop target. You can travel between bus stops by buses only.

Return the least number of buses you must take to travel from source to target. Return -1 if it is not possible.

Example 1:
Input: routes = [[1,2,7],[3,6,7]], source = 1, target = 6
Output: 2
Explanation: The best strategy is take the first bus to the bus stop 7, then take the second bus to the bus stop 6.

Example 2:
Input: routes = [[7,12],[4,5,15],[6],[15,19],[9,12,13]], source = 15, target = 12
Output: -1

Constraints:
1 <= routes.length <= 500.
1 <= routes[i].length <= 105
All the values of routes[i] are unique.
sum(routes[i].length) <= 105
0 <= routes[i][j] < 106
0 <= source, target < 106

=end

# @param {Integer[][]} routes
# @param {Integer} source
# @param {Integer} target
# @return {Integer}
def num_buses_to_destination(routes, source, target)
  return 0 if source == target

  stop_to_bus = Hash.new { |h, k| h[k] = [] }
  routes.each_with_index do |route, i|
    route.each { |stop| stop_to_bus[stop] << i }
  end

  buses_taken = 0
  visited_stops = Set.new([source])
  visited_buses = Set.new
  queue = [source]

  while !queue.empty?
    buses_taken += 1
    next_queue = []

    queue.each do |stop|
      stop_to_bus[stop].each do |bus|
        next if visited_buses.include?(bus)
        visited_buses.add(bus)

        routes[bus].each do |next_stop|
          return buses_taken if next_stop == target
          next if visited_stops.include?(next_stop)

          visited_stops.add(next_stop)
          next_queue << next_stop
        end
      end
    end

    queue = next_queue
  end

  -1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_num_buses_to_destination < Test::Unit::TestCase
  def test_
    assert_equal 2, num_buses_to_destination([[1, 2, 7], [3, 6, 7]], 1, 6)
    assert_equal(-1, num_buses_to_destination([[7, 12], [4, 5, 15], [6], [15, 19], [9, 12, 13]], 15, 12))
  end
end
