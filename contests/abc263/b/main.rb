N = gets.to_i
PL = gets.split.map(&:to_i)

result = 0
x = N - 1
while(x != 0) do
  x = PL[x-1] - 1
  result += 1
end

puts result