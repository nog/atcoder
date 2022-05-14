N, M = gets.split.map(&:to_i)
@routes = Array.new(N){ Array.new }
M.times do
  u, v = gets.split.map(&:to_i)
  u -= 1
  v -= 1
  @routes[u].push(v)
  @routes[v].push(u)
end
result = 0
[true, false].repeated_permutation(N).each do |ar|
  hash = {}
  N.times do |i|
    queue.push(i) if ar[i]
  end
  len = 0
  while(q = queue.shift) do
  end
  result += len
end
