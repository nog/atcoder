S = Array.new 10
10.times do |i|
  S[i] = gets.chomp.split('')
end

na = ['.'] * 10

a = 0
while S[a] == na
  a += 1
end

b = 9
while S[b] == na
  b -= 1
end

s2 = S.reverse.transpose

c = 0
while s2[c] == na
  c += 1
end

d = 9
while s2[d] == na
  d -= 1
end


puts "#{a +1} #{b + 1}"
puts "#{c +1} #{d + 1}"