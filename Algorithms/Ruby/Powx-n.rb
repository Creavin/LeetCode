# @param {Float} x
# @param {Integer} n
# @return {Float}

def my_pow(x, n)
  invert_result = n < 0 ? true : false
  power = n.abs
  result = my_power(x,power)   

  return invert_result ? (1/result) : result
end

def my_power(x,n)
  if n==0
    return 1
  elsif n==1
    return x
  else
    left_index = n/2
    lhs = my_power(x, left_index)
    return n.even? ? lhs*lhs : lhs * lhs * x
  end
end
