# @param {Integer} n
# @return {String}
def count_and_say(n)
  previous_val = '1'
  (n-1).times do 
    previous_val = count_and_tell(previous_val)
  end
  previous_val
end

def count_and_tell(previous_val)
  result = ""
  runs = split_into_runs(previous_val)
  runs.each do |run|
    result += run.length.to_s + run[0]
  end
  result
end

def split_into_runs(complete_str)
  runs = []
  complete_str.each_char do |c|
    if runs.empty?
      runs << c
    elsif runs[-1][0] == c
      runs[-1] << c
    else
      runs << c
    end
  end
  runs
end

puts count_and_say(3)
#puts split_into_runs("11122")

