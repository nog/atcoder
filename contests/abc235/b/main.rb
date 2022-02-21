N = gets.to_i
H = gets.split.map(&:to_i)

pos = 0

while(pos < N - 1 && H[pos] < H[pos+1]) do
  pos += 1
end

puts H[pos]