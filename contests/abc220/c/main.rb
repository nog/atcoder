N = gets.to_i
A = gets.split.map(&:to_i)
X = gets.to_i

sum = A.sum
result = (X / sum) * N
x = X % sum

while x >= 0 do
  result += 1
  x -= A.shift
end

puts result