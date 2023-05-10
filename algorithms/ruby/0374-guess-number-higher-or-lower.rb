# frozen_string_literal: true

# 374. Guess Number Higher or Lower
# https://leetcode.com/problems/guess-number-higher-or-lower
# Easy

=begin
We are playing the Guess Game. The game is as follows:

I pick a number from 1 to n. You have to guess which number I picked.

Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.

You call a pre-defined API int guess(int num), which returns three possible results:

-1: Your guess is higher than the number I picked (i.e. num > pick).
1: Your guess is lower than the number I picked (i.e. num < pick).
0: your guess is equal to the number I picked (i.e. num == pick).
Return the number that I picked.

Example 1:
Input: n = 10, pick = 6
Output: 6

Example 2:
Input: n = 1, pick = 1
Output: 1

Example 3:
Input: n = 2, pick = 1
Output: 1

Constraints:
1 <= n <= 231 - 1
1 <= pick <= n
=end

# The guess API is already defined for you.
# @param num, your guess
# @return -1 if num is higher than the picked number
#          1 if num is lower than the picked number
#          otherwise return 0
# def guess(num)

def guessNumber(n)
  l, h = 1, n
  while l <= h
    m = l + (h - l) / 2
    ans = guess(m)
    if 0 == ans
      return m
    elsif -1 == ans
      h = m - 1
    else
      l = m + 1
    end
  end
end
