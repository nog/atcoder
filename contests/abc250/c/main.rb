N, Q = gets.split.map(&:to_i)
num_to_pos = Array.new(N){|i| i }
list = Array.new(N){|i| i }

# warn "list:#{list.inspect} num_to_pos:#{num_to_pos.inspect}"

Q.times do
  x = gets.to_i - 1
  from_num = x
  from_pos = num_to_pos[x]
  to_pos = (from_pos != N - 1) ? (from_pos + 1) : from_pos - 1
  to_num = list[to_pos]

  list[from_pos], list[to_pos] = to_num, from_num
  num_to_pos[from_num] = to_pos
  num_to_pos[to_num] = from_pos
  # warn "x:#{x} list:#{list.inspect} num_to_pos:#{num_to_pos.inspect}"
end

puts list.map{|i| i + 1 }.join(' ')