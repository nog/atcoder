N = gets.to_i
P = gets.split.map(&:to_i)

index = P.find_index(1)

if P[index-1] == N
  warn "a index:#{index}"
  puts [index, N-index+2].min
else
  warn "b"
  puts [index+2, N - index -1 +1].min
end