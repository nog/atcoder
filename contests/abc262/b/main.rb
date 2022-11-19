N, M = gets.split.map(&:to_i)
routes = Array.new(N+1){ Hash.new }
M.times do |i|
  u, v = gets.split.map(&:to_i)
  routes[u][v] = true
  routes[v][u] = true
end
r = 0

1.upto(N) do |a|
  (a+1).upto(N) do |b|
    next unless routes[a][b]
    (b+1).upto(N) do |c|
      next unless routes[a][c]
      next unless routes[b][c]
      r += 1
    end
  end
end

puts r