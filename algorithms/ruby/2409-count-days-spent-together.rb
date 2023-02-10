# frozen_string_literal: true

# Problem: 2409. Count Days Spent Together
# URL: https://leetcode.com/problems/count-days-spent-together

# @param {String} arrive_alice
# @param {String} leave_alice
# @param {String} arrive_bob
# @param {String} leave_bob
# @return {Integer}
def count_days_together(arrive_alice, leave_alice, arrive_bob, leave_bob)
  return 0 if arrive_alice > leave_bob || arrive_bob > leave_alice

  start_date = [arrive_alice, arrive_bob].max
  end_date = [leave_alice, leave_bob].min
  days(end_date) - days(start_date) + 1
end

def days(date)
  days_per_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  month, day = date.split("-").map(&:to_i)
  (0..(month - 2)).reduce(day) do |total, i|
    total + days_per_month[i]
  end
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_count_days_together < Test::Unit::TestCase
  def test_
    assert_equal 3, count_days_together("08-15", "08-18", "08-16", "08-19")
    assert_equal 0, count_days_together("10-01", "10-31", "11-01", "12-31")
  end
end
