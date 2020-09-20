class MyStack

=begin
    Initialize your data structure here.
=end
    def initialize()
      @main_queue = []
      @tmp_queue = []
    end


=begin
    Push element x onto stack.
    :type x: Integer
    :rtype: Void
=end
    def push(x)
       @main_queue << x
    end

    def transfer_until_last_elem(source, destination)
      until source.size <= 1
        destination << source.shift
      end
    end


=begin
    Removes the element on top of the stack and returns that element.
    :rtype: Integer
=end
    def pop()
      transfer_until_last_elem(@main_queue, @tmp_queue)
      result = @main_queue.shift

      @main_queue = @tmp_queue
      @tmp_queue = []
      
      result
    end


=begin
    Get the top element.
    :rtype: Integer
=end
    def top()
      return nil if @main_queue.empty?
      transfer_until_last_elem(@main_queue, @tmp_queue)
      result = @main_queue.shift

      @main_queue = @tmp_queue
      @tmp_queue = []

      @main_queue << result
      result
    end


=begin
    Returns whether the stack is empty.
    :rtype: Boolean
=end
    def empty()
      @main_queue.empty? && @tmp_queue.empty?
    end
end

# Your MyStack object will be instantiated and called as such:
obj = MyStack.new()
