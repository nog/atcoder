n, k = gets.split.map(&:to_i)
MOD = 10**9 + 7
result = 0
(n+1).downto(k) do |i|
  if n + 1 == i
    result += 1
    next
  end
  if n == i
    result += n + 1
    next
  end

  max = i * (n + n - i + 1) / 2
  min = i * (i - 1) / 2
  result += (max - min + 1)
end

puts result % MOD