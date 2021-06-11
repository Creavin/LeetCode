# @param {Integer} x
# @return {Integer}
def reverse(x)
  is_negative = x < 0 ? true : false
  x_abs_str = (x).abs.to_s
  x_abs_str_reversed = x_abs_str.reverse
  result = Integer(x_abs_str_reversed, 10)
  if result > 2**31-1
    return 0
  end
  is_negative ? result*-1 : result
end
