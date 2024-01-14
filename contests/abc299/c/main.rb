N = gets.to_i
S = gets.chomp

list = S.split('-')
unless  S.include?('o')
  puts -1
  exit
end
unless S.include?('-')
  puts -1
  exit
end

res = 0
list.each do |l|
  res = l.size if l.size > res
end

puts res