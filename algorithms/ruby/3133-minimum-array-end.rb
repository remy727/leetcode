# frozen_string_literal: true

# 3133. Minimum Array End
# Medium
# https://leetcode.com/problems/minimum-array-end

def min_end(n, x)
  result = x
  remaining = n - 1
  position = 1

  while remaining != 0
    if (x & position) == 0
      result |= (remaining & 1) * position
      remaining >>= 1
    end
    position <<= 1
  end

  result.to_i
end
