# frozen_string_literal: true

# @param {Integer[]} arr
# @return {Integer}
def min_jumps(arr)
  return 0 if (t = arr.size - 1) < 1
  g = arr.each_index.group_by { arr[_1] }
  s, q, v = 0, [0], [false] * t
  v[0] = true
  loop do
    (s += 1; q.size).times do
      i = q.shift
      c = (g[arr[i]] || []) << i + 1
      g.delete arr[i]
      c << i - 1 if i > 0
      c.each do | x |
        return s if x == t
        next if v[x]
        v[x] = true
        q << x
      end
    end
  end
end

def min_jumps1(arr)
  @d = false
  last_index = arr.size - 1
  return 0 if arr.size <= 1
  graph = {}
  arr.each_with_index do |value, index|
    graph[value] ||= []
    graph[value].push(index)
  end
  layer = [0]
  used = {}
  used[0] = true
  step = 0
  while ! layer.empty?
    nxt = []
    layer.each do |i|
      return step if last_index == i
      [i + 1, i - 1].each do |j|
        if j.between?(0, last_index) && (!used[j])
          used[j] = true
          nxt.push(j)
        end
      end
      graph[arr[i]].each do |j|
        if ! used[j]
          used[j] = true
          nxt.push(j)
        end
      end
      # Most important line!
      graph[arr[i]].clear()
    end
    step += 1
    layer = nxt
  end
end

# @param {Integer[]} arr
# @return {Integer}
def min_jumps2(arr)
  arr_count = arr.count

  graph = Hash.new { |h, k| h[k] = [] }
  arr_count.times do |i|
    graph[arr[i]] << i
  end

  src = 0
  dest = arr_count - 1

  visited = Set.new
  visited << src

  queue = []
  queue << [src, 0]

  until queue.empty?
    node, dist = queue.shift
    return dist if node == dest

    ([node - 1, node + 1] + graph[arr[node]].reverse).each do |child|
      if 0 <= child &&
          child < arr_count &&
          child != node &&
          !visited.include?(child)

        visited << child
        return dist + 1 if child == dest
        queue << [child, dist + 1]
      end
    end
  end

  -1
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_min_jumps < Test::Unit::TestCase
  def test_
    assert_equal 3, min_jumps([100, -23, -23, 404, 100, 23, 23, 23, 3, 404])
    assert_equal 0, min_jumps([7])
    assert_equal 1, min_jumps([7, 6, 9, 6, 9, 6, 9, 7])

    assert_equal 3, min_jumps1([100, -23, -23, 404, 100, 23, 23, 23, 3, 404])
    assert_equal 0, min_jumps1([7])
    assert_equal 1, min_jumps1([7, 6, 9, 6, 9, 6, 9, 7])

    assert_equal 3, min_jumps2([100, -23, -23, 404, 100, 23, 23, 23, 3, 404])
    assert_equal 0, min_jumps2([7])
    assert_equal 1, min_jumps2([7, 6, 9, 6, 9, 6, 9, 7])
  end
end

# ********************#
#     Benchmark       #
# ********************#

require "benchmark"

arr = [100, -23, -23, 404, 100, 23, 23, 23, 3, 404]
Benchmark.bm do |x|
  x.report("min_jumps: ") { min_jumps(arr) }
  x.report("min_jumps1: ") { min_jumps1(arr) }
  x.report("min_jumps2: ") { min_jumps2(arr) }
end

# user     system      total        real
# min_jumps:   0.000029   0.000005   0.000034 (  0.000029)
# min_jumps1:   0.000040   0.000008   0.000048 (  0.000048)
# min_jumps2:   0.001512   0.000000   0.001512 (  0.001514)
