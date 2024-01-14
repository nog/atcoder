T = gets.to_i 
T.times do
  n, k = gets.split.map(&:to_i)
  s = gets.chomp
  k = k % (2*n)
  d = [k, n].min
  sr = s.reverse

  ss = sr[0...d] + sr[-(k-d)..-1]
end