N = gets.to_i
hash = {}
(N-1).times do |i|
  a, b = gets.split.map(&:to_i)
  hash[a] ||= 0
  hash[a] += 1
  hash[b] ||= 0
  hash[b] += 1
end

hash.keys.each do |k|
  if hash[k] == N-1
    puts 'Yes'
    exit
  end
end

puts 'No'