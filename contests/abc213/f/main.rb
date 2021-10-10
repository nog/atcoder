N = gets.to_i
S = gets.chomp.split('')

points = {}
N.times do |i|
  s = S[i]
  points[s] ||= []
  points[s].push(i)
end
result = Array.new(N)
s = S[-1]
list = points[s]
result[-1] = list.size

(N-1).times do |i|
  po = N - 2 - i
  s = S[po]
end