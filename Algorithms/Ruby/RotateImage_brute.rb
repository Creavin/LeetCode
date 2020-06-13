# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
# Better solution: swap along 45 def and flip
def rotate(matrix)
  start_index = 0 
  end_index = matrix.length-1

  while start_index < end_index
    top = matrix[start_index][start_index .. end_index]
    bottom = matrix[end_index][start_index .. end_index]

    left, right = [], []
    matrix[start_index .. end_index].each do |row| 
      left.unshift row[start_index]
      right.unshift row[end_index]
      row[start_index] = bottom.shift
      row[end_index] = top.shift
    end
    
    matrix[start_index][start_index..end_index] = left
    matrix[end_index][start_index .. end_index] = right

    start_index += 1
    end_index -= 1
  end
end
