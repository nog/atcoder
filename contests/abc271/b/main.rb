N, Q = gets.split.map(&:to_i)
L = Array.new N
N.times do |i|
  L[i] = gets.split.map(&:to_i)
end

Q.times do
  s, t = gets.split.map(&:to_i)
  puts L[s-1][t]
end