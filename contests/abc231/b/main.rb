N = gets.to_i

counts = {}
N.times do |i|
  s = gets.chomp
  counts[s] ||= 0
  counts[s] += 1
end

res = nil
count = 0
counts.each do |k, v|
  next if count >= v
  res = k
  count = v
end

puts res