n = gets.to_i
a = gets.split.map(&:to_i)
max = 10**18

if a.include? 0
  puts 0
  exit
end

result = 1
a.each do |x|
  result = result * x
  if result > max
    puts -1
    exit
  end
end

puts result