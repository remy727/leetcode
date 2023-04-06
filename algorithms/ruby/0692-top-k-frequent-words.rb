# frozen_string_literal: true

# 692. Top K Frequent Words
# https://leetcode.com/problems/top-k-frequent-words

=begin

Given an array of strings words and an integer k, return the k most frequent strings.

Return the answer sorted by the frequency from highest to lowest. Sort the words with the same frequency by their lexicographical order.

### Example 1:
Input: words = ["i","love","leetcode","i","love","coding"], k = 2
Output: ["i","love"]
Explanation: "i" and "love" are the two most frequent words.
Note that "i" comes before "love" due to a lower alphabetical order.

### Example 2:
Input: words = ["the","day","is","sunny","the","the","the","sunny","is","is"], k = 4
Output: ["the","is","sunny","day"]
Explanation: "the", "is", "sunny" and "day" are the four most frequent words, with the number of occurrence being 4, 3, 2 and 1 respectively.

### Constraints:
* 1 <= words.length <= 500
* 1 <= words[i].length <= 10
* words[i] consists of lowercase English letters.
* k is in the range [1, The number of unique words[i]]

=end

# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent(words, k)
  words.tally.to_a.sort { |a, b| a[1] != b[1] ? a[1] <=> b[1] : b[0] <=> a[0] }[-k..-1].map(&:first).reverse
end

require "test/unit"
class Test_top_k_frequent < Test::Unit::TestCase
  def test_
    assert_equal ["i", "love"], top_k_frequent(["i", "love", "leetcode", "i", "love", "coding"], 2)
    assert_equal ["the", "is", "sunny", "day"], top_k_frequent(["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], 4)
  end
end
