class MyLinkedList

=begin
    Initialize your data structure here.
=end
    def initialize()
      @tail = Node.new(nil, @head, nil)
      @head = Node.new(@tail,nil, nil)
      @size = 0
    end


=begin
    Get the value of the index-th node in the linked list. If the index is invalid, return -1.
    :type index: Integer
    :rtype: Integer
=end
    def get(index)
      return -1 if index >= @size

      current_node = @head
      current_index = -1
      until current_node == @tail || current_index == index 
        current_node = current_node.next
        current_index += 1
      end
      current_index == index ? current_node.val : -1
    end


=begin
    Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_head(val)
      old_first_node = @head.next
      @head.next = Node.new(old_first_node, @head, val)
      old_first_node.prev = @head.next
      @size += 1
    end


=begin
    Append a node of value val to the last element of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_tail(val)
      old_last_node = @tail.prev
      old_last_node.next = Node.new(@tail, old_last_node, val)
      @tail.prev = old_last_node.next
      @size += 1
    end


=begin
    Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def add_at_index(index, val)
      return if index > @size
      if index == 0
        add_at_head(val)
      else
        before_index = get_node(index - 1)
        old_node = before_index.next
        before_index.next = Node.new(old_node, before_index, val)
        old_node.prev = before_index.next
        @size += 1
      end
    end


=begin
    Delete the index-th node in the linked list, if the index is valid.
    :type index: Integer
    :rtype: Void
=end
    def delete_at_index(index)
      return if index >= @size
      before_index = get_node(index - 1)
      after_index = before_index.next.next

      before_index.next = after_index
      after_index.prev = before_index
      @size -= 1
    end

    def get_node(index)
      return -1 if index >= @size
      current_node = @head
      current_index = -1
      until current_node == @tail || current_index == index 
        current_node = current_node.next
        current_index += 1
      end
      current_index == index ? current_node : nil
    end

    def to_s
      str = ""
      current_node = @head
      until current_node == @tail 
        current_node = current_node.next
        str += current_node.to_s
      end
      str
    end


end

class Node
  attr_accessor :next, :prev, :val

  def initialize(next_node=nil, prev_node=nil, val=nil)
    @next, @prev, @val = next_node, prev_node, val
  end

  def to_s
    "[#{@next}, #{@prev}, #{@val}]"
  end

end

puts Node.new(0,0)
obj = MyLinkedList.new()
pp obj.get(0)
obj.add_at_head(1)
obj.add_at_tail(3)
obj.add_at_index(1, 2)
obj.add_at_index(0, -1)
obj.add_at_index(4, 4)
pp obj
obj.delete_at_index(4)
pp obj

# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList.new()
# param_1 = obj.get(index)
# obj.add_at_head(val)
# obj.add_at_tail(val)
# obj.add_at_index(index, val)
# obj.delete_at_index(index)
