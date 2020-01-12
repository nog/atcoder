N, K, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
sum = 0
A.each {|x| sum+=x}
ten =  N*M - sum
if ten <= 0
  puts 0
  exit
end

if ten > K
  puts -1
  exit
end

puts ten