N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

a = A.shift
b = B.shift
result_a = []
result_b = []
i = 1

while(a && b) do
  if a < b
    result_a.push(i)
    a = A.shift
  else
    result_b.push(i)
    b = B.shift
  end
  i += 1
end

while(a) do
  result_a.push(i)
  a = A.shift
  i += 1
end
while(b) do
  result_b.push(i)
  b = B.shift
  i += 1
end

puts result_a.join(' ')
puts result_b.join(' ')