T = gets.to_i

T.times do
  n = gets.to_i
  s = n.to_s(2)
  warn n.to_s(2)
  puts n.to_s(2).length - 1
end