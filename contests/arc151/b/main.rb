N, M = gets.split.map(&:to_i)
P = gets.split.map(&:to_i)
MOD = 998244353

result = 0
done = {}
cnt = N
N.times do |i|
  _p = P[i] - 1
  d = nil
  if _p == i
    cnt -= 1
    next
  elsif _p < i && cnt > 1
    d = M.pow(cnt - 1, MOD) % MOD
    result = result + d % MOD
  elsif _p > i && cnt > 1
    cnt -= 2
    cnt = 0 if cnt < 0
    d = ((M-1) * (M) / 2) * M.pow(cnt, MOD) % MOD
    result = result + d % MOD
  end
  warn "i:#{i} d:#{d} cnt:#{cnt}"
  done[_p] = true
end

puts result % MOD