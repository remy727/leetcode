# frozen_string_literal: true

# 621. Task Scheduler
# https://leetcode.com/problems/task-scheduler

# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
  freqs = Hash.new(0)
  tasks.each { |a| freqs[a] += 1 }
  max_f = freqs.values.max
  max_f_key_num = (freqs.select { |k, v| v == max_f }).length

  [tasks.length, (max_f - 1) * (n + 1) + max_f_key_num].max
end
