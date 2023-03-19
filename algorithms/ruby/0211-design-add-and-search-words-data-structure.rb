# frozen_string_literal: true

# Problem: 211. Design Add and Search Words Data Structure
# URL: https://leetcode.com/problems/design-add-and-search-words-data-structure

=begin

Design a data structure that supports adding new words and finding if a string matches any previously added string.

Implement the WordDictionary class:

* WordDictionary() Initializes the object.
* void addWord(word) Adds word to the data structure, it can be matched later.
* bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.

Constraints:

* 1 <= word.length <= 25
* word in addWord consists of lowercase English letters.
* word in search consist of '.' or lowercase English letters.
* There will be at most 3 dots in word for search queries.
* At most 104 calls will be made to addWord and search.

=end

class WordDictionary
  def initialize
    @d = {}
  end


=begin
  :type word: String
  :rtype: Void
=end
  def add_word(word)
    t = @d[word.size] ||= {}
    word.each_byte do |i|
      t = t[i] ||= {}
    end
  end


=begin
  :type word: String
  :rtype: Boolean
=end
  def search(word)
    @p, @z = word.bytes, (z = word.size) - 1
    dfs @d[z], 0
  end

  private
    def dfs(t, i)
      return false unless t
      c = @p[i]
      if i == @z
        return c == 46 || !!t[c]
      end
      i += 1
      c == 46 ?
          t.any? { dfs _1.last, i } :
          dfs(t[c], i)
    end
end

# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary.new()
# obj.add_word(word)
# param_2 = obj.search(word)
