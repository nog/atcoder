N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

x = 0

k = K
history = {}
cnt = 0
while(k>0) do
  mx = x % N
  a = A[mx]
  x += a
  k -= 1
  cnt += 1
  if history[mx]
    hx, hcnt = history[mx]
    dcnt = cnt - hcnt
    next if dcnt > k
    dx = x - hx
    x += dx * (k / dcnt)
    cnt += k - (k % dcnt)
    k = k % dcnt
  else
    history[mx] ||= [x, cnt]
  end
end

puts x