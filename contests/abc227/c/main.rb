N = gets.to_i

result = 0

a = 1

while a.pow(3) <= N do
  b = a
  while a * b * b <= N do
    result += (N/ (a*b)) - b + 1
    b += 1
  end
  a += 1
end

puts result