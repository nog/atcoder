H, W = gets.split.map(&:to_i)
C = Array.new H
H.times do |i|
  C[i] =  gets.chomp.split('')
end

res = []
C.transpose.each do |line|
  res.push line.count('#')
end

puts res.join(' ')