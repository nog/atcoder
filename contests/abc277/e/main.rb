N, M, K = gets.split.map(&:to_i)

routes = Array.new(2){ Array.new(N+1){ [] }}
M.times do
  u, v, a = gets.split.map(&:to_i)
  routes[a][u].push(v)
  routes[a][v].push(u)
end

S = gets.split.map(&:to_i)
shash = {}
S.each do |s|
  shash[s] = true
end

counts = Array.new(N+1){ Array.new(2) }
counts[1][1] = 0

queue = [[1,1,0]]

while(cur, cura, count = queue.shift) do
  alist = shash[cur] ? [1,0] : [cura]
  nc = count + 1
  alist.each do |a|
    routes[a][cur].each do |to|
      if to == N
        puts nc
        exit
      end
      next if counts[to][a] && counts[to][a] < nc
      counts[to][a] = nc
      queue.push([to, a, nc])
    end
  end
end

res = counts[N].compact
puts res.size > 0 ? res.min : -1