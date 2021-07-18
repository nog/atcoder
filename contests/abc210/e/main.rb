N, M = gets.split.map(&:to_i)

AC = Array.new M
M.times do |i|
  AC[i] = gets.split.map(&:to_i)
end

sorted_ac = AC.sort_by{|ac| ac[1]}

if N % sorted_ac[0][0] != 0
  puts sorted_ac[0][1] * (N - 1)
  exit
end
result = sorted_ac[0] * N

x = sorted_ac[0]
1.upto(M-1) do |i|
end