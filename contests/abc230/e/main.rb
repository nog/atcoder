N = gets.to_i
result = 0
i = N
while(i>0) do
  r = N / i
  ni = (N / (r + 1)) + 1
  result += r * (i - ni + 1)
  i = ni - 1
end

puts result