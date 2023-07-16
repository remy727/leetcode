# frozen_string_literal: true

# 1125. Smallest Sufficient Team
# Hard
# https://leetcode.com/problems/smallest-sufficient-team

=begin
In a project, you have a list of required skills req_skills, and a list of people. The ith person people[i] contains a list of skills that the person has.
Consider a sufficient team: a set of people such that for every required skill in req_skills, there is at least one person in the team who has that skill. We can represent these teams by the index of each person.
* For example, team = [0, 1, 3] represents the people with skills people[0], people[1], and people[3].
Return any sufficient team of the smallest possible size, represented by the index of each person. You may return the answer in any order.
It is guaranteed an answer exists.

Example 1:
Input: req_skills = ["java","nodejs","reactjs"], people = [["java"],["nodejs"],["nodejs","reactjs"]]
Output: [0,2]

Example 2:
Input: req_skills = ["algorithms","math","java","reactjs","csharp","aws"], people = [["algorithms","math","java"],["algorithms","math","reactjs"],["java","csharp","aws"],["reactjs","csharp"],["csharp","math"],["aws","java"]]
Output: [1,2]

Constraints:
* 1 <= req_skills.length <= 16
* 1 <= req_skills[i].length <= 16
* req_skills[i] consists of lowercase English letters.
* All the strings of req_skills are unique.
* 1 <= people.length <= 60
* 0 <= people[i].length <= 16
* 1 <= people[i][j].length <= 16
* people[i][j] consists of lowercase English letters.
* All the strings of people[i] are unique.
* Every skill in people[i] is a skill in req_skills.
* It is guaranteed a sufficient team exists.
=end

# @param {String[]} req_skills
# @param {String[][]} people
# @return {Integer[]}
def smallest_sufficient_team(req_skills, people)
  n = req_skills.size
  skill_map, dp = {}, Array.new(1 << n, [n + 1])

  req_skills.each_with_index { |rs, idx| skill_map[rs] = idx }

  people = people.map { |p| p.inject(0) { |acc, skill| acc | (1 << skill_map[skill]) } }

  dp[0] = [0, []]

  people.each_with_index do |skills, p|
    ((1 << req_skills.length) - 1).downto(0) do |i|
      nex = i | skills
      if dp[nex][0] > dp[i][0] + 1
        dp[nex] = [dp[i][0] + 1, dp[i][1] + [p]]
      end
    end
  end

  dp[(1 << req_skills.size) - 1][1]
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_smallest_sufficient_team < Test::Unit::TestCase
  def test_
    assert_equal [0, 2], smallest_sufficient_team(["java", "nodejs", "reactjs"], [["java"], ["nodejs"], ["nodejs", "reactjs"]])
    assert_equal [1, 2], smallest_sufficient_team(["algorithms", "math", "java", "reactjs", "csharp", "aws"], [["algorithms", "math", "java"], ["algorithms", "math", "reactjs"], ["java", "csharp", "aws"], ["reactjs", "csharp"], ["csharp", "math"], ["aws", "java"]])
  end
end
