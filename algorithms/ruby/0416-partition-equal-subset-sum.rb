# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Boolean}
def can_partition(nums)
  (s = nums.sum).even? &&
      (nums.reduce(1) { _1 | (_1 << _2) } >> s / 2).odd?
end
