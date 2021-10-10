N = gets.to_i

routes = {}
visited = Array.new(N + 1)
visited[1] = 0
(N-1).times do |i|
  a, b = gets.split.map(&:to_i)
  routes[a] ||= []
  routes[b] ||= []
  routes[a].push(b)
  routes[b].push(a)
end
1.upto(N) do |i|
  routes[i].sort!
end

cur = 1
result = [1]

while(true) do
  ro = routes[cur]
  ne = nil
  while(to = ro.shift) do
    unless visited[to]
      ne = to
      break
    end
  end
  if ne
    visited[ne] = cur
    cur = ne
  elsif visited[cur]
    cur = visited[cur]
    if cur == 0
      puts result.join(' ')
      exit
    end
  end
  result.push(cur)
end