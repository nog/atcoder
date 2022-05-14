A, B, K = gets.split.map(&:to_i)

r = 0
a = A
while(a < B) do
  a *= K
  r += 1
end

puts r