# 11 Jun 2021; 97% faster & uses 38% less memory
# @param {String} s
# @return {String}
def longest_palindrome(s)
  mid_index = (s.size-1)/2
  parity_offset = s.size.even? ? 1 : 0

  longest_palindrome_length = 0
  longest_palindrome = ''
  radius = 0
  max_radius = mid_index

  while radius <= max_radius && longest_palindrome_length < max_palindrome_length(radius, max_radius)
    substrings = sym_substrings(s, mid_index - radius) + sym_substrings(s, mid_index + radius + parity_offset)
    substrings.each do |substring|
      new_length = get_palindromic_size(substring)
      if new_length > longest_palindrome_length
        longest_palindrome_length = new_length
        longest_palindrome = get_palindrome(substring, new_length)
      end
    end
    radius += 1
  end

  longest_palindrome
end

# longest palindrome that could be made
def max_palindrome_length(radius, max_radius)
  2*(max_radius - radius) + 2
end

def get_palindrome(s, size)
  mid_index = (s.size-1)/2
  parity_offset = size.even? ? 1 : 0
  radius = (size - 1 - parity_offset)/2
  s[mid_index - radius .. mid_index + radius + parity_offset]
end

def sym_substrings(s, kernel)
  max_radius = [kernel, s.size-1 - kernel].min
  odd_substring = s[kernel-max_radius .. kernel + max_radius]

  max_radius = [kernel, s.size - kernel].min
  even_substring = s[kernel-max_radius .. kernel + 1 + max_radius]

  [odd_substring, even_substring]
end


def get_palindromic_size(string)
  kernel_size = get_palindrome_kernel_size(string)
  return 1 if kernel_size == 1 && string.size.even?  # there kernel chars don't match so max length is 1
  radius = get_palindromic_radius(string)
  2*radius + kernel_size
end

def get_palindrome_kernel_size(string)
  return 1 if string.size.odd?
  valid_palindromic_layer?(string, 0) ? 2 : 1
end

def get_palindromic_radius(string)
  mid_index = (string.size-1)/2
  radius = 0
  max_radius = mid_index

  until (radius == max_radius) || !valid_palindromic_layer?(string, radius+1)
    radius += 1
  end

  radius
end

def valid_palindromic_layer?(string, radius)
  mid_index = (string.size - 1)/2
  is_even_palindrome = (string.size % 2 == 0)
  low_layer_index = mid_index - radius
  high_layer_index = if is_even_palindrome
                       mid_index + 1 + radius
                     else
                       mid_index + radius
                     end
  string[low_layer_index] == string[high_layer_index]
end

#pp get_palindromic_size("x")
#pp get_palindromic_size("xa")
#pp get_palindromic_size("xab")
#pp get_palindromic_size("xaab")
#pp get_palindromic_size("xbabc")

#pp sym_substrings("abba", 1)
#
pp get_palindromic_size("aaaabaaa")
pp longest_palindrome("aaaabaaa")