# frozen_string_literal: true

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  edges = Hash.new { |h, v| h[v] = [] }
  deg = [0] * num_courses
  prerequisites.each do |a, b|
    deg[a] += 1
    edges[b] << a
  end
  leaves = []
  deg.each_with_index { |d, v| leaves << v if d == 0 }
  res = leaves.dup
  # Exclude leaves (with corresponding edges) one by one.
  while v = leaves.shift
    num_courses -= 1
    edges[v].each do |u|
      deg[u] -= 1
      if deg[u] == 0
        leaves << u
        res << u
      end
    end
  end
  # no cycles if no more vertices
  num_courses == 0 ? res : []
end
