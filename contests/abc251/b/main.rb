N, W = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort!
hash = {}
result = 0

1.upto(3) do |n|
  A.combination(n).each do |a|
    r = a.sum
    next if hash[r]
    hash[r] = true
    result += 1 if r <= W
  end
end

puts result