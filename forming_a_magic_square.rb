# Read in the input (pre supplied)
def read_array()
  s = Array.new(3)
  for s_i in (0..3-1)
      s_t = gets.strip
      s[s_i] = s_t.split(' ').map(&:to_i)
  end
  s
end

# Compute the distance between two matrices
def compute_distance(s,t)
  distance = 0
  for i in (0...3)
    for j in (0...3)
      distance += (s[i][j] - t[i][j]).abs
    end
  end
  distance
end

# Determine if a matrix of 1 through 9 is magic
def is_magic?(s)
  check = s[0][0] + s[0][1] + s[0][2]
  return false if s[1][0] + s[1][1] + s[1][2] != check
  return false if s[2][0] + s[2][1] + s[2][2] != check
  return false if s[0][0] + s[1][0] + s[2][0] != check
  return false if s[0][0] + s[1][0] + s[2][0] != check
  return false if s[0][1] + s[1][1] + s[2][1] != check
  return false if s[0][2] + s[1][2] + s[2][2] != check
  return false if s[0][0] + s[1][1] + s[2][2] != check
  return false if s[0][2] + s[1][1] + s[2][0] != check
  true
end

# Generate an array of all magic squares
def generate_all_magic_squares
  all = []
  digits = [1,2,3,4,5,6,7,8,9]
  permutations = digits.permutation.to_a
  permutations.each do |p|
    a = [[p[0],p[1],p[2]],[p[3],p[4],p[5]],[p[6],p[7],p[8]]]
    all << a if is_magic?(a)
  end
  all
end

# Generate all the magic squares
list = generate_all_magic_squares()

# Read in the input array
inmatrix = read_array()

# Now find the minimum distance between the input and a magic square
min = nil
list.each do |l|
  distance = compute_distance(inmatrix,l)
  if min == nil or min > distance
    min = distance
  end
end

# Print it out
puts min

  
  


