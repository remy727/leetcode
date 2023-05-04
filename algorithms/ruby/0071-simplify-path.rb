# frozen_string_literal: true

# 71. Simplify Path
# https://leetcode.com/problems/simplify-path/
# Medium

=begin
Given a string path, which is an absolute path (starting with a slash '/') to a file or directory in a Unix-style file system, convert it to the simplified canonical path.

In a Unix-style file system, a period '.' refers to the current directory, a double period '..' refers to the directory up a level, and any multiple consecutive slashes (i.e. '//') are treated as a single slash '/'. For this problem, any other format of periods such as '...' are treated as file/directory names.

The canonical path should have the following format:

The path starts with a single slash '/'.
Any two directories are separated by a single slash '/'.
The path does not end with a trailing '/'.
The path only contains the directories on the path from the root directory to the target file or directory (i.e., no period '.' or double period '..')
Return the simplified canonical path.

### Example 1:
Input: path = "/home/"
Output: "/home"
Explanation: Note that there is no trailing slash after the last directory name.

### Example 2:
Input: path = "/../"
Output: "/"
Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.

### Example 3:
Input: path = "/home//foo/"
Output: "/home/foo"
Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.

### Constraints:
1 <= path.length <= 3000
path consists of English letters, digits, period '.', slash '/' or '_'.
path is a valid absolute Unix path.
=end

# @param {String} path
# @return {String}
# @param {String} path
# @return {String}
def simplify_path(path)
  a = path.split("/")
  stack = []

  a.length.times do |i|
    next if a[i] == "." || a[i] == ""

    if a[i] == ".."
      stack.pop unless stack.empty?
    else
      stack << a[i]
    end
  end

  "/" + stack.join("/")
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_simplify_path < Test::Unit::TestCase
  def test_
    assert_equal "/home", simplify_path("/home/")
    assert_equal("/", simplify_path("/../"))
    assert_equal("/home/foo", simplify_path("/home//foo/"))
  end
end
