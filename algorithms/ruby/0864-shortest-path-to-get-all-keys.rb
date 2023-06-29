# frozen_string_literal: true

# 864. Shortest Path to Get All Keys
# Hard
# https://leetcode.com/problems/shortest-path-to-get-all-keys

=begin
You are given an m x n grid grid where:
* '.' is an empty cell.
* '#' is a wall.
* '@' is the starting point.
* Lowercase letters represent keys.
* Uppercase letters represent locks.
You start at the starting point and one move consists of walking one space in one of the four cardinal directions. You cannot walk outside the grid, or walk into a wall.
If you walk over a key, you can pick it up and you cannot walk over a lock unless you have its corresponding key.
For some 1 <= k <= 6, there is exactly one lowercase and one uppercase letter of the first k letters of the English alphabet in the grid. This means that there is exactly one key for each lock, and one lock for each key; and also that the letters used to represent the keys and locks were chosen in the same order as the English alphabet.
Return the lowest number of moves to acquire all keys. If it is impossible, return -1.

Example 1:
Input: grid = ["@.a..","###.#","b.A.B"]
Output: 8
Explanation: Note that the goal is to obtain all the keys not to open all the locks.

Example 2:
Input: grid = ["@..aA","..B#.","....b"]
Output: 6

Example 3:
Input: grid = ["@Aa"]
Output: -1

Constraints:
* m == grid.length
* n == grid[i].length
* 1 <= m, n <= 30
* grid[i][j] is either an English letter, '.', '#', or '@'.
* The number of keys in the grid is in the range [1, 6].
* Each key in the grid is unique.
* Each key in the grid has a matching lock.
=end

# @param {String[]} grid
# @return {Integer}
def shortest_path_all_keys(grid)
  m = grid.size
  n = grid[0].size

  start = nil
  key_count = 0
  for i in (0...m) do
    for j in (0...n) do
      start = [i, j] if grid[i][j] == "@"
      key_count += 1 if grid[i][j].ord >= "a".ord && grid[i][j].ord <= "f".ord
    end
  end

  number_key_states = 2**key_count
  all_keys_state = number_key_states - 1
  visited = Array.new(m) { Array.new(n) { Array.new(number_key_states, false) } }

  start << 0 # distance
  start << 0 # keys
  bfs = [start]

  dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]]

  while !bfs.empty?
    x, y, distance, keys = bfs.shift()

    for dir_x, dir_y in dirs do
      new_x = x + dir_x
      new_y = y + dir_y

      if new_x >= 0 && new_x < m && new_y >= 0 && new_y < n && grid[new_x][new_y] != "#" &&
        !visited[new_x][new_y][keys]

        bfs_continue = false
        new_keys = keys

        # It's a lock, we need the key
        if grid[new_x][new_y].ord >= "A".ord && grid[new_x][new_y].ord <= "F".ord
          key_mask = 1 << grid[new_x][new_y].ord - "A".ord
          bfs_continue = key_mask & keys != 0

        # It's a key, pick it up
        elsif grid[new_x][new_y].ord >= "a".ord && grid[new_x][new_y].ord <= "f".ord
          bfs_continue = true
          key_mask = 1 << grid[new_x][new_y].ord - "a".ord
          new_keys |= key_mask
        # move freely because it's not a wall. It's open or the start
        else
          bfs_continue = true
        end

        if bfs_continue
          return distance + 1 if new_keys == all_keys_state
          visited[new_x][new_y][keys] = true
          bfs << [new_x, new_y, distance + 1, new_keys]
        end
      end
    end
  end

  -1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_shortest_path_all_keys < Test::Unit::TestCase
  def test_
    assert_equal 8, shortest_path_all_keys(["@.a..", "###.#", "b.A.B"])
    assert_equal 6, shortest_path_all_keys(["@..aA", "..B#.", "....b"])
    assert_equal(-1, shortest_path_all_keys(["@Aa"]))
  end
end
