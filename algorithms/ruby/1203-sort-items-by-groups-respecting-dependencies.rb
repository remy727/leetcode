# frozen_string_literal: true

# 1203. Sort Items by Groups Respecting Dependencies
# Hard
# https://leetcode.com/problems/sort-items-by-groups-respecting-dependencies

=begin
There are n items each belonging to zero or one of m groups where group[i] is the group that the i-th item belongs to and it's equal to -1 if the i-th item belongs to no group. The items and the groups are zero indexed. A group can have no item belonging to it.
Return a sorted list of the items such that:
The items that belong to the same group are next to each other in the sorted list.
There are some relations between these items where beforeItems[i] is a list containing all the items that should come before the i-th item in the sorted array (to the left of the i-th item).
Return any solution if there is more than one solution and return an empty list if there is no solution.

Example 1:
Input: n = 8, m = 2, group = [-1,-1,1,0,0,1,0,-1], beforeItems = [[],[6],[5],[6],[3,6],[],[],[]]
Output: [6,3,4,1,5,2,0,7]

Example 2:
Input: n = 8, m = 2, group = [-1,-1,1,0,0,1,0,-1], beforeItems = [[],[6],[5],[6],[3],[],[4],[]]
Output: []
Explanation: This is the same as example 1 except that 4 needs to be before 6 in the sorted list.

Constraints:
* 1 <= m <= n <= 3 * 104
* group.length == beforeItems.length == n
* -1 <= group[i] <= m - 1
* 0 <= beforeItems[i].length <= n - 1
* 0 <= beforeItems[i][j] <= n - 1
* i != beforeItems[i][j]
* beforeItems[i] does not contain duplicates elements.
=end

# @param {Integer} n
# @param {Integer} m
# @param {Integer[]} group
# @param {Integer[][]} before_items
# @return {Integer[]}
def sort_items(n, m, group, before_items)
  @before_items = before_items
  @items_of_groups, @items_group = define_groups_for_minus_ones(m, group)

  @checked_group = {}
  @checked_item = {}
  @result = []

  @items_of_groups.each_with_index do |subgroup, index|
    next if @checked_group[index]
    @checking_group = Set.new
    return [] unless check_subgroup(subgroup, index)
  end

  rearrange_result
end

def rearrange_result
  @result.reverse.group_by { |item| @items_group[item] }.values.reverse.flat_map(&:reverse)
end

def define_groups_for_minus_ones(m, group)
  items_of_groups = []

  group_id = m
  items_group = group.map!.with_index do |item_group, item|
            if item_group == -1
              (items_of_groups[group_id] ||= []) << item
              group_id += 1
              group_id - 1
            else
              (items_of_groups[item_group] ||= []) << item
              item_group
            end
          end

  items_of_groups.map! { |main_group| main_group ? main_group.to_set : Set.new }

  [items_of_groups, items_group]
end

def check_subgroup(subgroup, group_index)
  return true if @checked_group[group_index]

  return false if @checking_group.include? group_index
  @checking_group << group_index

  subgroup.each do |item|
    checking_items = Set.new
    return false unless check_item(item, group_index, checking_items)
  end
  @checking_group.delete(group_index)

  @checked_group[group_index] = true
end

def check_item(item, group_index, checking_items)
  return false if checking_items.include? item
  checking_items << item

  return true if @checked_item[item]

  @before_items[item].each do |next_item|
    next_group_index = @items_group[next_item]

    if next_group_index == group_index
      return false unless check_item(next_item, group_index, checking_items)
    else
      return false unless check_subgroup(@items_of_groups[next_group_index], next_group_index)
    end
  end
  @result << item

  @checked_item[item] = true
end

# **************** #
#       TEST       #
# **************** #

require "test/unit"
class Test_sort_items < Test::Unit::TestCase
  def test_
    assert_equal [6, 3, 4, 1, 5, 2, 0, 7].sort, sort_items(8, 2,  [-1, -1, 1, 0, 0, 1, 0, -1], [[], [6], [5], [6], [3, 6], [], [], []]).sort
    assert_equal [], sort_items(8, 2,   [-1, -1, 1, 0, 0, 1, 0, -1], [[], [6], [5], [6], [3], [], [4], []])
  end
end
