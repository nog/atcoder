N, Q = gets.split.map(&:to_i)

stats = Array.new(N+1){ 0 }
Q.times do
  c, x = gets.split.map(&:to_i)
  if c == 1
    stats[x] += 1
  elsif c == 2
    stats[x] += 2
  elsif c == 3
    puts stats[x] >= 2 ? 'Yes' : 'No'
  else
    raise
  end
end