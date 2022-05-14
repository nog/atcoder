N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

mens = {}
A.each do |a|
  mens[a] ||= 0
  mens[a] += 1
end

def die
  puts 'No'
  exit
end

B.each do |b|
  die unless mens[b]
  die if mens[b] == 0
  mens[b] -= 1
end

puts 'Yes'