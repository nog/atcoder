N, M = gets.split.map(&:to_i)

A = Array.new N
B = Array.new N
N.times do |i|
  A[i], B[i] = gets.split.map(&:to_i)
end

sum = A.sum

results = {}
results[sum] = 0

N.times do |i|
  d = B[i] - A[i]

  keys = results.keys
  keys.each do |k|
    ne = d + k
    cr = results[ne] || N+1
    nr = results[k] + 1
    results[ne] = nr if nr < cr
  end
end

(M+1).times do |i|
  puts results[i] ? results[i] : -1
end