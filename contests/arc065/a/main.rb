s = gets.chomp
if match = s.match(/^(dream|dreamer|erase|eraser)+$/)
  puts "YES"
else
  puts "NO"
end