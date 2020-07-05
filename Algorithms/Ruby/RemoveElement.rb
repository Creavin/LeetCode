# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  return 0 if nums.nil?
  nums.delete_if { |n| n == val}
  nums.size
end
