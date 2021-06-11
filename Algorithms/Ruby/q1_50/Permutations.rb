# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  result = [[]]
  nums.each do |n|
    new_result = []
    result.each do |perm|
      new_result += stuff_perm(perm,n)
    end
    result = new_result
  end

  result
end

def stuff_perm(perm, n)
  result = []
  (0..perm.size).to_a.each do |index|
    result << perm.dup.insert(index, n)
  end
  result
end
