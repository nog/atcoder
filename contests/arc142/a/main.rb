N, K = gets.split.map(&:to_i)

results = {}

def check x
  return false if x > N
  min = x
  done = {}
  while(true) do
    if done[x]
      return done.keys.min == K
    end
    min = x if x < min
    done[x] = true
    x = rev(x)
  end
end

def rev x
  x.to_s.split('').reverse.join('').to_i
end

results[K] = true if check(K)
k = K
while(true) do
  k = k * 10
  if k <= N
    results[k] = true if check(k)
  else
    break
  end
end

k = rev(K)
results[k] = true if check(k)
while(true) do
  k = k * 10
  if k <= N
    results[k] = true if check(k)
  else
    break
  end
end
puts results.keys.count