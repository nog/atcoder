N, K = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

sorted_a = a.sort

base = K / N
nokori = K % N

hash = Hash.new(0)

nokori.times do |i|
  hash[sorted_a[i]] = 1
end


N.times do |i|
  r = base + hash[a[i]]
  puts r
end