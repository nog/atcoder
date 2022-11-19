N, A, B = gets.split.map(&:to_i)

if N < A
  puts 0
  exit
end
if B >= A
  puts N - (A - 1)
  exit
end

x = N - (A - 1)
mod = x % A
mod = B if mod > B
r = ((x / A) * B) + mod
puts r