N = gets.to_i 
A = gets.split.map(&:to_i).sort
B = gets.split.map(&:to_i).sort
C = gets.split.map(&:to_i).sort
result = 0
while(a = A.shift ) do
  while(b = B.shift) do 
    next if b <= a
    while(c = C.shift) do
      next if c <= b
      result += 1
      break
    end
    break
  end
end

puts result