N = gets.to_i

@routes = Array.new(N+1){ Array.new }
(N-1).times do |i|
  u, v = gets.split.map(&:to_i)
  @routes[u].push(v)
  @routes[v].push(u)
end
first = nil
res = []
1.upto(N) do |i|
  if @routes[i].size == 1
    first = i
    break
  end
end

queue = [first]

while(s = queue.shift) do
  cen = @routes[s][0]
  res.push(@routes[cen].size)
  @routes[cen].each do |to|
    if @routes[to].size == 2
      @routes[to].delete(cen)
      n = @routes[to][0]
      @routes[n].delete(to)
      queue.push(n)
    end
  end
end

puts res.sort.join(' ')