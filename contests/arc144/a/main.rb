N = gets.to_i
M = 2 * N
n = N
xlist = []

while(n>0) do 
  if n >= 4
    xlist.push(4)
    n -= 4
  else
    xlist.push(n)
    break
  end
end

puts M
puts xlist.reverse.join('')