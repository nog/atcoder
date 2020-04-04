n, m = gets.split.map(&:to_i)
result = 0
if n > 1
  result += n * (n -1) / 2
end

if m > 1
  result += m * ( m -1 ) / 2
end

puts result