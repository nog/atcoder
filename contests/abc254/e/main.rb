N, M = gets.split.map(&:to_i)
routes = Array.new(N+1){ Array.new }
M.times do
  a, b = gets.split.map(&:to_i)
  routes[a].push(b)
  routes[b].push(a)
end
Q = gets.to_i
Q.times do
  x, k = gets.split.map(&:to_i)
  if k == 0
    puts x
    next
  end
  if k == 1
    puts routes[x].sum + x
    next
  end

  done = {
    x => true
  }
  routes[x].each do |po|
    done[po] = true
  end
  queue = routes[x].map{|po| [po, k-1]}
  while(po, _k = queue.shift) do
    routes[po].each do |np|
      next if done[np]
      queue.push([np, _k-1]) if _k > 1
      done[np] = true
    end
  end
  puts done.keys.sum
end