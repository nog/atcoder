N, X = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

result = 1
hash = {
  X => true
}

cur = X
while !hash[A[cur -1]] do
  result += 1
  cur = A[cur - 1]
  hash[cur] = true
end

puts result