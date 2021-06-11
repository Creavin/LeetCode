# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  return nums.size if target > nums.last
  @nums, @target = nums, target
  binary_search(0, nums.size-1)
end

def binary_search(start_index, end_index)
  return start_index if start_index == end_index

  mid_point = (end_index-start_index)/2 + start_index
  if @target == @nums[mid_point]
    mid_point
  elsif @target > @nums[mid_point]
    binary_search(mid_point+1, end_index)
  else
    binary_search(start_index, mid_point)
  end
end

puts search_insert([5,6,8,9], 7)
puts search_insert([1,3,5,6], 7)
