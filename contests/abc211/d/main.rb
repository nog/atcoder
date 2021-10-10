N, M = gets.split.map(&:to_i)
roads = Array.new N+1
MOD = 10**9 + 7
M.times do
  a, b = gets.split.map(&:to_i)
  roads[a] ||= []
  roads[a].push(b)
  roads[b] ||= []
  roads[b].push(a)
end

counts = Array.new N+1, 0
counts[1] = 1
dis = Array.new N+1
dis[1] = 0

queue = [1]
result = 0
while(q = queue.shift) do 
  # warn "q:#{q}"
  d = dis[q] + 1
  c = counts[q]
  next unless roads[q]
  roads[q].each do |to|
    if !dis[to]
      queue.push(to)
    elsif dis[to] != d
      next
    end
    dis[to] = d
    counts[to] += c
  end
end
# warn roads.inspect
# warn dis.inspect
# warn counts.inspect
puts counts[N] % MOD