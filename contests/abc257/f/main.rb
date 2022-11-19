N, M = gets.split.map(&:to_i)
routes = Array.new(N+1){ Array.new }
M.times do
  u, v = gets.split.map(&:to_i)

  routes[v].push(u)
  if u != 0
    routes[u].push(v)
  end
end

disn = Array.new(N+1)
disn[N] = 0

bfsq = [[N,0]]
while(from, d = bfsq.shift) do
  nd = d + 1
  routes[from].each do |to|
    next if disn[to]
    disn[to] = nd
    bfsq.push([to,nd])
  end
end

dis = Array.new(N+1)
dis[1] = 0
bfsq = [[1,0]]
while(from, d = bfsq.shift) do
  nd = d + 1
  routes[from].each do |to|
    next if dis[to]
    dis[to] = nd
    bfsq.push([to,nd])
  end
end

result_base = [dis[N]].compact
dis_0 = dis[0]
res = []
1.upto(N) do |i|
  result = result_base.dup
  if dis_0 && disn[i]
    result.push(dis_0 + disn[i] )
  end
  if result.size > 0
    res.push result.min
  else
    res.push -1
  end
end

puts res.join(' ')