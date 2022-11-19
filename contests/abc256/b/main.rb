N = gets.to_i 
A = gets.split.map(&:to_i)

i = 0
res = N
while a = A.pop do
  if a + i >= 4
    break
  else
    i += a
    res -= 1
  end
end

puts res