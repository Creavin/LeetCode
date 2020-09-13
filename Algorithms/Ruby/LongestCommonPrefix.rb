# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty?

  matching = true
  run_length = -1
  min_str = strs.min

  min_str.chars.each_with_index do |char, i|
    strs.each do |str|
      matching &= char == str[i]
    end
    break if !matching
    run_length +=1
  end

  return run_length < 0 ? "" : min_str[0..run_length]
end
