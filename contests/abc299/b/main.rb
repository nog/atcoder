N, T = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)
R = gets.split.map(&:to_i)

color = T
unless C.include?(T)
  color = C[0]
end

res = 0
max = 0
N.times do |i|
  if C[i] == color
    if R[i] > max
      max = R[i]
      res = i+1
    end
  end
end

puts res