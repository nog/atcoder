S = gets.chomp.split('')

a = "A".ord
result = 0

base = 1

while(s = S.pop) do
  d = s.ord - a + 1
  result = result + (d * base)
  base *= 26
end

puts result