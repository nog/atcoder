V, A, B, C = gets.split.map(&:to_i)

v = V % (A + B+ C )

v -= A
if v < 0
  puts 'F'
  exit
end

v -= B

if v < 0
  puts 'M'
  exit
end

puts 'T'