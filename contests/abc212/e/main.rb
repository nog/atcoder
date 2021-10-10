N, M, K = gets.split.map(&:to_i)
MOD = 998244353
routes = Hash.new
M.times do |i|
  u, v = gets.split.map(&:to_i)
  routes[u] ||=  {}
  routes[u][v] = true
  routes[v] ||=  {}
  routes[v][u] = true
end

counts = Array.new N, 0
counts[0] = 1

warn routes.inspect