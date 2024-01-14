N = gets.chomp
if N.length <= 3
  puts N
  exit
end
res = N[0..2] + ("0" * (N.length - 3))
puts res