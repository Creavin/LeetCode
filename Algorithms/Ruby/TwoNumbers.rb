# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  result = []
  carry = 0
  until l1.nil? || l2.nil?
    sum = l1.val + l2.val + carry
    sum > 9 ? carry = 1 : carry = 0

    result << sum % 10
    l1 = l1.next
    l2 = l2.next
  end

  [l1, l2].each do |list|
    until list.nil?
      sum = list.val + carry
      sum > 9 ? carry = 1 : carry = 0

      result << sum % 10
      list = list.next
    end
  end
  if carry > 0
    result << 1
  end
  result
end

