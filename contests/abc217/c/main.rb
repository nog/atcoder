N = gets.to_i
P = gets.split.map(&:to_i)

q = Array.new N
P.each.with_index do |_p, i|
  q[_p - 1] = i + 1
end

puts q.join(' ')