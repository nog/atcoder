N, Q = gets.split.map(&:to_i)
X = gets.split.map(&:to_i)

@routes = {}
(N-1).times do
  a, b = gets.split.map(&:to_i)
  @routes[a] ||= []
  @routes[a].push(b)
  @routes[b] ||= []
  @routes[b].push(a)
end

@rlist = Array.new N+1
def calc point, parent
  lis = []
  @routes[point].each do |ch|
    next if ch == parent
    lis.push(*calc(ch, point))
  end
  lis.push(X[point-1])
  lis.sort!.reverse!
  lis = lis[0..19]
  @rlist[point] = lis  
  return lis
end
calc 1, 0
# warn @rlist.inspect


Q.times do
  v, k = gets.split.map(&:to_i)
  puts @rlist[v][k-1]
end