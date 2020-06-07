# @param {Integer} num
# @return {String}
def int_to_roman(num)
  result = ''
  roman_map = {
    1.0 => "I", 5.0 => "V", 10.0 => "X" , 50.0 => "L", 
    100.0 =>"C",  500.0 => "D", 1000.0 => "M" } 
  divisor = 1000.0

  prev_str_size = result.size
  while divisor > 1
    case 
    when num >= divisor
      num -= divisor
      result << roman_map[divisor]
    when num >= divisor*0.9
      num -= divisor*0.9
      result << roman_map[divisor*0.1] + roman_map[divisor]
    when num >= divisor*0.5
      num -= divisor*0.5
      result << roman_map[divisor*0.5]
    when num >= divisor*0.4
      num -= divisor*0.4
      result << roman_map[divisor*0.1] + roman_map[divisor*0.5]
    when num >= divisor*0.1
      num -= divisor*0.1
      result << roman_map[divisor*0.1]
    end
    if prev_str_size == result.size
      divisor /= 10
    else
     prev_str_size = result.size
    end
  end
  result
end

puts int_to_roman(8)


#puts int_to_roman(1000)
#puts int_to_roman(100)
#puts int_to_roman(90)
#puts int_to_roman(4)
#puts int_to_roman(3)
