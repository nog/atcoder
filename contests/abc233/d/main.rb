N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

sumA = Array.new N+1
sumA[0] = 0
hash = {
  0 => 1
}
result = 0
N.times do |i|
  s = sumA[i] + A[i]
  sumA[i+1] = s
  d = s - K
  if hash[d]
    result += hash[d]
  end
  hash[s] ||= 0
  hash[s] += 1
end
# warn A.inspect
# warn sumA.inspect

puts result