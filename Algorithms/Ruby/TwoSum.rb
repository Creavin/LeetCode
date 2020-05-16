# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def two_sum(nums, target)
  alt_num_index = {}
  nums.each_with_index do |num, index|
    if !alt_num_index[num].nil?       
      return [alt_num_index[num], index]
    end
    
    alt_num_index[target - num] = index
  end
end
