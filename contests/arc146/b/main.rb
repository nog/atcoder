N, M, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
amax = A.max
max = nil
31.downto(0) do |i|
  border = 2**i
  next if (amax + M) < border
  # warn "i:#{i}"
  # warn A.map{|a| a[i] == 1 ? 0 : border - (a % border) }.inspect
  sum = A.map{|a| a[i] == 1 ? 0 : border - (a % border) }.sort[0...K].sum
  if sum <= M
    max = i
    break
  end
end

unless max
  puts 0
  exit
end

res = 0

alist = A.map{|a| [0, a]}
max.downto(0) do |i|
  # warn alist.inspect
  border = 2**i
  sum = alist.map{|c, a| a[i] == 1 ? c : c + border - (a % border) }.sort[0...K].sum
  next if sum > M
  res += border
  alist.each do |al|
    a = al[1]
    next if a[i] == 1
    d = border - (a % border)
    al[0] += d
    al[1] += d
  end
  next if alist.size == K
  break if alist.size < K
  alist.sort!
  sum = 0
  (K-1).times do |j|
    sum += alist[j][0]
  end
  b = M - sum
  break if b < 0
  del_line = nil
  K.upto(alist.size - 1) do |j|
    c = alist[j][0]
    if c > b
      del_line = j
      break
    end
  end
  if del_line
    alist = alist[0...del_line]
  end
  # warn alist.inspect
end
puts res