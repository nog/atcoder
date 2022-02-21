S = gets.chomp.split('')
T = gets.chomp.split('')

s = S.map{|a| a.ord - 97 }
t = T.map{|a| a.ord - 97 }

len = s.length

d = (s[0] -  t[0]) % 26

# warn s.inspect
# warn t.inspect

len.times do |i|
  _d = (s[i] - t[i]) % 26
  if _d != d
    # warn "i:#{i} _d:#{_d}"
    puts 'No'
    exit
  end
end

puts 'Yes'