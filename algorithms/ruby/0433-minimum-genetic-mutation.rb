# frozen_string_literal: true

# 433. Minimum Genetic Mutation
# https://leetcode.com/problems/minimum-genetic-mutation
# Medium

=begin
A gene string can be represented by an 8-character long string, with choices from 'A', 'C', 'G', and 'T'.
Suppose we need to investigate a mutation from a gene string startGene to a gene string endGene where one mutation is defined as one single character changed in the gene string.
* For example, "AACCGGTT" --> "AACCGGTA" is one mutation.

There is also a gene bank bank that records all the valid gene mutations. A gene must be in bank to make it a valid gene string.

Given the two gene strings startGene and endGene and the gene bank bank, return the minimum number of mutations needed to mutate from startGene to endGene. If there is no such a mutation, return -1.

Note that the starting point is assumed to be valid, so it might not be included in the bank.

Example 1:
Input: startGene = "AACCGGTT", endGene = "AACCGGTA", bank = ["AACCGGTA"]
Output: 1

Example 2:
Input: startGene = "AACCGGTT", endGene = "AAACGGTA", bank = ["AACCGGTA","AACCGCTA","AAACGGTA"]
Output: 2

Constraints:
* 0 <= bank.length <= 10
* startGene.length == endGene.length == bank[i].length == 8
* startGene, endGene, and bank[i] consist of only the characters ['A', 'C', 'G', 'T'].
=end

# @param {String} start
# @param {String} end
# @param {String[]} bank
# @return {Integer}
def min_mutation(start_gene, end_gene, bank)
  queue = [[start_gene, 0]]

  queue.each do |word, depth|
    bank.reject! do |next_word|
      if one_mutation_away?(word, next_word)
        queue << [next_word, depth + 1]
        true
      else
        false
      end
    end
  end

  queue.to_h[end_gene] || -1
end

def one_mutation_away?(word1, word2)
  (0..7).count { |i| word1[i] != word2[i] } == 1
end

# ********************#
#       TEST         #
# ********************#

require "test/unit"
class Test_min_mutation < Test::Unit::TestCase
  def test_
    assert_equal 1, min_mutation("AACCGGTT", "AACCGGTA", ["AACCGGTA"])
    assert_equal 2, min_mutation("AACCGGTT", "AAACGGTA", ["AACCGGTA", "AACCGCTA", "AAACGGTA"])
  end
end
