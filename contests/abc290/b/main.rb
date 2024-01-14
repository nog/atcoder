N , K = gets.split.map(&:to_i)
S = gets.split('')
cnt = 0
N.times do |i|
  next if S[i] == 'x'
  if cnt < K
    cnt += 1
    next
  else
    S[i] = 'x'
  end
end

puts S.join('')