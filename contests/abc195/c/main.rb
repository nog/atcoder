N = gets.to_i

n = N

result = 0
x = 1000
while (n >= x) do
    result += n - x + 1
    x *= 1000
end

puts result