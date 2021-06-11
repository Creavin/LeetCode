# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} nums
# @return {TreeNode}
#
def sorted_array_to_bst(nums)
  return nil if nums.nil?
  construct(nums, 0, nums.size-1 )
end

def construct(nums, start_index, end_index)
  return nil if start_index > end_index

  median_index = (start_index+end_index)/2
  new_node = TreeNode.new(nums[median_index])

  new_node.left = construct(nums,start_index, median_index-1)
  new_node.right = construct(nums, median_index+1, end_index)
  new_node
end

