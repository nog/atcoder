N , K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
OA = A.dup

n = N
base = 0
res = 0
sorted = A.sort
min = 0

while(sorted[0] == 0)
  sorted.shift
  n -= 1
end
# warn sorted.inspect

while(true) do
  min = sorted.shift
  nn = n - 1
  while(sorted[0] == min)
    sorted.shift
    nn -= 1
  end

  diff = n * (min - base)
  # warn "min:#{min} base:#{base} diff:#{diff} n:#{n}"
  if diff + res >= K
    k = K - res
    base += (k / n)
    k = k % n
    # warn "base:#{base}"
    result = OA.map do |a|
      a -= base
      a = 0 if a < 0
      if k > 0 && a > 0
        a -= 1
        k -= 1
      end
      a
    end
    # warn "AAA"
    # warn result.inspect
    puts result.join(' ')
    exit
  end
  base = min
  res += diff
  n = nn
end
