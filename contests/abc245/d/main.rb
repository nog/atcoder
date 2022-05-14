N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)

result = []
M.downto(0) do |m|
  # warn C.inspect
  c = C[N+m]
  # warn "c:#{c}"
  b = c / A[N]
  result.unshift(b)
  (N-1).downto(0) do |n|
    C[n+m] -= (A[n] * b)
  end
end

puts result.join(' ')