N = gets.to_i
PL = gets.split.map(&:to_i)

results = Array.new(N, 0)
PL.each.with_index do |x, i|
  results[(i-x+1)%N] += 1
  results[i-x] += 1
  results[(i-x-1)%N] += 1
  # warn "x:#{x} i:#{i}"
  # warn results.inspect
end
puts results.max