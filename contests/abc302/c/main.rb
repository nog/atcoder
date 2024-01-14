N, M = gets.split.map(&:to_i)
S = []
N.times do
  S.push(gets.chomp)
end

S.permutation(N) do |s|
  res = true
  # warn s.inspect
  (N-1).times do |i|
    cnt = 1
    sb = s[i]
    sn = s[i+1]
    # warn sb
    M.times do |j|
      next if sb[j] == sn[j]
      if cnt > 0
        cnt -= 1
      else
        res = false
        # warn j
        break
      end
    end
  end
  if res
    # warn s.inspect
    puts 'Yes'
    exit
  end
end

puts 'No'