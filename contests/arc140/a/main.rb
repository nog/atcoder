N, K = gets.split.map(&:to_i)
S = gets.chomp

if N == K
  puts 1
  exit
end


1.upto(N) do |m|
  next if N % m > 0
  b = N / m
  cnt = 0
  m.times do |i|
    counts = {}
    b.times do |j|
      s = S[m*j+i]
      counts[s] ||= 0
      counts[s] += 1
    end
    max = counts.values.max
    cnt += b - max
    break if cnt > K
  end
  # warn "m:#{m} cnt:#{cnt}"
  if cnt <= K
    puts m
    exit
  end
end