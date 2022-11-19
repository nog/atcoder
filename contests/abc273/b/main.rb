X, K = gets.split.map(&:to_i)

x = X
k = 1
K.times do |i|
  k *= 10
  d = x % k
  if d * 2 >= k
    x = (x / k + 1) * k
  else
    x = (x / k) * k
  end
  # warn "i:#{i} x:#{x}"
end

puts x