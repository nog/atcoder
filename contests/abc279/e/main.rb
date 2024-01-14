N, M= gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

right_map = Array.new(N){|i| i }
1.upto(M-1) do |i|
  a = A[i] - 1
  right_map[a], right_map[a+1] = right_map[a+1], right_map[a]
end
right_rev = Array.new(N)
N.times do |i|
  right_rev[right_map[i]] = i
end
zero_pos = 0
(M-1).times do |i|
  # warn "i:#{i} zero_pos:#{zero_pos}"
  # warn right_map.inspect
  # warn right_rev.inspect
  puts right_rev[zero_pos] + 1
  a = A[i] - 1
  if zero_pos == a
    zero_pos += 1
  elsif zero_pos - 1 == a
    zero_pos -= 1
  end

  b = A[i+1] - 1
  b1 = right_rev[b]
  b2 = right_rev[b+1]
  right_map[b1], right_map[b2] = right_map[b2], right_map[b1]
  right_rev[b], right_rev[b+1] = b2, b1 
end
  # warn "last zero_pos:#{zero_pos}"
puts right_rev[zero_pos] + 1