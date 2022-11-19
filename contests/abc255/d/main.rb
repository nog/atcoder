N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort
minsum = Array.new N
maxsum = Array.new N
mi = 0
ma = 0
MAX = 10**9
N.times do |i|
  a = A[i]
  ma += MAX - a
  maxsum[i] = ma

  a = A[-1-i]
  mi += a
  minsum[-1-i] = mi
end

# warn A.inspect

Q.times do |i|
  x = gets.to_i
  result = 0
  index = A.bsearch_index do |a|
    a > x
  end
  # warn "index:#{index}"
  ind = (index || N)
  if ind > 0
    sum = maxsum[ind-1]
    result += sum - ((MAX - x) * ind)
  end

  # warn "x:#{x} ind:#{ind} result:#{result}"

  if index
    sum = minsum[index]
    result += sum - (x * (N - index))
  end

  puts result
end