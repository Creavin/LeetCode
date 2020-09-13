# @param {String} s
# @return {Integer}
def roman_to_int(s)
   roman_int_map = {
     "I" => 1, "V" => 5, "X" =>10, "L" => 50, 
     "C" => 100, "D" => 500, "M" => 1000} 

   prev_value = 1000
   s.chars.inject(0) do |sum, char|
     value = roman_int_map[char]
     sum += value
     sum += prev_value < value ? -2*prev_value : 0
     prev_value = value
     sum
   end
end
