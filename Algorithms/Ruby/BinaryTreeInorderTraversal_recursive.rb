# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  result = []
  return result if root.nil?

  unless root.left.nil?
    result += inorder_traversal(root.left)
  end
  result << root.val

  unless root.right.nil?
    result += inorder_traversal(root.right)
  end
  result 
end
