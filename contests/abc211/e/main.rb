N = gets.to_i
K = gets.to_i
S = Array.new
N.times do |i|
  S.push(*gets.chomp.split('').map{|c| c == '#' })
end

result = 0

def count i, k, _s
  s = _s.dup
  r = 0
  if k == 0
    return 1
  end
  if i%N != N-1 && s[i+1] == false
    s[i+1] = true
    if k == 1
      r += 1
    else
      r += count(i, k-1, s)
      r += count(i+1, k-1, s)
    end
  end
  if i%N != 0 && s[i-1] == false
    s[i-1] = true
    if k == 1
      r += 1
    else
      r += count(i, k-1, s)
      r += count(i-1, k-1, s)
    end
  end
  if i/N != N-1 && s[i+N] == false
    s[i+N] = true
    if k == 1
      r += 1
    else
      r += count(i, k-1, s)
      r += count(i+N, k-1, s)
    end
  end
  if i/N != 0 && s[i-N] == false
    s[i-N] = true
    if k == 1
      r += 1
    else
      r += count(i, k-1, s)
      r += count(i-N, k-1, s)
    end
  end
  return r
end

warn S.inspect
N.times do |h|
  N.times do |w|
    i = h*N+w
    next if S[i]
    S[i] = true
    warn "i:#{i} c:#{count(i, K-1, S)}"
    result += count(i, K-1, S)
  end
end
warn S.inspect
puts result