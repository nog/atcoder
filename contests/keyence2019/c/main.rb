N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

husoku = 0
overpoints = []
result = 0

N.times do |i|
  if A[i] > B[i]
    overpoints.push(A[i] - B[i])
  elsif A[i] < B[i]
    husoku += B[i] - A[i]
    result += 1
  end
end

overpoints = overpoints.sort

while husoku > 0 do
  point = overpoints.pop
  unless point 
    puts -1
    exit
  end
  husoku -= point
  result += 1
end

puts result