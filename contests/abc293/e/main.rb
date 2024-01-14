A, X, M = gets.split.map(&:to_i)
if A == 1
  puts X % M
  exit
end

if M == 1
  puts 0
  exit
end

def inv x
  x.pow(M-2, M)
end

def sum a, r, n, mod
  if n == 1
    return a % mod
  end
  x = sum(a, r, n/2, mod)
  ret = (x + r.pow(n/2, mod) * x) % mod
  if n & 1
    ret = (a + r * ret) % mod
  end
  ret
end

# puts (( A.pow(X, M) - 1) * inv(A - 1)) % M
puts (( A.pow(X, M*(A-1)) - 1) / (A - 1)) % M
# puts sum(1, A, X, M)