a, b, k = gets.chomp.split(' ').map(&:to_i)

if a + b <= k
  puts "0 0"
  exit
end

if a >= k 
  puts "#{a - k} #{b}"
  exit
end

puts "0 #{b - (k-a)}"