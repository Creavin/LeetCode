# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.nil? || nums.empty?
  distinct_nums = 0
  prev_val = nums[0]-1
  nums.each_with_index do |n, i|
    if prev_val < n
      current_val = nums[i]
      unless i == distinct_nums
        temp = nums[distinct_nums]
        nums[distinct_nums] = current_val
        nums[i] = temp
      end
      distinct_nums += 1
      prev_val = current_val
    end
  end
  distinct_nums
end

