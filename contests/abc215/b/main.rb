N = gets.to_i

k = 0
while(2**(k+1) <= N) do
  k += 1
end

puts k