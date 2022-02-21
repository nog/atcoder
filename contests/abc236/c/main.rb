N, M = gets.split.map(&:to_i)
S = gets.split
T = gets.split

j = 0
N.times do |i|
  s = S[i]
  if T[j] == s
    puts 'Yes'
    j += 1
  else
    puts 'No'
  end
end