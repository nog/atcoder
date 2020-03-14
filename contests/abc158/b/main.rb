N, A, B = gets.split.map(&:to_i)

x = N / (A + B)
nokori = N % (A + B)
result = x * A
if nokori > A
  result += A
else
  result += nokori
end

puts result