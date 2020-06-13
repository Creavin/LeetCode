# @param {String[]} strs
# @return {String[][]}

def group_anagrams(strs)
  anagram_map = {}
  strs.each do |str|
    word_id = str.chars.sort.join
    unless anagram_map[word_id].nil?
        anagram_map[word_id] << str
    else
        anagram_map[word_id] = [str]
    end
  end
  anagram_map.values
end

puts group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
