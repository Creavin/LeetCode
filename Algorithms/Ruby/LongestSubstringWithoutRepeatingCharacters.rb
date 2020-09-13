# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  char_mem = {}
  result = 0
  start_index = 0

  s.each_char.with_index do |char,i|
    unless char_mem[char].nil? || char_mem[char] < start_index
      result = [result, i-start_index].max
      start_index = char_mem[char]+1
    end
    char_mem[char] = i
  end
  result = [result, s.size-start_index].max
end
