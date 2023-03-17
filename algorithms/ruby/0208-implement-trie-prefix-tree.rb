# frozen_string_literal: true

# Problem: 208. Implement Trie (Prefix Tree)
# URL: https://leetcode.com/problems/implement-trie-prefix-tree

=begin

A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

Implement the Trie class:

* Trie() Initializes the trie object.
* void insert(String word) Inserts the string word into the trie.
* boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
* boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.

### Constraints:

* 1 <= word.length, prefix.length <= 2000
* word and prefix consist only of lowercase English letters.
* At most 3 * 104 calls in total will be made to insert, search, and startsWith.

=end

class Trie
  def initialize
    @t = [{}, false]
  end


=begin
  :type word: String
  :rtype: Void
=end
  def insert(word)
    t = @t
    word.bytes.each do
      t = (t.first()[_1] ||= [{}, false])
    end
    t[1] = true
  end


=begin
  :type word: String
  :rtype: Boolean
=end
  def search(word)
    starts_with(word) && @c.last
  end


=begin
  :type prefix: String
  :rtype: Boolean
=end
  def starts_with(prefix)
    (@c = @t; prefix.bytes).all? { @c = @c.first()[_1] }
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
