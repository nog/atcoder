N, W = gets.split.map(&:to_i)
AB = Array.new N
N.times do |i|
  AB[i] = gets.split.map(&:to_i)
end

sorted = AB.sort_by{|ab| ab[0] }.reverse

w = W
result = 0

sorted.each do |a, b|
  if w > b
    result += a * b
    w -= b
  else
    result += a * w
    break
  end
end

puts result