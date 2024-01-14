S = gets.chomp.split('')
len = S.length
# warn S.inspect
(len/2).times do |i|
  S[2*i], S[(2*i)+1] = S[(2*i)+1] , S[2*i]
  # warn S.inspect
end

puts S.join('')