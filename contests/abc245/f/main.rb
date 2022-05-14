N, M = gets.split.map(&:to_i)
routes = {}
revs = {}
M.times do
  u, v = gets.split.map(&:to_i)
  routes[u] ||= []
  routes[u].push(v) 
  revs[v] ||= []
  revs[v].push(u)
end

deleted = {}
nqueue = {}
queue = []
1.upto(N) do |i|
  unless routes[i]
    deleted[i] = true
    (revs[i] || []).each do |from|
      nqueue[from] = true
    end
  end
end

while(nqueue.keys.size > 0) do
  queue = nqueue.keys
  nqueue = {}
  while(q=queue.shift) do
    next if deleted[q]
    if (routes[q] || []).all?{|to| deleted[to]}
      deleted[q] = true
      (revs[q] || []).each do |from|
        next if deleted[from]
        nqueue[from] = true
      end
    end
  end
end

puts N - deleted.keys.size