N = gets.to_i
A = gets.split.map(&:to_i)

dones = Array.new N

A.each.with_index do |a, i|
  next if dones[i]
  dones[a-1] = true
end

results = []
N.times do |i|
  next if dones[i]
  results.push i+1
end

puts results.size
puts results.join(' ')