N, M = gets.split.map(&:to_i)
routes = Array.new(N+1){ Array.new }

M.times do |i|
  u, v = gets.split.map(&:to_i)
  routes[u].push(v)
  routes[v].push(u)
end

# warn routes.inspect

dlist = Array.new(N+1)
blacks = []
K = gets.to_i
K.times do
  x, d = gets.split.map(&:to_i)
  queue = [[x,d]]
  ok = false
  b = []
  while(xx, dd = queue.shift) do
    # warn "xx: #{xx} dd:#{dd}"
    next if dlist[xx] && dlist[xx] > dd
    if dd == 0
      b.push(xx)
    else
      dlist[xx] = dd
      nd = dd -1
      routes[xx].each do |nx|
        next if dlist[nx] && dlist[nx] > nd
        # warn "nx:#{nx}"
        if dlist[nx] == nd
          ok = true
          # warn "X:3"
          next
        end
        dlist[nx] = nd if nd > 0
        # warn dlist.inspect
        queue.push([nx, nd])
      end
    end
  end
  next if ok
  if b.size == 0
    # warn "X:2"
    puts 'No'
    exit
  end
  blacks.push(b)
end

# warn dlist.inspect
# warn blacks.inspect
blacks.each do |list|
  unless list.any?{|x| dlist[x] == nil }
    # warn "X:1"
    puts 'No'
    exit
  end
end

dlist.shift
puts 'Yes'
puts dlist.map{|x| x == nil ? 1 : 0}.join('')