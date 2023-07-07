# frozen_string_literal: true

# 2024. Maximize the Confusion of an Exam
# Medium
# https://leetcode.com/problems/maximize-the-confusion-of-an-exam

=begin
A teacher is writing a test with n true/false questions, with 'T' denoting true and 'F' denoting false. He wants to confuse the students by maximizing the number of consecutive questions with the same answer (multiple trues or multiple falses in a row).
You are given a string answerKey, where answerKey[i] is the original answer to the ith question. In addition, you are given an integer k, the maximum number of times you may perform the following operation:
* Change the answer key for any question to 'T' or 'F' (i.e., set answerKey[i] to 'T' or 'F').
Return the maximum number of consecutive 'T's or 'F's in the answer key after performing the operation at most k times.

Example 1:
Input: answerKey = "TTFF", k = 2
Output: 4
Explanation: We can replace both the 'F's with 'T's to make answerKey = "TTTT".
There are four consecutive 'T's.

Example 2:
Input: answerKey = "TFFT", k = 1
Output: 3
Explanation: We can replace the first 'T' with an 'F' to make answerKey = "FFFT".
Alternatively, we can replace the second 'T' with an 'F' to make answerKey = "TFFF".
In both cases, there are three consecutive 'F's.

Example 3:
Input: answerKey = "TTFTTFTT", k = 1
Output: 5
Explanation: We can replace the first 'F' to make answerKey = "TTTTTFTT"
Alternatively, we can replace the second 'F' to make answerKey = "TTFTTTTT".
In both cases, there are five consecutive 'T's.

Constraints:
* n == answerKey.length
* 1 <= n <= 5 * 104
* answerKey[i] is either 'T' or 'F'
* 1 <= k <= n
=end

# @param {String} answer_key
# @param {Integer} k
# @return {Integer}
def max_consecutive_answers(answer_key, k)
  max_length = 0
  left = 0
  count = { "T" => 0, "F" => 0 }

  answer_key.chars.each_with_index do |char, right|
    count[char] += 1

    if [count["T"], count["F"]].min > k
      count[answer_key[left]] -= 1
      left += 1
    else
      max_length = [max_length, right - left + 1].max
    end
  end

  max_length
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_max_consecutive_answers < Test::Unit::TestCase
  def test_
    assert_equal 4, max_consecutive_answers("TTFF", 2)
    assert_equal 3, max_consecutive_answers("TFFT", 1)
    assert_equal 5, max_consecutive_answers("TTFTTFTT", 1)
  end
end
