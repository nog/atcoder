N, K, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
L = gets.split.map(&:to_i)

Q.times do |q|
  l = L[q]
  a = A[l-1]
  next if a == N
  na = A[l]
  if na == a + 1
    next
  end
  A[l-1] = a + 1
end

puts A.join(' ')