N, M = gets.split.map(&:to_i)
@routes = {}
M.times do |i|
  u, v = gets.split.map(&:to_i)
  @routes[u] ||= []
  @routes[v] ||= []
  @routes[u].push(v)
  @routes[v].push(u)
end

@result1 = []
@done1 = {}
def search1(cur)
  @done1[cur] = true
  @routes[cur].each do |to|
    next if @done1[to]
    @result1.push([cur, to])
    search1(to)
  end
end
search1(1)

@result2 = []
@done2 = {}
@queue = [1]
@done2[1] = true
while(cur = @queue.shift) do
  @routes[cur].each do |to|
    next if @done2[to]
    @result2.push([cur,to])
    @done2[to] = true
    @queue.push(to)
  end
end

@result1.each do |l|
  puts l.join(' ')
end
@result2.each do |l|
  puts l.join(' ')
end