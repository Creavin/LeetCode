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
# @return {Boolean}

@prev_val
def is_valid_bst(root)
    @prev_val = nil
    is_valid(root)
end

def is_valid(root)
  return true unless root
  return false unless is_valid(root.left)
  if @prev_val
    return false if @prev_val >= root.val
  end
  @prev_val = root.val
  return is_valid(root.right)
end
