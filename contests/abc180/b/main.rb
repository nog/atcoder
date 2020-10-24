N = gets.to_i
x = gets.split.map(&:to_i)

man = 0
yu = 0
che = 0
N.times do |i|
    abs = x[i].abs
    man += abs
    yu += abs ** 2
    che = abs if che < abs
end
puts man
puts Math.sqrt(yu)
puts che

