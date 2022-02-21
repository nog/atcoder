N, M = gets.split.map(&:to_i)
ab = {}
cd = {}
1.upto(N) do |i|
  ab[i] = {}
  cd[i] = {}
end
M.times do |i|
  a, b = gets.split.map(&:to_i)
  ab[a][b] = true
  ab[b][a] = true
end
M.times do |i|
  c, d = gets.split.map(&:to_i)
  cd[c][d] = true
  cd[d][c] = true 
end

(1..N).to_a.permutation(N).each do |ar|
  res = true
  1.upto(N) do |i|
    j = ar[i-1]
    ab[i].keys.each do |i_to|
      j_to = ar[i_to-1]
      unless cd[j][j_to]
        res = false
        break
      end
    end
    unless res
      break
    end
  end
  if res
    puts 'Yes'
    exit
  end
end

puts 'No'