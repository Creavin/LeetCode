# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  return nil if preorder.empty? || inorder.empty?

  cenre_val = preorder.shift
  center_node = TreeNode.new(cenre_val)

  inorder_center_val_index = inorder.index(cenre_val)

  center_node.left = build_tree(preorder,inorder[0...inorder_center_val_index])
  center_node.right = build_tree(preorder, inorder[inorder_center_val_index+1..-1])
  center_node
end
