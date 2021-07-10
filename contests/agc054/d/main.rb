S = gets.chomp.split('')


S.length
cur = S.dup
while(cur[0] == 'o') do
  cur.shift
end
while(cur[-1] == 'o') do
  cur.pop
end

len.times do |i|
  s = S[i]
end