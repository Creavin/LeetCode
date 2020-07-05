# @param {String} s
# @return {Boolean}
def is_valid(s)
  if s.length % 2 != 0
    return false
  end

  closing_bracket = { '{' => '}', '[' => ']', '(' => ')'}
  stack = []
  valid = true
  s.each_char do |c|
    break unless valid
    if closing_bracket[c].nil? # implies c is closing bracket
      valid &= (closing_bracket[stack.pop] == c)
    else
      stack << c
    end
  end
  stack.empty? && valid
end

