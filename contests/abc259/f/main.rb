N = gets.to_i
D = gets.split.map(&:to_i)
(N-1).times do |i|
  u, v, w = gets.split.map(&:to_i)
  u -= 1
  v -= 1

  routes[u] ||= {}
  routes[u][v] = w
  routes[v] ||= {}
  routes[v][u] = w
end


def dfs i, parent
  res = []
  routes[i].each do |to|
    next if to == parent
    res.push(dfs(to, i))
  end
  if res.size == 0
    if D[i] == 1
      return 0, true
    else
      return 0, false
    end
  else
    res.each 
  end
end

puts dfs 0, -1