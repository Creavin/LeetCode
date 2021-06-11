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

@stack
@prev_val
def is_valid_bst(root)
    @stack = []
    @prev_val = nil
    is_valid(root)
end

def is_valid(root)
  until @stack.empty? && root.nil?
    until root.nil?
      @stack << root
      root = root.left
    end
    root = @stack.pop
    if @prev_val
      return false unless root.val > @prev_val
    end
    @prev_val = root.val
    root = root.right
  end
  true
end

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

puts is_valid_bst(TreeNode.new 0)
