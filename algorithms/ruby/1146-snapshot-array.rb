# frozen_string_literal: true

# https://leetcode.com/problems/snapshot-array/
# 1146. Snapshot Array
# Medium

=begin
Implement a SnapshotArray that supports the following interface:
* SnapshotArray(int length) initializes an array-like data structure with the given length. Initially, each element equals 0.
* void set(index, val) sets the element at the given index to be equal to val.
* int snap() takes a snapshot of the array and returns the snap_id: the total number of times we called snap() minus 1.
* int get(index, snap_id) returns the value at the given index, at the time we took the snapshot with the given snap_id

Example 1:
Input: ["SnapshotArray","set","snap","set","get"]
[[3],[0,5],[],[0,6],[0,0]]
Output: [null,null,0,null,5]
Explanation:
SnapshotArray snapshotArr = new SnapshotArray(3); // set the length to be 3
snapshotArr.set(0,5);  // Set array[0] = 5
snapshotArr.snap();  // Take a snapshot, return snap_id = 0
snapshotArr.set(0,6);
snapshotArr.get(0,0);  // Get the value of array[0] with snap_id = 0, return 5

Constraints:
* 1 <= length <= 5 * 104
* 0 <= index < length
* 0 <= val <= 109
* 0 <= snap_id < (the total number of times we call snap())
* At most 5 * 104 calls will be made to set, snap, and get.
=end

class SnapshotArray
=begin
  :type length: Integer
=end
  def initialize(length)
    @current_snapshot_id = 0
    @arr = Array.new(length) { [[-1, 0]] }
  end


=begin
  :type index: Integer
  :type val: Integer
  :rtype: Void
=end
  def set(index, val)
    @arr[index] << [@current_snapshot_id, val]
  end


=begin
  :rtype: Integer
=end
  def snap
    @current_snapshot_id += 1
    @current_snapshot_id - 1
  end


=begin
  :type index: Integer
  :type snap_id: Integer
  :rtype: Integer
=end
  def get(index, snap_id)
    snap_index = (@arr[index].bsearch_index { |saved_snapshot_id, _| saved_snapshot_id > snap_id } || @arr[index].size) - 1
    @arr[index][snap_index].last
  end
end

# Your SnapshotArray object will be instantiated and called as such:
# obj = SnapshotArray.new(length)
# obj.set(index, val)
# param_2 = obj.snap()
# param_3 = obj.get(index, snap_id)
