N = gets.to_i

if N >= 16
  puts N.to_s(16).upcase
else
  puts "0" + N.to_s(16).upcase
end