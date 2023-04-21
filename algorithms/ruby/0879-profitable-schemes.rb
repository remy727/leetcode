# frozen_string_literal: true

# @param {Integer} n
# @param {Integer} min_profit
# @param {Integer[]} group
# @param {Integer[]} profit
# @return {Integer}
MOD = 10**9 + 7
def profitable_schemes(n, min_profit, group, profit)
  dp = Array.new(n + 1) { Array.new(min_profit + 1, 0) }
  dp[0][0] = 1
  group.each_with_index do |g, i|
    (n - g).downto(0) do |j|
      min_profit.downto(0) do |k|
          dp[j + g][[min_profit, k + profit[i]].min] += dp[j][k]
          dp[j + g][[min_profit, k + profit[i]].min] %= MOD
        end
    end
  end
  (0..n).sum { |i| dp[i][min_profit] } % MOD
end
