N,M,D = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort
B = gets.split.map(&:to_i).sort
r = -1
a = A.pop
b = B.pop

while(true) do
  if (a-b).abs <= D
    puts  a + b
    exit
  end

  if a > b
    a = A.pop
  else
    b = B.pop
  end
  break unless a && b
end

puts -1