N = gets.to_i
X = gets.split.map(&:to_i).sort

N.times do
  X.pop
  X.shift
end

puts (X.sum.to_f) / (3*N)