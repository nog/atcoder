S = gets.chomp.codepoints
T = gets.chomp.codepoints
s_size = S.size
t_size = T.size

dp = Array.new(S.size + 1) { Array.new(T.size + 1, 0) }

def max a,b
  a > b ? a : b
end

S.size.times do |s0|
  s1 = s0 + 1
  cdp = dp[s0]
  ndp = dp[s1]

  t_size.times do |t0|
    t1 = t0 + 1
    if S[s0] == T[t0]
      ndp[t1] = cdp[t0] + 1
    else
      ndp[t1] = max(ndp[t0], cdp[t1])
    end
  end
end

i = dp[S.size][T.size]
s = S.size
t = T.size
a = []

while i > 0
  if dp[s-1][t] == i
    s -= 1
  elsif dp[s][t-1] == i
    t -= 1
  else
    a.unshift(S[s - 1])
    i -= 1
    s -= 1
    t -= 1
  end
end

print a.pack('U*')