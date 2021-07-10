N, M = gets.split.map(&:to_i)
INF = 10**12
# routes = Array.new(N*(N+1),INF)
routes = Array.new(N+1){ Array.new(N+1, INF) }
sum = 0
routes_to = Array.new(N+1)
routes_from = Array.new(N+1)

M.times do |i|
  a, b, c = gets.split.map(&:to_i)
  routes[a][b] = c
  sum += c
  routes_to[b] = true
  routes_from[a] = true
end

1.upto(N) do |i|
  routes[i][i] = 0
end

result = 0
k = 0
while((k+=1)<=N) do
  if routes_to[k] && routes_from[k]
    routes_k = routes[k]
    f = 0
    while((f+=1)<=N) do
      next if f == k
      routes_f = routes[f]
      next if (fk = routes_f[k]) == INF
      t = 0
      while((t+=1)<=N) do
        kt = routes_k[t]
        ft = routes_f[t]
        ft 
        unless k == t || ((kt = routes_k[t]) == INF) || (ft = routes_f[t]) <= (fkt = fk + kt)
          sum = (ft == INF) ? sum + fkt : sum - ft + fkt
          routes_f[t] = fkt
        end
      end
    end
  end
  result += sum
end

puts result