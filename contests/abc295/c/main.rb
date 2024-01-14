N = gets.to_i
A = gets.split.map(&:to_i)

r = 0
hash = {}
A.each do |a|
  if hash[a]
    hash.delete(a)
    r += 1
  else
    hash[a] = true
  end
end

puts r