N, Q = gets.split.map(&:to_i)

routes = Array.new(N+1){ Hash.new }
res = N
Q.times do
  q, u, v= gets.split.map(&:to_i)
  if q == 1
    routes[u][v] = 1
    routes[v][u] = 1
    if routes[u].keys.size == 1
      res -= 1
    end
    if routes[v].keys.size == 1
      res -= 1
    end
  else
    if routes[u].keys.size > 0
      routes[u].keys.each do |v|
        if routes[v].keys.size == 1
          res += 1
          routes[v] = Hash.new
        else
          routes[v].delete(u)
        end
      end
      routes[u] = Hash.new
      res += 1
    end
  end
  puts res
end