A, B, C = gets.split.map(&:to_i)

x = (B / C) * C

if x >= A && x <= B
  puts x
else
  puts -1
end