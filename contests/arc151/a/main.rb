N = gets.to_i
S = gets.chomp.split('').map(&:to_i)
T = gets.chomp.split('').map(&:to_i)

result = Array.new(N)

counts = 0
N.times do |i|
  if S[i] == T[i]
    result[i] = 0
  else
    counts += 1
  end
end

if counts.odd?
  puts -1
  exit
end
# warn S.inspect
# warn T.inspect
zc = counts / 2
# warn result.inspect
# warn "zc:#{zc}"

sc = 0
tc = 0
N.times do |i|
  next if result[i]
  if sc == zc
    result[i] = S[i]
  elsif tc == zc
    result[i] = T[i]
  elsif S[i] == 0
    result[i] = 0
    tc += 1
  elsif sc < zc
    result[i] = 0
    sc += 1
  else
    result[i] = 1
  end

end

puts result.join('')