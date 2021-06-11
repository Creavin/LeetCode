# @param {Integer} n
# @return {Integer}

@trees = {0 => 1}
def num_trees(n)
  result = @trees[n]
  return result unless result.nil?
  result = 0
  median = n/2
  (1..median).each do |i|
    result += 2 * calc_num_trees(i, n)
  end

  result = n.even? ? result : result + calc_num_trees(median+1, n)
  @trees[n] = result
  result
end

def calc_num_trees(masked_val, n)
  num_trees(masked_val - 1 ) * num_trees(n - masked_val)
end
