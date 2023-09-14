# frozen_string_literal: true

# 332. Reconstruct Itinerary
# Hard
# https://leetcode.com/problems/reconstruct-itinerary

=begin
You are given a list of airline tickets where tickets[i] = [fromi, toi] represent the departure and the arrival airports of one flight. Reconstruct the itinerary in order and return it.
All of the tickets belong to a man who departs from "JFK", thus, the itinerary must begin with "JFK". If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string.
For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
You may assume all tickets form at least one valid itinerary. You must use all the tickets once and only once.

Example 1:
Input: tickets = [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
Output: ["JFK","MUC","LHR","SFO","SJC"]

Example 2:
Input: tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"] but it is larger in lexical order.

Constraints:
* 1 <= tickets.length <= 300
* tickets[i].length == 2
* fromi.length == 3
* toi.length == 3
* fromi and toi consist of uppercase English letters.
* fromi != toi
=end

# @param {String[][]} tickets
# @return {String[]}
def find_itinerary(tickets)
  graph = Hash.new { |hash, key| hash[key] = [] }

  # Build the graph.
  tickets.each do |from, to|
    graph[from] << to
  end

  # Sort each adjacency list in reverse lexical order.
  graph.each_value { |neighbors| neighbors.sort!.reverse! }

  # DFS.
  itinerary = []
  stack = ["JFK"]

  while !stack.empty?
    airport = stack.last
    if graph[airport].empty?
      # If no outgoing edge, add to itinerary.
      itinerary << stack.pop
    else
      # Otherwise, visit the next unvisited neighbor.
      stack << graph[airport].pop
    end
  end

  # Reverse the itinerary to get the final path.
  itinerary.reverse
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_find_itinerary < Test::Unit::TestCase
  def test_
    assert_equal ["JFK", "MUC", "LHR", "SFO", "SJC"], find_itinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]])
    assert_equal ["JFK", "ATL", "JFK", "SFO", "ATL", "SFO"], find_itinerary([["JFK", "SFO"], ["JFK", "ATL"], ["SFO", "ATL"], ["ATL", "JFK"], ["ATL", "SFO"]])
  end
end
