N = gets.to_i
sx, sy, tx, ty = gets.split.map(&:to_i)
xyr = []
shash = {}
thash = {}
routes = {}
N.times do |i|
  x, y, r = gets.split.map(&:to_i)
  r2 = r**2
  if (sx - x)**2 + (sy - y) ** 2 == r2
    shash[i] = true
  end
  if (tx - x)**2 + (ty - y)**2 == r2
    thash[i] = true
  end

  xyr.each do |j,jx,jy,jr|
    d2 = (x-jx)**2 + (y-jy)**2
    if (r+jr)**2 >= d2 && (r-jr)**2 <= d2
      routes[i] ||= []
      routes[i].push(j)
      routes[j] ||= []
      routes[j].push(i)
    end
  end
  xyr.push([i,x,y,r])
end

done = {}
queue = shash.keys
queue.each do |q|
  done[q] = true
  if thash[q]
    puts 'Yes'
    exit
  end
end
# warn routes.inspect
while(q = queue.shift) do
  (routes[q] || []).each do |to|
    if thash[to]
      puts 'Yes'
      exit
    end
    next if done[to]
    queue.push(to)
    done[to] = true
  end
end


puts 'No'