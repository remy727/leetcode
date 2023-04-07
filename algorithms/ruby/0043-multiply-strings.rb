# frozen_string_literal: true

# 43. Multiply Strings
# https:#leetcode.com/problems/multiply-strings

=begin

Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

### Example 1:
Input: num1 = "2", num2 = "3"
Output: "6"

### Example 2:
Input: num1 = "123", num2 = "456"
Output: "56088"

### Constraints:
* 1 <= num1.length, num2.length <= 200
* num1 and num2 consist of digits only.
* Both num1 and num2 do not contain any leading zero, except the number 0 itself.

=end

# Runtime 119 ms Beats 44.26%
# Memory 211 MB Beats 70.49%%
# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  if num1 == "0" || num2 == "0"
    return "0"
  end

  first_numbers = num1.each_char.map(&:to_i).reverse
  second_numbers = num2.each_char.map(&:to_i).reverse

  # To store the multiplication result of each digit of secondNumber with firstNumber.
  len = first_numbers.length + second_numbers.length
  answer = Array.new(len, 0)

  second_numbers.each_with_index do |digit2, place2|
    first_numbers.each_with_index do |digit1, place1|
      # The number of zeros from multiplying to digits depends on the
      # place of digit2 in secondNumber and the place of the digit1 in firstNumber.
      currentPos = place1 + place2

      # The digit currently at position currentPos in the answer string
      # is carried over and summed with the current result.
      carry = answer[currentPos]
      multiplication = digit1 * digit2 + carry

      # Set the ones place of the multiplication result.
      answer[currentPos] = multiplication % 10

      # Carry the tens place of the multiplication result by
      # adding it to the next position in the answer array.
      answer[currentPos + 1] += multiplication / 10
    end
  end

  answer.pop if answer.last == 0

  # Ans is in the reversed order.
  # Reverse it to get the final ans.
  answer.reverse.join("")
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_multiply < Test::Unit::TestCase
  def test_
    assert_equal "6", multiply("2", "3")
    assert_equal "56088", multiply("123", "456")
  end
end
